-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: my_blog
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `author` varchar(35) DEFAULT NULL,
  `content` longtext,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (2,'Gon Freecss','gon405','<p>Gon Freecss&nbsp;is the main protagonist of the anime/manga series&nbsp;<em>Hunter &times; Hunter</em>, he is the son of the famous Hunter&nbsp;Ging Freecss. Finding the whereabouts of his father is Gon&#39;s primary motivation in becoming a licensed Hunter.</p>\r\n\r\n<p>He is voiced by&nbsp;Junko Takeuchi&nbsp;in the original Japanese version of the 1999 anime, who also voiced&nbsp;Naruto<a href=\"https://hero.fandom.com/wiki/Naruto_Uzumaki\"> </a>Uzumaki&nbsp;of the same name,&nbsp;Red&nbsp;from&nbsp;<em>Pok&eacute;mon Origins</em>, and&nbsp;Gumball Watterson&nbsp;from&nbsp;<em>The Amazing World of Gumball</em>, and by&nbsp;Elinor Holt&nbsp;in the English dub, while in the 2011 anime he is voiced by&nbsp;Megumi Han&nbsp;in the original Japanese version and&nbsp;Erica Mendez&nbsp;in the English dub, both who also voiced&nbsp;Atsuko Kagari&nbsp;from&nbsp;<em>Little Witch Academia</em>. Mendez also provided the voices of&nbsp;Megumin&nbsp;from&nbsp;<em>KonoSuba: God&#39;s Blessing on this Wonderful World!</em>&nbsp;and&nbsp;Kamisato Ayaka&nbsp;from&nbsp;<em>Genshin Impact</em>.</p>\r\n\r\n<p><img alt=\"\" src=\"https://upload.wikimedia.org/wikipedia/en/a/a1/GonFreecsmanga.png\" /></p>\r\n','2023-05-01 11:09:38'),(4,'Walter White (aka Heisenberg)','heisenberg','<p>Walter Hartwell &quot;Walt&quot; White Sr., also known by his clandestine pseudonym and business moniker Heisenberg and also frequently referred to as Mr. White, is an American former chemist and major narcotics distributor from Albuquerque, New Mexico, whose drug empire became the largest meth operation in American history, surpassing both Gustavo Fring&#39;s drug empire and the Cartel&#39;s. Before entering the drug trade, Walt was a respected chemist and scientist who later worked as an overqualified high school chemistry teacher at J. P. Wynne High School alongside working at the A1A Car Wash to financially support his family (his wife Skyler, son Walt Jr., and infant daughter Holly). After being diagnosed with terminal lung cancer, Walt started manufacturing chemically pure crystal methamphetamine to provide for his family upon his death. Knowing nothing about the drug trade, Walt enlisted the aid of his former student, Jesse Pinkman, to sell the meth he produced.</p>\r\n\r\n<p>Walt&#39;s scientific knowledge and dedication to quality lead him to produce crystal meth that is purer and more potent than any competitors&#39;. To avoid the tedious collection of pseudoephedrine required for production, Walt devises an alternative chemical process utilizing methylamine, giving his product a distinctive blue colour. His crystal meth, which is given the street name &quot;Blue Sky,&quot; dominates the market, leading to confrontations with established drug makers and dealers. Although Walt and Jesse began as amateur small-time meth cooks, manufacturing the drug out of an RV in the deserts of New Mexico, and being met with very limited success, Walt and Jesse soon climbed up the drug hierarchy, killing or systematically destroying anyone who impeded them. Because of his drug-related activities, Walt eventually finds himself at odds with his family, the Drug Enforcement Administration (DEA) through his brother-in-law and accomplished DEA agent Hank Schrader, the local gangs, and the Mexican drug cartels (including their regional distributors), putting him and his family&#39;s lives at risk.</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<strong><img alt=\"\" class=\"left\" src=\"https://upload.wikimedia.org/wikipedia/tr/0/03/Walter_White_S5B.png\" style=\"height:365px; width:273px\" /></strong></p>\r\n\r\n<p>Walt adopted the clandestine pseudonym and business moniker &quot;Heisenberg&quot; (referencing the theoretical physicist Werner Karl Heisenberg) as an alias as he immersed himself in the drug trade. While initially heavily reluctant to use violence, Walt gradually came to see it as a necessity, and eventually developed into a ruthless drug lord motivated largely by vanity, ego, and greed. He also comes to find his new status as a drug lord psychologically rewarding, leading him to become increasingly willing to resort to criminal acts such as theft, extortion, money laundering, depraved indifference, and murder. He employs a number of enforcers, and has personally killed both rivals and allies. Walt&#39;s descent into the criminal underworld unearthed immense levels of deeply repressed ambition, rage, resentment, vanity, and an increasing ruthlessness. Walt soon worked his way up to the international level in the drug trade, becoming a famous and feared drug kingpin. By the time he retired from the drug business permanently, Walt had accumulated over $80 million USD from his involvement in the drug trade.</p>\r\n','2023-05-01 18:03:53'),(5,'print(\"Say my name.\")','heisenberg','<pre class=\"prettyprint\">\r\nprint(&quot;Say my name.&quot;)\r\n</pre>\r\n\r\n<p><img alt=\"\" src=\"https://media.tenor.com/QDXxDo2VMHMAAAAC/breaking-bad.gif\" /></p>\r\n','2023-05-01 18:07:01');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-01 23:38:19
