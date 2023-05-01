from flask import Flask, render_template, flash, redirect, url_for, session, logging, request
from flask_mysqldb import MySQL
from wtforms import Form, StringField, TextAreaField, PasswordField, validators
from passlib.hash import sha256_crypt
from functools import wraps

#Login Required Decorator
def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if "logged_in" in session:
            return f(*args, **kwargs)
        
        else:
            flash("To view this page, please log in.", "warning")

            return redirect(url_for("login"))
        
    return decorated_function


#Register WTF
class RegisterForm(Form):
    name = StringField("Full Name", validators=[validators.length(min = 4, max = 30)])
    username = StringField("Username", validators=[validators.length(min = 5, max = 35)])
    email = StringField("E-mail Adress", validators=[validators.Email(message="Please enter a valid e-mail adress.")])
    password = PasswordField("Password", validators=[validators.DataRequired(message="Please enter a password."), validators.EqualTo(fieldname= "confirm", message="This password is not correct.")])
    confirm = PasswordField("Confirm password")

#Login WTF
class LoginForm(Form):
    username = StringField("Username")
    password = PasswordField("Password")

#Article Form
class ArticleForm(Form):
    title = StringField("Article's Title", validators=[validators.length(max = 100)])
    content = TextAreaField("Article's Content", validators=[validators.length(min = 10)])

app = Flask(__name__)

app.secret_key = "charticle"

app.config["MYSQL_HOST"] = "localhost"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = "12345"
app.config["MYSQL_DB"] = "my_blog"
app.config["MYSQL_HOST"] = "localhost"
app.config["MYSQL_CURSORCLASS"] = "DictCursor"

mysql = MySQL(app)

@app.route("/")
def index():
    return render_template("index.html")


@app.route("/about")
def about():
    return render_template("about.html")


@app.route("/articles")
def articles():
    cursor = mysql.connection.cursor()

    query = "SELECT * FROM articles"

    query_result = cursor.execute(query)

    if query_result > 0:
        articles = cursor.fetchall()
        return render_template("articles.html", articles = articles)

    else:
        return render_template("articles.html")


@app.route("/article/<string:id>")
def article(id):
    cursor = mysql.connection.cursor()

    query = "SELECT * FROM articles WHERE id = %s"

    query_result = cursor.execute(query, (id,))

    if query_result > 0:
        article = cursor.fetchone()

        return render_template("article.html", article = article)
    
    else:
        return render_template("article.html")
    

@app.route("/delete/<string:id>")
@login_required
def delete_article(id):
    cursor = mysql.connection.cursor()

    query = "SELECT * FROM articles WHERE author = %s AND id = %s"

    query_result = cursor.execute(query, (session["username"], id))

    if query_result > 0:
        query_delete = "DELETE FROM articles WHERE id = %s"

        cursor.execute(query_delete, (id,))

        mysql.connection.commit()

        flash("The article has successfully deleted.", "success")

        return redirect(url_for("dashboard"))
    
    else:
        flash("There isn't an article with this ID or you aren't allowed to delete this article.")

        return redirect(url_for("index"))

@app.route("/edit/<string:id>", methods = ["GET", "POST"])
@login_required
def edit_article(id):
    if request.method == "GET":
        cursor = mysql.connection.cursor()

        query = "SELECT * FROM articles WHERE author = %s AND id = %s"

        query_result = cursor.execute(query, (session["username"], id))

        if query_result == 0:
            flash("There isn't an article with this ID or you aren't allowed to edit this article.")

            return redirect(url_for("index"))

        else:
            article = cursor.fetchone()

            form = ArticleForm()

            form.title.data = article["title"]
            form.content.data = article["content"]

            return render_template("edit.html", form = form)

    else:
        # Post
        form = ArticleForm(request.form)

        new_title = form.title.data
        new_content = form.content.data

        query_second = "UPDATE articles SET title = %s, content = %s WHERE id = %s"

        cursor = mysql.connection.cursor()

        cursor.execute(query_second, (new_title, new_content, id))

        mysql.connection.commit()

        flash("The article has successfully edited.", "success")

        return redirect(url_for("dashboard"))


@app.route("/add_article", methods = ["GET", "POST"])
def add_article():
    form = ArticleForm(request.form)

    if request.method == "POST" and form.validate():
        new_title = form.title.data
        new_content = form.content.data

        cursor = mysql.connection.cursor()

        query = "INSERT INTO articles (title, author, content) VALUES(%s, %s, %s)"

        cursor.execute(query, (new_title, session["username"], new_content))

        mysql.connection.commit()

        cursor.close()

        flash("The article has successfully added.", "success")

        return redirect(url_for("dashboard"))
    
    return render_template("add_article.html", form = form)


@app.route("/dashboard")
@login_required
def dashboard():
    cursor = mysql.connection.cursor()

    query = "SELECT * FROM articles WHERE author= %s"

    query_result = cursor.execute(query, (session["username"],))

    if query_result > 0:
        articles = cursor.fetchall()

        return render_template("dashboard.html", articles = articles)

    else:
        return render_template("dashboard.html")


@app.route("/register", methods = ["GET", "POST"])
def register():
    form = RegisterForm(request.form)
    
    if request.method == "POST" and form.validate():
        reg_name = form.name.data
        reg_username = form.username.data
        reg_email = form.email.data
        reg_password = sha256_crypt.encrypt(form.password.data)

        cursor = mysql.connection.cursor()

        query = "INSERT INTO users (name, email, username, password) VALUES (%s, %s, %s, %s)"

        cursor.execute(query, (reg_name, reg_email, reg_username, reg_password))

        mysql.connection.commit()

        cursor.close()

        flash("Great! You've successfully registered.","success")

        return redirect(url_for("login"))
    
    else:
        return render_template("register.html", form = form)


@app.route("/login", methods = ["GET", "POST"])
def login():
    form = LoginForm(request.form)

    if request.method == "POST":
        log_username = form.username.data
        log_password = form.password.data

        cursor = mysql.connection.cursor()

        query = "SELECT * FROM users WHERE username = %s"

        result = cursor.execute(query, (log_username,))

        if result > 0:
            user_data = cursor.fetchone()
            true_password = user_data["password"]

            if sha256_crypt.verify(log_password, true_password):
                flash("You've successfully logged in.", "success")
                
                session["logged_in"] = True
                session["username"] = log_username

                return redirect(url_for("index"))
            
            else:
                flash("Password is incorrect.", "danger")
                
                return redirect(url_for("login"))

        else:
            flash("Oops, there is no user with this username.", "danger")
            
            return redirect(url_for("login"))
        
    return render_template("login.html", form = form)


@app.route("/logout")
def logout():
    session.clear()

    return redirect(url_for("index"))


@app.route("/search", methods = ["GET", "POST"])
def search():
    if request.method == "GET":
        return redirect(url_for("index"))
    
    else:
        keyword = request.form.get("keyword")

        cursor = mysql.connection.cursor()

        query = "SELECT * FROM articles WHERE title OR author OR content LIKE '%" + keyword + "%'"

        query_result = cursor.execute(query)

        if query_result == 0:
            flash("Nothing has found with this keyword on the blog.", "warning")

            return  redirect(url_for("articles"))
        
        else:
            articles = cursor.fetchall()
            flash("Here are the search results!", "success")

            return render_template("articles.html", articles = articles)    


@app.route("/user")
@login_required
def user():
    cursor = mysql.connection.cursor()

    query = "SELECT * FROM articles WHERE author= %s"

    query_result = cursor.execute(query, (session["username"],))

    if query_result > 0:
        articles = cursor.fetchall()

        return render_template("user.html", articles = articles)

    else:
        return render_template("user.html")

if __name__ == "__main__":
    app.run(debug = True)
