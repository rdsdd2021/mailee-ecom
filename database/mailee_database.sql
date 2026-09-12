/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-12.3.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: fleetcart
-- ------------------------------------------------------
-- Server version	12.3.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` varchar(191) NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`),
  CONSTRAINT `activations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES
(1,1,'xSpBTLMEj56p4yrkjYMy6dSB2jksvizJ',1,'2026-08-22 07:27:47','2026-08-22 01:57:47','2026-08-22 01:57:47');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `address_1` varchar(191) NOT NULL,
  `address_2` varchar(191) DEFAULT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) NOT NULL,
  `zip` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_customer_id_foreign` (`customer_id`),
  CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES
(1,1,'Ramanuj','Dey Sarkar','24/2, Deshbandhu Para NJP Main Rd','Ward 30, Deshbandhu Para','Siliguri','COX','734004','BD','2026-08-22 08:42:18','2026-08-22 08:42:18');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `attribute_categories`
--

DROP TABLE IF EXISTS `attribute_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_categories` (
  `attribute_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`attribute_id`,`category_id`),
  KEY `attribute_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `attribute_categories_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_categories`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `attribute_categories` WRITE;
/*!40000 ALTER TABLE `attribute_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `attribute_set_translations`
--

DROP TABLE IF EXISTS `attribute_set_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_set_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_set_translations_attribute_set_id_locale_unique` (`attribute_set_id`,`locale`),
  CONSTRAINT `attribute_set_translations_attribute_set_id_foreign` FOREIGN KEY (`attribute_set_id`) REFERENCES `attribute_sets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_set_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `attribute_set_translations` WRITE;
/*!40000 ALTER TABLE `attribute_set_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_set_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `attribute_sets`
--

DROP TABLE IF EXISTS `attribute_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_sets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_sets`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `attribute_sets` WRITE;
/*!40000 ALTER TABLE `attribute_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_sets` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `attribute_translations`
--

DROP TABLE IF EXISTS `attribute_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`),
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `attribute_translations` WRITE;
/*!40000 ALTER TABLE `attribute_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `attribute_value_translations`
--

DROP TABLE IF EXISTS `attribute_value_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_value_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_value_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `value` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_value_translations_attribute_value_id_locale_unique` (`attribute_value_id`,`locale`),
  CONSTRAINT `attribute_value_translations_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_value_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `attribute_value_translations` WRITE;
/*!40000 ALTER TABLE `attribute_value_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_value_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `attribute_values`
--

DROP TABLE IF EXISTS `attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_values_attribute_id_index` (`attribute_id`),
  CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_values`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `attribute_values` WRITE;
/*!40000 ALTER TABLE `attribute_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_values` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` int(10) unsigned NOT NULL,
  `is_filterable` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_slug_unique` (`slug`),
  KEY `attributes_attribute_set_id_index` (`attribute_set_id`),
  CONSTRAINT `attributes_attribute_set_id_foreign` FOREIGN KEY (`attribute_set_id`) REFERENCES `attribute_sets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `blog_categories`
--

DROP TABLE IF EXISTS `blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_categories`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `blog_categories` WRITE;
/*!40000 ALTER TABLE `blog_categories` DISABLE KEYS */;
INSERT INTO `blog_categories` VALUES
(1,'tech-gadgets','2026-08-22 08:36:13','2026-08-22 08:36:13'),
(2,'buyers-guides','2026-08-22 08:36:13','2026-08-22 08:36:13'),
(3,'lifestyle-design','2026-08-22 08:36:13','2026-08-22 08:36:13');
/*!40000 ALTER TABLE `blog_categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `blog_category_translations`
--

DROP TABLE IF EXISTS `blog_category_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_category_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blog_category_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_category_translations_blog_category_id_locale_unique` (`blog_category_id`,`locale`),
  CONSTRAINT `blog_category_translations_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `blog_category_translations` WRITE;
/*!40000 ALTER TABLE `blog_category_translations` DISABLE KEYS */;
INSERT INTO `blog_category_translations` VALUES
(1,1,'en','Tech & Gadgets'),
(2,2,'en','Buyer\'s Guides'),
(3,3,'en','Lifestyle & Design');
/*!40000 ALTER TABLE `blog_category_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `blog_post_blog_tag`
--

DROP TABLE IF EXISTS `blog_post_blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_post_blog_tag` (
  `blog_post_id` bigint(20) unsigned NOT NULL,
  `blog_tag_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`blog_post_id`,`blog_tag_id`),
  KEY `blog_post_blog_tag_blog_tag_id_foreign` (`blog_tag_id`),
  CONSTRAINT `blog_post_blog_tag_blog_post_id_foreign` FOREIGN KEY (`blog_post_id`) REFERENCES `blog_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blog_post_blog_tag_blog_tag_id_foreign` FOREIGN KEY (`blog_tag_id`) REFERENCES `blog_tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post_blog_tag`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `blog_post_blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_post_blog_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_post_blog_tag` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `blog_post_translations`
--

DROP TABLE IF EXISTS `blog_post_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_post_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blog_post_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_post_translations_blog_post_id_locale_unique` (`blog_post_id`,`locale`),
  FULLTEXT KEY `title` (`title`),
  CONSTRAINT `blog_post_translations_blog_post_id_foreign` FOREIGN KEY (`blog_post_id`) REFERENCES `blog_posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `blog_post_translations` WRITE;
/*!40000 ALTER TABLE `blog_post_translations` DISABLE KEYS */;
INSERT INTO `blog_post_translations` VALUES
(4,4,'en','The Secret Behind Siliguri’s Legendary Steamed Momos','<p>Discover the art of paper-thin translucent pastry wrappers and juicy Himalayan herbs that make authentic Siliguri momos an unforgettable culinary experience.</p>'),
(5,5,'en','Why -18°C Cryogenic Freezing Keeps Parathas Flaky Without Preservatives','<p>How rapid cryogenic blast freezing preserves 100% of moisture and taste within 20 minutes, giving you hot restaurant-quality flaky parathas straight from your pan.</p>'),
(6,6,'en','5 Easy Mountain Party Snack Ideas Ready Under 5 Minutes','<p>From crispy golden spring rolls to fiery Schezwan fried momos, elevate your evening gatherings and chai time with zero prep hassle.</p>');
/*!40000 ALTER TABLE `blog_post_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `blog_posts`
--

DROP TABLE IF EXISTS `blog_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `blog_category_id` bigint(20) unsigned DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `publish_status` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_posts_slug_unique` (`slug`),
  KEY `blog_posts_user_id_foreign` (`user_id`),
  KEY `blog_posts_blog_category_id_foreign` (`blog_category_id`),
  CONSTRAINT `blog_posts_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `blog_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_posts`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `blog_posts` WRITE;
/*!40000 ALTER TABLE `blog_posts` DISABLE KEYS */;
INSERT INTO `blog_posts` VALUES
(4,1,NULL,'the-secret-behind-siliguris-legendary-steamed-momos','published','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(5,1,NULL,'why-18c-cryogenic-freezing-keeps-parathas-flaky-without-preservatives','published','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(6,1,NULL,'5-easy-mountain-party-snack-ideas-ready-under-5-minutes','published','2026-09-10 20:08:33','2026-09-10 20:08:33');
/*!40000 ALTER TABLE `blog_posts` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `blog_tag_translations`
--

DROP TABLE IF EXISTS `blog_tag_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_tag_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blog_tag_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_tag_translations_blog_tag_id_locale_unique` (`blog_tag_id`,`locale`),
  CONSTRAINT `blog_tag_translations_blog_tag_id_foreign` FOREIGN KEY (`blog_tag_id`) REFERENCES `blog_tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `blog_tag_translations` WRITE;
/*!40000 ALTER TABLE `blog_tag_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_tag_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `blog_tags`
--

DROP TABLE IF EXISTS `blog_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_tags_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tags`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `blog_tags` WRITE;
/*!40000 ALTER TABLE `blog_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_tags` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `brand_translations`
--

DROP TABLE IF EXISTS `brand_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brand_translations_brand_id_locale_unique` (`brand_id`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `brand_translations` WRITE;
/*!40000 ALTER TABLE `brand_translations` DISABLE KEYS */;
INSERT INTO `brand_translations` VALUES
(1,1,'en','Apple'),
(2,2,'en','Sony'),
(3,3,'en','Samsung'),
(4,4,'en','Nike'),
(5,5,'en','Dell'),
(6,6,'en','Bose'),
(7,7,'en','Canon'),
(8,8,'en','Adidas'),
(9,9,'en','Logitech'),
(10,10,'en','LG');
/*!40000 ALTER TABLE `brand_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES
(1,'apple',1,'2026-08-22 08:36:12','2026-08-22 08:36:12'),
(2,'sony',1,'2026-08-22 08:36:12','2026-08-22 08:36:12'),
(3,'samsung',1,'2026-08-22 08:36:12','2026-08-22 08:36:12'),
(4,'nike',1,'2026-08-22 08:36:12','2026-08-22 08:36:12'),
(5,'dell',1,'2026-08-22 08:36:12','2026-08-22 08:36:12'),
(6,'bose',1,'2026-08-22 08:36:12','2026-08-22 08:36:12'),
(7,'canon',1,'2026-08-22 08:36:12','2026-08-22 08:36:12'),
(8,'adidas',1,'2026-08-22 08:36:12','2026-08-22 08:36:12'),
(9,'logitech',1,'2026-08-22 08:36:12','2026-08-22 08:36:12'),
(10,'lg',1,'2026-08-22 08:36:12','2026-08-22 08:36:12');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` varchar(191) NOT NULL,
  `data` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_id_index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES
('3FWHy1cDDRYoH3IecRFQOpF21ymIix7MsiITNELO_cart_conditions','a:0:{}','2026-08-22 08:38:45','2026-08-22 08:42:19'),
('3FWHy1cDDRYoH3IecRFQOpF21ymIix7MsiITNELO_cart_items','a:0:{}','2026-08-22 08:38:41','2026-08-22 08:42:19'),
('7G4uwIgDmr5Kbw7RIe31J9z9cRfi72RcM62Vq5TC_cart_items','O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"1cf943effc0beb669217e490e915a48d\";O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:8:\"\0*\0items\";a:6:{s:2:\"id\";s:32:\"1cf943effc0beb669217e490e915a48d\";s:4:\"name\";s:39:\"Classic Chicken Momo (1 Kg Retail Pack)\";s:5:\"price\";d:364;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:6:{s:7:\"product\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:22:{s:2:\"id\";i:69;s:8:\"brand_id\";N;s:12:\"tax_class_id\";N;s:4:\"slug\";s:24:\"classic-chicken-momo-1kg\";s:5:\"price\";s:8:\"520.0000\";s:13:\"special_price\";s:8:\"364.0000\";s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-09-10\";s:17:\"special_price_end\";s:10:\"2029-09-11\";s:13:\"selling_price\";s:8:\"364.0000\";s:3:\"sku\";s:9:\"ML-AC3C16\";s:12:\"manage_stock\";i:0;s:3:\"qty\";i:5000;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:2;s:9:\"is_active\";i:1;s:8:\"new_from\";N;s:6:\"new_to\";N;s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"is_virtual\";i:0;}s:11:\"\0*\0original\";a:22:{s:2:\"id\";i:69;s:8:\"brand_id\";N;s:12:\"tax_class_id\";N;s:4:\"slug\";s:24:\"classic-chicken-momo-1kg\";s:5:\"price\";s:8:\"520.0000\";s:13:\"special_price\";s:8:\"364.0000\";s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-09-10\";s:17:\"special_price_end\";s:10:\"2029-09-11\";s:13:\"selling_price\";s:8:\"364.0000\";s:3:\"sku\";s:9:\"ML-AC3C16\";s:12:\"manage_stock\";i:0;s:3:\"qty\";i:5000;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:2;s:9:\"is_active\";i:1;s:8:\"new_from\";N;s:6:\"new_to\";N;s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"is_virtual\";i:0;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:4:{s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:43:\"Modules\\Product\\Entities\\ProductTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:20:\"product_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:69;s:10:\"product_id\";i:69;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:39:\"Classic Chicken Momo (1 Kg Retail Pack)\";s:11:\"description\";s:294:\"<p>Traditional Darjeeling chicken momo crafted with tender chicken, hill onions, ginger, and authentic mountain herbs. 100% preservative-free, frozen at -18°C.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>\";s:17:\"short_description\";s:157:\"Traditional Darjeeling chicken momo crafted with tender chicken, hill onions, ginger, and authentic mountain herbs. 100% preservative-free, frozen at -18°C.\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:69;s:10:\"product_id\";i:69;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:39:\"Classic Chicken Momo (1 Kg Retail Pack)\";s:11:\"description\";s:294:\"<p>Traditional Darjeeling chicken momo crafted with tender chicken, hill onions, ginger, and authentic mountain herbs. 100% preservative-free, frozen at -18°C.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>\";s:17:\"short_description\";s:157:\"Traditional Darjeeling chicken momo crafted with tender chicken, hill onions, ginger, and authentic mountain herbs. 100% preservative-free, frozen at -18°C.\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:5:\"files\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:10:{s:2:\"id\";i:73;s:7:\"user_id\";i:1;s:8:\"filename\";s:24:\"classic_chicken_momo.jpg\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:30:\"media/classic_chicken_momo.jpg\";s:9:\"extension\";s:3:\"jpg\";s:4:\"mime\";s:10:\"image/jpeg\";s:4:\"size\";s:6:\"221696\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";}s:11:\"\0*\0original\";a:17:{s:2:\"id\";i:73;s:7:\"user_id\";i:1;s:8:\"filename\";s:24:\"classic_chicken_momo.jpg\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:30:\"media/classic_chicken_momo.jpg\";s:9:\"extension\";s:3:\"jpg\";s:4:\"mime\";s:10:\"image/jpeg\";s:4:\"size\";s:6:\"221696\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";s:15:\"pivot_entity_id\";i:69;s:13:\"pivot_file_id\";i:73;s:17:\"pivot_entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:8:\"pivot_id\";i:128;s:10:\"pivot_zone\";s:10:\"base_image\";s:16:\"pivot_created_at\";s:19:\"2026-09-11 11:15:23\";s:16:\"pivot_updated_at\";s:19:\"2026-09-11 11:15:23\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:5:\"pivot\";O:49:\"Illuminate\\Database\\Eloquent\\Relations\\MorphPivot\":36:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:12:\"entity_files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:69;s:7:\"file_id\";i:73;s:2:\"id\";i:128;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";}s:11:\"\0*\0original\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:69;s:7:\"file_id\";i:73;s:2:\"id\";i:128;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:13:\"\0*\0foreignKey\";s:9:\"entity_id\";s:13:\"\0*\0relatedKey\";s:7:\"file_id\";s:12:\"\0*\0morphType\";s:11:\"entity_type\";s:13:\"\0*\0morphClass\";s:32:\"Modules\\Product\\Entities\\Product\";}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"categories\";O:26:\"TypiCMS\\NestableCollection\":8:{s:8:\"\0*\0items\";a:1:{i:0;O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:41;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"authentic-himalayan-momos\";s:8:\"position\";i:0;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";}s:11:\"\0*\0original\";a:10:{s:2:\"id\";i:41;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"authentic-himalayan-momos\";s:8:\"position\";i:0;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";s:16:\"pivot_product_id\";i:69;s:17:\"pivot_category_id\";i:41;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:2:{s:5:\"pivot\";O:44:\"Illuminate\\Database\\Eloquent\\Relations\\Pivot\":34:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:18:\"product_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:10:\"product_id\";i:69;s:11:\"category_id\";i:41;}s:11:\"\0*\0original\";a:2:{s:10:\"product_id\";i:69;s:11:\"category_id\";i:41;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}s:13:\"\0*\0foreignKey\";s:10:\"product_id\";s:13:\"\0*\0relatedKey\";s:11:\"category_id\";}s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:45:\"Modules\\Category\\Entities\\CategoryTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:21:\"category_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:4:{s:2:\"id\";i:41;s:11:\"category_id\";i:41;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:25:\"Authentic Himalayan Momos\";}s:11:\"\0*\0original\";a:4:{s:2:\"id\";i:41;s:11:\"category_id\";i:41;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:25:\"Authentic Himalayan Momos\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:4:\"name\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:8:\"\0*\0total\";i:1;s:15:\"\0*\0parentColumn\";s:9:\"parent_id\";s:33:\"\0*\0removeItemsWithMissingAncestor\";b:1;s:14:\"\0*\0indentChars\";s:8:\"    \";s:15:\"\0*\0childrenName\";s:5:\"items\";s:17:\"\0*\0parentRelation\";s:6:\"parent\";}s:8:\"taxClass\";O:29:\"Modules\\Tax\\Entities\\TaxClass\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:11:\"tax_classes\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:3:{s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:8:\"based_on\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:20:\"translatedAttributes\";a:1:{i:0;s:5:\"label\";}s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0forceDeleting\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:7:\"variant\";N;s:4:\"item\";r:11;s:10:\"variations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:7:\"options\";O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"created_at\";i:1789235797;}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:9:\"\0*\0config\";a:5:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:6:\"events\";N;}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}','2026-09-12 18:26:37','2026-09-12 18:26:37'),
('8VHr99x6fwThO3vTTqAcnOqJGGiIxnAC3UHivi9d_cart_items','O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:4:{s:32:\"f63190dc451fabef1db1a35eaab8b8f6\";O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:8:\"\0*\0items\";a:6:{s:2:\"id\";s:32:\"f63190dc451fabef1db1a35eaab8b8f6\";s:4:\"name\";s:40:\"Signature Palak Paneer Momos (1 Kg Pack)\";s:5:\"price\";d:390;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:6:{s:7:\"product\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:22:{s:2:\"id\";i:73;s:8:\"brand_id\";N;s:12:\"tax_class_id\";N;s:4:\"slug\";s:32:\"signature-palak-paneer-momos-1kg\";s:5:\"price\";s:8:\"560.0000\";s:13:\"special_price\";s:8:\"390.0000\";s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-09-10\";s:17:\"special_price_end\";s:10:\"2029-09-11\";s:13:\"selling_price\";s:8:\"390.0000\";s:3:\"sku\";s:9:\"ML-DF5D03\";s:12:\"manage_stock\";i:0;s:3:\"qty\";i:5000;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:0;s:9:\"is_active\";i:1;s:8:\"new_from\";N;s:6:\"new_to\";N;s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"is_virtual\";i:0;}s:11:\"\0*\0original\";a:22:{s:2:\"id\";i:73;s:8:\"brand_id\";N;s:12:\"tax_class_id\";N;s:4:\"slug\";s:32:\"signature-palak-paneer-momos-1kg\";s:5:\"price\";s:8:\"560.0000\";s:13:\"special_price\";s:8:\"390.0000\";s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-09-10\";s:17:\"special_price_end\";s:10:\"2029-09-11\";s:13:\"selling_price\";s:8:\"390.0000\";s:3:\"sku\";s:9:\"ML-DF5D03\";s:12:\"manage_stock\";i:0;s:3:\"qty\";i:5000;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:0;s:9:\"is_active\";i:1;s:8:\"new_from\";N;s:6:\"new_to\";N;s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"is_virtual\";i:0;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:4:{s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:43:\"Modules\\Product\\Entities\\ProductTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:20:\"product_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:73;s:10:\"product_id\";i:73;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:40:\"Signature Palak Paneer Momos (1 Kg Pack)\";s:11:\"description\";s:272:\"<p>Vibrant natural spinach green pastry dough loaded with spiced cottage cheese and mountain greens. Steams beautifully in just 5 minutes.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>\";s:17:\"short_description\";s:135:\"Vibrant natural spinach green pastry dough loaded with spiced cottage cheese and mountain greens. Steams beautifully in just 5 minutes.\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:73;s:10:\"product_id\";i:73;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:40:\"Signature Palak Paneer Momos (1 Kg Pack)\";s:11:\"description\";s:272:\"<p>Vibrant natural spinach green pastry dough loaded with spiced cottage cheese and mountain greens. Steams beautifully in just 5 minutes.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>\";s:17:\"short_description\";s:135:\"Vibrant natural spinach green pastry dough loaded with spiced cottage cheese and mountain greens. Steams beautifully in just 5 minutes.\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:5:\"files\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:10:{s:2:\"id\";i:77;s:7:\"user_id\";i:1;s:8:\"filename\";s:21:\"palak_paneer_momo.jpg\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:27:\"media/palak_paneer_momo.jpg\";s:9:\"extension\";s:3:\"jpg\";s:4:\"mime\";s:10:\"image/jpeg\";s:4:\"size\";s:6:\"241766\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";}s:11:\"\0*\0original\";a:17:{s:2:\"id\";i:77;s:7:\"user_id\";i:1;s:8:\"filename\";s:21:\"palak_paneer_momo.jpg\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:27:\"media/palak_paneer_momo.jpg\";s:9:\"extension\";s:3:\"jpg\";s:4:\"mime\";s:10:\"image/jpeg\";s:4:\"size\";s:6:\"241766\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";s:15:\"pivot_entity_id\";i:73;s:13:\"pivot_file_id\";i:77;s:17:\"pivot_entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:8:\"pivot_id\";i:132;s:10:\"pivot_zone\";s:10:\"base_image\";s:16:\"pivot_created_at\";s:19:\"2026-09-11 11:15:23\";s:16:\"pivot_updated_at\";s:19:\"2026-09-11 11:15:23\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:5:\"pivot\";O:49:\"Illuminate\\Database\\Eloquent\\Relations\\MorphPivot\":36:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:12:\"entity_files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:73;s:7:\"file_id\";i:77;s:2:\"id\";i:132;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";}s:11:\"\0*\0original\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:73;s:7:\"file_id\";i:77;s:2:\"id\";i:132;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:13:\"\0*\0foreignKey\";s:9:\"entity_id\";s:13:\"\0*\0relatedKey\";s:7:\"file_id\";s:12:\"\0*\0morphType\";s:11:\"entity_type\";s:13:\"\0*\0morphClass\";s:32:\"Modules\\Product\\Entities\\Product\";}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"categories\";O:26:\"TypiCMS\\NestableCollection\":8:{s:8:\"\0*\0items\";a:1:{i:0;O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:41;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"authentic-himalayan-momos\";s:8:\"position\";i:0;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";}s:11:\"\0*\0original\";a:10:{s:2:\"id\";i:41;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"authentic-himalayan-momos\";s:8:\"position\";i:0;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";s:16:\"pivot_product_id\";i:73;s:17:\"pivot_category_id\";i:41;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:2:{s:5:\"pivot\";O:44:\"Illuminate\\Database\\Eloquent\\Relations\\Pivot\":34:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:18:\"product_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:10:\"product_id\";i:73;s:11:\"category_id\";i:41;}s:11:\"\0*\0original\";a:2:{s:10:\"product_id\";i:73;s:11:\"category_id\";i:41;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}s:13:\"\0*\0foreignKey\";s:10:\"product_id\";s:13:\"\0*\0relatedKey\";s:11:\"category_id\";}s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:45:\"Modules\\Category\\Entities\\CategoryTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:21:\"category_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:4:{s:2:\"id\";i:41;s:11:\"category_id\";i:41;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:25:\"Authentic Himalayan Momos\";}s:11:\"\0*\0original\";a:4:{s:2:\"id\";i:41;s:11:\"category_id\";i:41;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:25:\"Authentic Himalayan Momos\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:4:\"name\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:8:\"\0*\0total\";i:1;s:15:\"\0*\0parentColumn\";s:9:\"parent_id\";s:33:\"\0*\0removeItemsWithMissingAncestor\";b:1;s:14:\"\0*\0indentChars\";s:8:\"    \";s:15:\"\0*\0childrenName\";s:5:\"items\";s:17:\"\0*\0parentRelation\";s:6:\"parent\";}s:8:\"taxClass\";O:29:\"Modules\\Tax\\Entities\\TaxClass\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:11:\"tax_classes\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:3:{s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:8:\"based_on\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:20:\"translatedAttributes\";a:1:{i:0;s:5:\"label\";}s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0forceDeleting\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:7:\"variant\";N;s:4:\"item\";r:11;s:10:\"variations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:7:\"options\";O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"created_at\";i:1789107494;}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:9:\"\0*\0config\";a:5:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:6:\"events\";N;}}s:32:\"46b9eeb60eae54c1ce957e960691ec32\";O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:8:\"\0*\0items\";a:6:{s:2:\"id\";s:32:\"46b9eeb60eae54c1ce957e960691ec32\";s:4:\"name\";s:40:\"Fresh Cottage Cheese Paneer Momos (1 Kg)\";s:5:\"price\";d:390;s:8:\"quantity\";i:2;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:6:{s:7:\"product\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:22:{s:2:\"id\";i:72;s:8:\"brand_id\";N;s:12:\"tax_class_id\";N;s:4:\"slug\";s:37:\"fresh-cottage-cheese-paneer-momos-1kg\";s:5:\"price\";s:8:\"560.0000\";s:13:\"special_price\";s:8:\"390.0000\";s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-09-10\";s:17:\"special_price_end\";s:10:\"2029-09-11\";s:13:\"selling_price\";s:8:\"390.0000\";s:3:\"sku\";s:9:\"ML-06DD56\";s:12:\"manage_stock\";i:0;s:3:\"qty\";i:5000;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:0;s:9:\"is_active\";i:1;s:8:\"new_from\";N;s:6:\"new_to\";N;s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"is_virtual\";i:0;}s:11:\"\0*\0original\";a:22:{s:2:\"id\";i:72;s:8:\"brand_id\";N;s:12:\"tax_class_id\";N;s:4:\"slug\";s:37:\"fresh-cottage-cheese-paneer-momos-1kg\";s:5:\"price\";s:8:\"560.0000\";s:13:\"special_price\";s:8:\"390.0000\";s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-09-10\";s:17:\"special_price_end\";s:10:\"2029-09-11\";s:13:\"selling_price\";s:8:\"390.0000\";s:3:\"sku\";s:9:\"ML-06DD56\";s:12:\"manage_stock\";i:0;s:3:\"qty\";i:5000;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:0;s:9:\"is_active\";i:1;s:8:\"new_from\";N;s:6:\"new_to\";N;s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"is_virtual\";i:0;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:4:{s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:43:\"Modules\\Product\\Entities\\ProductTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:20:\"product_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:72;s:10:\"product_id\";i:72;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:40:\"Fresh Cottage Cheese Paneer Momos (1 Kg)\";s:11:\"description\";s:265:\"<p>Soft dairy paneer blended with farm-fresh garden cabbage, onion, and selected spices. Mild, creamy, and succulent in every bite.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>\";s:17:\"short_description\";s:128:\"Soft dairy paneer blended with farm-fresh garden cabbage, onion, and selected spices. Mild, creamy, and succulent in every bite.\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:72;s:10:\"product_id\";i:72;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:40:\"Fresh Cottage Cheese Paneer Momos (1 Kg)\";s:11:\"description\";s:265:\"<p>Soft dairy paneer blended with farm-fresh garden cabbage, onion, and selected spices. Mild, creamy, and succulent in every bite.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>\";s:17:\"short_description\";s:128:\"Soft dairy paneer blended with farm-fresh garden cabbage, onion, and selected spices. Mild, creamy, and succulent in every bite.\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:5:\"files\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:10:{s:2:\"id\";i:76;s:7:\"user_id\";i:1;s:8:\"filename\";s:15:\"paneer_momo.jpg\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:21:\"media/paneer_momo.jpg\";s:9:\"extension\";s:3:\"jpg\";s:4:\"mime\";s:10:\"image/jpeg\";s:4:\"size\";s:6:\"165580\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";}s:11:\"\0*\0original\";a:17:{s:2:\"id\";i:76;s:7:\"user_id\";i:1;s:8:\"filename\";s:15:\"paneer_momo.jpg\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:21:\"media/paneer_momo.jpg\";s:9:\"extension\";s:3:\"jpg\";s:4:\"mime\";s:10:\"image/jpeg\";s:4:\"size\";s:6:\"165580\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";s:15:\"pivot_entity_id\";i:72;s:13:\"pivot_file_id\";i:76;s:17:\"pivot_entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:8:\"pivot_id\";i:131;s:10:\"pivot_zone\";s:10:\"base_image\";s:16:\"pivot_created_at\";s:19:\"2026-09-11 11:15:23\";s:16:\"pivot_updated_at\";s:19:\"2026-09-11 11:15:23\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:5:\"pivot\";O:49:\"Illuminate\\Database\\Eloquent\\Relations\\MorphPivot\":36:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:12:\"entity_files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:72;s:7:\"file_id\";i:76;s:2:\"id\";i:131;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";}s:11:\"\0*\0original\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:72;s:7:\"file_id\";i:76;s:2:\"id\";i:131;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:13:\"\0*\0foreignKey\";s:9:\"entity_id\";s:13:\"\0*\0relatedKey\";s:7:\"file_id\";s:12:\"\0*\0morphType\";s:11:\"entity_type\";s:13:\"\0*\0morphClass\";s:32:\"Modules\\Product\\Entities\\Product\";}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"categories\";O:26:\"TypiCMS\\NestableCollection\":8:{s:8:\"\0*\0items\";a:1:{i:0;O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:41;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"authentic-himalayan-momos\";s:8:\"position\";i:0;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";}s:11:\"\0*\0original\";a:10:{s:2:\"id\";i:41;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"authentic-himalayan-momos\";s:8:\"position\";i:0;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";s:16:\"pivot_product_id\";i:72;s:17:\"pivot_category_id\";i:41;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:2:{s:5:\"pivot\";O:44:\"Illuminate\\Database\\Eloquent\\Relations\\Pivot\":34:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:18:\"product_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:10:\"product_id\";i:72;s:11:\"category_id\";i:41;}s:11:\"\0*\0original\";a:2:{s:10:\"product_id\";i:72;s:11:\"category_id\";i:41;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}s:13:\"\0*\0foreignKey\";s:10:\"product_id\";s:13:\"\0*\0relatedKey\";s:11:\"category_id\";}s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:45:\"Modules\\Category\\Entities\\CategoryTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:21:\"category_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:4:{s:2:\"id\";i:41;s:11:\"category_id\";i:41;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:25:\"Authentic Himalayan Momos\";}s:11:\"\0*\0original\";a:4:{s:2:\"id\";i:41;s:11:\"category_id\";i:41;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:25:\"Authentic Himalayan Momos\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:4:\"name\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:8:\"\0*\0total\";i:1;s:15:\"\0*\0parentColumn\";s:9:\"parent_id\";s:33:\"\0*\0removeItemsWithMissingAncestor\";b:1;s:14:\"\0*\0indentChars\";s:8:\"    \";s:15:\"\0*\0childrenName\";s:5:\"items\";s:17:\"\0*\0parentRelation\";s:6:\"parent\";}s:8:\"taxClass\";O:29:\"Modules\\Tax\\Entities\\TaxClass\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:11:\"tax_classes\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:3:{s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:8:\"based_on\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:20:\"translatedAttributes\";a:1:{i:0;s:5:\"label\";}s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0forceDeleting\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:7:\"variant\";N;s:4:\"item\";r:757;s:10:\"variations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:7:\"options\";O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"created_at\";i:1789108119;}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:9:\"\0*\0config\";a:5:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:6:\"events\";N;}}s:32:\"1cf943effc0beb669217e490e915a48d\";O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:8:\"\0*\0items\";a:6:{s:2:\"id\";s:32:\"1cf943effc0beb669217e490e915a48d\";s:4:\"name\";s:39:\"Classic Chicken Momo (1 Kg Retail Pack)\";s:5:\"price\";d:364;s:8:\"quantity\";i:5;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:6:{s:7:\"product\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:22:{s:2:\"id\";i:69;s:8:\"brand_id\";N;s:12:\"tax_class_id\";N;s:4:\"slug\";s:24:\"classic-chicken-momo-1kg\";s:5:\"price\";s:8:\"520.0000\";s:13:\"special_price\";s:8:\"364.0000\";s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-09-10\";s:17:\"special_price_end\";s:10:\"2029-09-11\";s:13:\"selling_price\";s:8:\"364.0000\";s:3:\"sku\";s:9:\"ML-AC3C16\";s:12:\"manage_stock\";i:0;s:3:\"qty\";i:5000;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:0;s:9:\"is_active\";i:1;s:8:\"new_from\";N;s:6:\"new_to\";N;s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"is_virtual\";i:0;}s:11:\"\0*\0original\";a:22:{s:2:\"id\";i:69;s:8:\"brand_id\";N;s:12:\"tax_class_id\";N;s:4:\"slug\";s:24:\"classic-chicken-momo-1kg\";s:5:\"price\";s:8:\"520.0000\";s:13:\"special_price\";s:8:\"364.0000\";s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-09-10\";s:17:\"special_price_end\";s:10:\"2029-09-11\";s:13:\"selling_price\";s:8:\"364.0000\";s:3:\"sku\";s:9:\"ML-AC3C16\";s:12:\"manage_stock\";i:0;s:3:\"qty\";i:5000;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:0;s:9:\"is_active\";i:1;s:8:\"new_from\";N;s:6:\"new_to\";N;s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"is_virtual\";i:0;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:4:{s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:43:\"Modules\\Product\\Entities\\ProductTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:20:\"product_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:69;s:10:\"product_id\";i:69;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:39:\"Classic Chicken Momo (1 Kg Retail Pack)\";s:11:\"description\";s:294:\"<p>Traditional Darjeeling chicken momo crafted with tender chicken, hill onions, ginger, and authentic mountain herbs. 100% preservative-free, frozen at -18°C.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>\";s:17:\"short_description\";s:157:\"Traditional Darjeeling chicken momo crafted with tender chicken, hill onions, ginger, and authentic mountain herbs. 100% preservative-free, frozen at -18°C.\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:69;s:10:\"product_id\";i:69;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:39:\"Classic Chicken Momo (1 Kg Retail Pack)\";s:11:\"description\";s:294:\"<p>Traditional Darjeeling chicken momo crafted with tender chicken, hill onions, ginger, and authentic mountain herbs. 100% preservative-free, frozen at -18°C.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>\";s:17:\"short_description\";s:157:\"Traditional Darjeeling chicken momo crafted with tender chicken, hill onions, ginger, and authentic mountain herbs. 100% preservative-free, frozen at -18°C.\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:5:\"files\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:10:{s:2:\"id\";i:73;s:7:\"user_id\";i:1;s:8:\"filename\";s:24:\"classic_chicken_momo.jpg\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:30:\"media/classic_chicken_momo.jpg\";s:9:\"extension\";s:3:\"jpg\";s:4:\"mime\";s:10:\"image/jpeg\";s:4:\"size\";s:6:\"221696\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";}s:11:\"\0*\0original\";a:17:{s:2:\"id\";i:73;s:7:\"user_id\";i:1;s:8:\"filename\";s:24:\"classic_chicken_momo.jpg\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:30:\"media/classic_chicken_momo.jpg\";s:9:\"extension\";s:3:\"jpg\";s:4:\"mime\";s:10:\"image/jpeg\";s:4:\"size\";s:6:\"221696\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";s:15:\"pivot_entity_id\";i:69;s:13:\"pivot_file_id\";i:73;s:17:\"pivot_entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:8:\"pivot_id\";i:128;s:10:\"pivot_zone\";s:10:\"base_image\";s:16:\"pivot_created_at\";s:19:\"2026-09-11 11:15:23\";s:16:\"pivot_updated_at\";s:19:\"2026-09-11 11:15:23\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:5:\"pivot\";O:49:\"Illuminate\\Database\\Eloquent\\Relations\\MorphPivot\":36:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:12:\"entity_files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:69;s:7:\"file_id\";i:73;s:2:\"id\";i:128;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";}s:11:\"\0*\0original\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:69;s:7:\"file_id\";i:73;s:2:\"id\";i:128;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:13:\"\0*\0foreignKey\";s:9:\"entity_id\";s:13:\"\0*\0relatedKey\";s:7:\"file_id\";s:12:\"\0*\0morphType\";s:11:\"entity_type\";s:13:\"\0*\0morphClass\";s:32:\"Modules\\Product\\Entities\\Product\";}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"categories\";O:26:\"TypiCMS\\NestableCollection\":8:{s:8:\"\0*\0items\";a:1:{i:0;O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:41;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"authentic-himalayan-momos\";s:8:\"position\";i:0;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";}s:11:\"\0*\0original\";a:10:{s:2:\"id\";i:41;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"authentic-himalayan-momos\";s:8:\"position\";i:0;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";s:16:\"pivot_product_id\";i:69;s:17:\"pivot_category_id\";i:41;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:2:{s:5:\"pivot\";O:44:\"Illuminate\\Database\\Eloquent\\Relations\\Pivot\":34:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:18:\"product_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:10:\"product_id\";i:69;s:11:\"category_id\";i:41;}s:11:\"\0*\0original\";a:2:{s:10:\"product_id\";i:69;s:11:\"category_id\";i:41;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}s:13:\"\0*\0foreignKey\";s:10:\"product_id\";s:13:\"\0*\0relatedKey\";s:11:\"category_id\";}s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:45:\"Modules\\Category\\Entities\\CategoryTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:21:\"category_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:4:{s:2:\"id\";i:41;s:11:\"category_id\";i:41;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:25:\"Authentic Himalayan Momos\";}s:11:\"\0*\0original\";a:4:{s:2:\"id\";i:41;s:11:\"category_id\";i:41;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:25:\"Authentic Himalayan Momos\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:4:\"name\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:8:\"\0*\0total\";i:1;s:15:\"\0*\0parentColumn\";s:9:\"parent_id\";s:33:\"\0*\0removeItemsWithMissingAncestor\";b:1;s:14:\"\0*\0indentChars\";s:8:\"    \";s:15:\"\0*\0childrenName\";s:5:\"items\";s:17:\"\0*\0parentRelation\";s:6:\"parent\";}s:8:\"taxClass\";O:29:\"Modules\\Tax\\Entities\\TaxClass\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:11:\"tax_classes\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:3:{s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:8:\"based_on\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:20:\"translatedAttributes\";a:1:{i:0;s:5:\"label\";}s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0forceDeleting\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:7:\"variant\";N;s:4:\"item\";r:1503;s:10:\"variations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:7:\"options\";O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"created_at\";i:1789107487;}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:9:\"\0*\0config\";a:5:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:6:\"events\";N;}}s:32:\"694c1fedae70f006a75bb60684d5ab49\";O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:8:\"\0*\0items\";a:6:{s:2:\"id\";s:32:\"694c1fedae70f006a75bb60684d5ab49\";s:4:\"name\";s:47:\"Crispy Himalayan Veg Spring Rolls (12 Pcs Pack)\";s:5:\"price\";d:89;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:6:{s:7:\"product\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:22:{s:2:\"id\";i:62;s:8:\"brand_id\";N;s:12:\"tax_class_id\";N;s:4:\"slug\";s:45:\"crispy-himalayan-veg-spring-rolls-12-pcs-pack\";s:5:\"price\";s:8:\"230.0000\";s:13:\"special_price\";s:7:\"89.0000\";s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-09-11\";s:17:\"special_price_end\";s:10:\"2029-09-11\";s:13:\"selling_price\";s:7:\"89.0000\";s:3:\"sku\";s:11:\"ROLL-VEG-12\";s:12:\"manage_stock\";i:0;s:3:\"qty\";i:5000;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:0;s:9:\"is_active\";i:1;s:8:\"new_from\";N;s:6:\"new_to\";N;s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"is_virtual\";i:0;}s:11:\"\0*\0original\";a:22:{s:2:\"id\";i:62;s:8:\"brand_id\";N;s:12:\"tax_class_id\";N;s:4:\"slug\";s:45:\"crispy-himalayan-veg-spring-rolls-12-pcs-pack\";s:5:\"price\";s:8:\"230.0000\";s:13:\"special_price\";s:7:\"89.0000\";s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-09-11\";s:17:\"special_price_end\";s:10:\"2029-09-11\";s:13:\"selling_price\";s:7:\"89.0000\";s:3:\"sku\";s:11:\"ROLL-VEG-12\";s:12:\"manage_stock\";i:0;s:3:\"qty\";i:5000;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:0;s:9:\"is_active\";i:1;s:8:\"new_from\";N;s:6:\"new_to\";N;s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"is_virtual\";i:0;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:4:{s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:43:\"Modules\\Product\\Entities\\ProductTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:20:\"product_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:62;s:10:\"product_id\";i:62;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:47:\"Crispy Himalayan Veg Spring Rolls (12 Pcs Pack)\";s:11:\"description\";s:167:\"Crunchy golden vegetable spring rolls packed with seasoned Himalayan vegetables, shredded cabbage, mushrooms, and glass noodles. Served with sweet chili dipping sauce.\";s:17:\"short_description\";s:48:\"Golden crispy spring rolls with sweet chili dip.\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:62;s:10:\"product_id\";i:62;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:47:\"Crispy Himalayan Veg Spring Rolls (12 Pcs Pack)\";s:11:\"description\";s:167:\"Crunchy golden vegetable spring rolls packed with seasoned Himalayan vegetables, shredded cabbage, mushrooms, and glass noodles. Served with sweet chili dipping sauce.\";s:17:\"short_description\";s:48:\"Golden crispy spring rolls with sweet chili dip.\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:5:\"files\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:10:{s:2:\"id\";i:63;s:7:\"user_id\";i:1;s:8:\"filename\";s:16:\"spring_rolls.png\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:22:\"media/spring_rolls.png\";s:9:\"extension\";s:3:\"png\";s:4:\"mime\";s:9:\"image/png\";s:4:\"size\";s:7:\"1862445\";s:10:\"created_at\";s:19:\"2026-09-11 01:38:32\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:32\";}s:11:\"\0*\0original\";a:17:{s:2:\"id\";i:63;s:7:\"user_id\";i:1;s:8:\"filename\";s:16:\"spring_rolls.png\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:22:\"media/spring_rolls.png\";s:9:\"extension\";s:3:\"png\";s:4:\"mime\";s:9:\"image/png\";s:4:\"size\";s:7:\"1862445\";s:10:\"created_at\";s:19:\"2026-09-11 01:38:32\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:32\";s:15:\"pivot_entity_id\";i:62;s:13:\"pivot_file_id\";i:63;s:17:\"pivot_entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:8:\"pivot_id\";i:118;s:10:\"pivot_zone\";s:10:\"base_image\";s:16:\"pivot_created_at\";s:19:\"2026-09-11 01:38:33\";s:16:\"pivot_updated_at\";s:19:\"2026-09-11 01:38:33\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:5:\"pivot\";O:49:\"Illuminate\\Database\\Eloquent\\Relations\\MorphPivot\":36:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:12:\"entity_files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:62;s:7:\"file_id\";i:63;s:2:\"id\";i:118;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";}s:11:\"\0*\0original\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:62;s:7:\"file_id\";i:63;s:2:\"id\";i:118;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:13:\"\0*\0foreignKey\";s:9:\"entity_id\";s:13:\"\0*\0relatedKey\";s:7:\"file_id\";s:12:\"\0*\0morphType\";s:11:\"entity_type\";s:13:\"\0*\0morphClass\";s:32:\"Modules\\Product\\Entities\\Product\";}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"categories\";O:26:\"TypiCMS\\NestableCollection\":8:{s:8:\"\0*\0items\";a:2:{i:0;O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:43;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"crispy-fries-finger-foods\";s:8:\"position\";i:2;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";}s:11:\"\0*\0original\";a:10:{s:2:\"id\";i:43;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"crispy-fries-finger-foods\";s:8:\"position\";i:2;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";s:16:\"pivot_product_id\";i:62;s:17:\"pivot_category_id\";i:43;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:2:{s:5:\"pivot\";O:44:\"Illuminate\\Database\\Eloquent\\Relations\\Pivot\":34:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:18:\"product_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:10:\"product_id\";i:62;s:11:\"category_id\";i:43;}s:11:\"\0*\0original\";a:2:{s:10:\"product_id\";i:62;s:11:\"category_id\";i:43;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}s:13:\"\0*\0foreignKey\";s:10:\"product_id\";s:13:\"\0*\0relatedKey\";s:11:\"category_id\";}s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:45:\"Modules\\Category\\Entities\\CategoryTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:21:\"category_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:4:{s:2:\"id\";i:43;s:11:\"category_id\";i:43;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:27:\"Crispy Fries & Finger Foods\";}s:11:\"\0*\0original\";a:4:{s:2:\"id\";i:43;s:11:\"category_id\";i:43;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:27:\"Crispy Fries & Finger Foods\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:4:\"name\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}i:1;O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:44;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"himalayan-kebabs-starters\";s:8:\"position\";i:3;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";}s:11:\"\0*\0original\";a:10:{s:2:\"id\";i:44;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"himalayan-kebabs-starters\";s:8:\"position\";i:3;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";s:16:\"pivot_product_id\";i:62;s:17:\"pivot_category_id\";i:44;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:2:{s:5:\"pivot\";O:44:\"Illuminate\\Database\\Eloquent\\Relations\\Pivot\":34:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:18:\"product_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:10:\"product_id\";i:62;s:11:\"category_id\";i:44;}s:11:\"\0*\0original\";a:2:{s:10:\"product_id\";i:62;s:11:\"category_id\";i:44;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";r:2699;s:12:\"pivotRelated\";r:2779;s:13:\"\0*\0foreignKey\";s:10:\"product_id\";s:13:\"\0*\0relatedKey\";s:11:\"category_id\";}s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:45:\"Modules\\Category\\Entities\\CategoryTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:21:\"category_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:4:{s:2:\"id\";i:44;s:11:\"category_id\";i:44;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:27:\"Himalayan Kebabs & Starters\";}s:11:\"\0*\0original\";a:4:{s:2:\"id\";i:44;s:11:\"category_id\";i:44;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:27:\"Himalayan Kebabs & Starters\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:4:\"name\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:8:\"\0*\0total\";i:2;s:15:\"\0*\0parentColumn\";s:9:\"parent_id\";s:33:\"\0*\0removeItemsWithMissingAncestor\";b:1;s:14:\"\0*\0indentChars\";s:8:\"    \";s:15:\"\0*\0childrenName\";s:5:\"items\";s:17:\"\0*\0parentRelation\";s:6:\"parent\";}s:8:\"taxClass\";O:29:\"Modules\\Tax\\Entities\\TaxClass\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:11:\"tax_classes\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:3:{s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:8:\"based_on\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:20:\"translatedAttributes\";a:1:{i:0;s:5:\"label\";}s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0forceDeleting\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:7:\"variant\";N;s:4:\"item\";r:2249;s:10:\"variations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:7:\"options\";O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"created_at\";i:1789108285;}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:9:\"\0*\0config\";a:5:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:6:\"events\";N;}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}','2026-09-11 06:48:07','2026-09-11 07:01:25'),
('cu9J7VoFDlhlVXgOywVD0kw934GiJ3KtZ4eE8l7J_cart_conditions','O:41:\"Darryldecode\\Cart\\CartConditionCollection\":2:{s:8:\"\0*\0items\";a:1:{s:13:\"Free Shipping\";O:26:\"Modules\\Cart\\CartCondition\":2:{s:37:\"\0Darryldecode\\Cart\\CartCondition\0args\";a:6:{s:4:\"name\";s:13:\"Free Shipping\";s:4:\"type\";s:15:\"shipping_method\";s:6:\"target\";s:5:\"total\";s:5:\"value\";i:0;s:5:\"order\";i:1;s:10:\"attributes\";a:1:{s:15:\"shipping_method\";O:23:\"Modules\\Shipping\\Method\":3:{s:4:\"name\";s:13:\"free_shipping\";s:5:\"label\";s:13:\"Free Shipping\";s:4:\"cost\";O:21:\"Modules\\Support\\Money\":2:{s:29:\"\0Modules\\Support\\Money\0amount\";i:0;s:31:\"\0Modules\\Support\\Money\0currency\";s:3:\"INR\";}}}}s:14:\"parsedRawValue\";N;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}','2026-09-11 11:32:17','2026-09-11 11:32:19'),
('cu9J7VoFDlhlVXgOywVD0kw934GiJ3KtZ4eE8l7J_cart_items','O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"1cf943effc0beb669217e490e915a48d\";O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:8:\"\0*\0items\";a:6:{s:2:\"id\";s:32:\"1cf943effc0beb669217e490e915a48d\";s:4:\"name\";s:39:\"Classic Chicken Momo (1 Kg Retail Pack)\";s:5:\"price\";d:364;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:6:{s:7:\"product\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:22:{s:2:\"id\";i:69;s:8:\"brand_id\";N;s:12:\"tax_class_id\";N;s:4:\"slug\";s:24:\"classic-chicken-momo-1kg\";s:5:\"price\";s:8:\"520.0000\";s:13:\"special_price\";s:8:\"364.0000\";s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-09-10\";s:17:\"special_price_end\";s:10:\"2029-09-11\";s:13:\"selling_price\";s:8:\"364.0000\";s:3:\"sku\";s:9:\"ML-AC3C16\";s:12:\"manage_stock\";i:0;s:3:\"qty\";i:5000;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:1;s:9:\"is_active\";i:1;s:8:\"new_from\";N;s:6:\"new_to\";N;s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"is_virtual\";i:0;}s:11:\"\0*\0original\";a:22:{s:2:\"id\";i:69;s:8:\"brand_id\";N;s:12:\"tax_class_id\";N;s:4:\"slug\";s:24:\"classic-chicken-momo-1kg\";s:5:\"price\";s:8:\"520.0000\";s:13:\"special_price\";s:8:\"364.0000\";s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-09-10\";s:17:\"special_price_end\";s:10:\"2029-09-11\";s:13:\"selling_price\";s:8:\"364.0000\";s:3:\"sku\";s:9:\"ML-AC3C16\";s:12:\"manage_stock\";i:0;s:3:\"qty\";i:5000;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:1;s:9:\"is_active\";i:1;s:8:\"new_from\";N;s:6:\"new_to\";N;s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"is_virtual\";i:0;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:4:{s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:43:\"Modules\\Product\\Entities\\ProductTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:20:\"product_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:69;s:10:\"product_id\";i:69;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:39:\"Classic Chicken Momo (1 Kg Retail Pack)\";s:11:\"description\";s:294:\"<p>Traditional Darjeeling chicken momo crafted with tender chicken, hill onions, ginger, and authentic mountain herbs. 100% preservative-free, frozen at -18°C.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>\";s:17:\"short_description\";s:157:\"Traditional Darjeeling chicken momo crafted with tender chicken, hill onions, ginger, and authentic mountain herbs. 100% preservative-free, frozen at -18°C.\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:69;s:10:\"product_id\";i:69;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:39:\"Classic Chicken Momo (1 Kg Retail Pack)\";s:11:\"description\";s:294:\"<p>Traditional Darjeeling chicken momo crafted with tender chicken, hill onions, ginger, and authentic mountain herbs. 100% preservative-free, frozen at -18°C.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>\";s:17:\"short_description\";s:157:\"Traditional Darjeeling chicken momo crafted with tender chicken, hill onions, ginger, and authentic mountain herbs. 100% preservative-free, frozen at -18°C.\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:5:\"files\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:10:{s:2:\"id\";i:73;s:7:\"user_id\";i:1;s:8:\"filename\";s:24:\"classic_chicken_momo.jpg\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:30:\"media/classic_chicken_momo.jpg\";s:9:\"extension\";s:3:\"jpg\";s:4:\"mime\";s:10:\"image/jpeg\";s:4:\"size\";s:6:\"221696\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";}s:11:\"\0*\0original\";a:17:{s:2:\"id\";i:73;s:7:\"user_id\";i:1;s:8:\"filename\";s:24:\"classic_chicken_momo.jpg\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:30:\"media/classic_chicken_momo.jpg\";s:9:\"extension\";s:3:\"jpg\";s:4:\"mime\";s:10:\"image/jpeg\";s:4:\"size\";s:6:\"221696\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";s:15:\"pivot_entity_id\";i:69;s:13:\"pivot_file_id\";i:73;s:17:\"pivot_entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:8:\"pivot_id\";i:128;s:10:\"pivot_zone\";s:10:\"base_image\";s:16:\"pivot_created_at\";s:19:\"2026-09-11 11:15:23\";s:16:\"pivot_updated_at\";s:19:\"2026-09-11 11:15:23\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:5:\"pivot\";O:49:\"Illuminate\\Database\\Eloquent\\Relations\\MorphPivot\":36:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:12:\"entity_files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:69;s:7:\"file_id\";i:73;s:2:\"id\";i:128;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";}s:11:\"\0*\0original\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:69;s:7:\"file_id\";i:73;s:2:\"id\";i:128;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:13:\"\0*\0foreignKey\";s:9:\"entity_id\";s:13:\"\0*\0relatedKey\";s:7:\"file_id\";s:12:\"\0*\0morphType\";s:11:\"entity_type\";s:13:\"\0*\0morphClass\";s:32:\"Modules\\Product\\Entities\\Product\";}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"categories\";O:26:\"TypiCMS\\NestableCollection\":8:{s:8:\"\0*\0items\";a:1:{i:0;O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:41;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"authentic-himalayan-momos\";s:8:\"position\";i:0;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";}s:11:\"\0*\0original\";a:10:{s:2:\"id\";i:41;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"authentic-himalayan-momos\";s:8:\"position\";i:0;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";s:16:\"pivot_product_id\";i:69;s:17:\"pivot_category_id\";i:41;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:2:{s:5:\"pivot\";O:44:\"Illuminate\\Database\\Eloquent\\Relations\\Pivot\":34:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:18:\"product_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:10:\"product_id\";i:69;s:11:\"category_id\";i:41;}s:11:\"\0*\0original\";a:2:{s:10:\"product_id\";i:69;s:11:\"category_id\";i:41;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}s:13:\"\0*\0foreignKey\";s:10:\"product_id\";s:13:\"\0*\0relatedKey\";s:11:\"category_id\";}s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:45:\"Modules\\Category\\Entities\\CategoryTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:21:\"category_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:4:{s:2:\"id\";i:41;s:11:\"category_id\";i:41;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:25:\"Authentic Himalayan Momos\";}s:11:\"\0*\0original\";a:4:{s:2:\"id\";i:41;s:11:\"category_id\";i:41;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:25:\"Authentic Himalayan Momos\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:4:\"name\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:8:\"\0*\0total\";i:1;s:15:\"\0*\0parentColumn\";s:9:\"parent_id\";s:33:\"\0*\0removeItemsWithMissingAncestor\";b:1;s:14:\"\0*\0indentChars\";s:8:\"    \";s:15:\"\0*\0childrenName\";s:5:\"items\";s:17:\"\0*\0parentRelation\";s:6:\"parent\";}s:8:\"taxClass\";O:29:\"Modules\\Tax\\Entities\\TaxClass\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:11:\"tax_classes\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:3:{s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:8:\"based_on\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:20:\"translatedAttributes\";a:1:{i:0;s:5:\"label\";}s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0forceDeleting\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:7:\"variant\";N;s:4:\"item\";r:11;s:10:\"variations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:7:\"options\";O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"created_at\";i:1789124533;}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:9:\"\0*\0config\";a:5:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:6:\"events\";N;}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}','2026-09-11 11:32:13','2026-09-11 11:32:13'),
('Hu95hEE3yxKteOD2K39yqeovoZMrfw8s65BTYxsY_cart_items','O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"5d78ec5a8c49d85b132063e7b8a84551\";O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:8:\"\0*\0items\";a:6:{s:2:\"id\";s:32:\"5d78ec5a8c49d85b132063e7b8a84551\";s:4:\"name\";s:39:\"Mix Vegetables Momos (1 Kg Retail Pack)\";s:5:\"price\";d:294;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:6:{s:7:\"product\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:22:{s:2:\"id\";i:70;s:8:\"brand_id\";N;s:12:\"tax_class_id\";N;s:4:\"slug\";s:24:\"mix-vegetables-momos-1kg\";s:5:\"price\";s:8:\"420.0000\";s:13:\"special_price\";s:8:\"294.0000\";s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-09-10\";s:17:\"special_price_end\";s:10:\"2029-09-11\";s:13:\"selling_price\";s:8:\"294.0000\";s:3:\"sku\";s:9:\"ML-615EE9\";s:12:\"manage_stock\";i:0;s:3:\"qty\";i:5000;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:0;s:9:\"is_active\";i:1;s:8:\"new_from\";N;s:6:\"new_to\";N;s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"is_virtual\";i:0;}s:11:\"\0*\0original\";a:22:{s:2:\"id\";i:70;s:8:\"brand_id\";N;s:12:\"tax_class_id\";N;s:4:\"slug\";s:24:\"mix-vegetables-momos-1kg\";s:5:\"price\";s:8:\"420.0000\";s:13:\"special_price\";s:8:\"294.0000\";s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-09-10\";s:17:\"special_price_end\";s:10:\"2029-09-11\";s:13:\"selling_price\";s:8:\"294.0000\";s:3:\"sku\";s:9:\"ML-615EE9\";s:12:\"manage_stock\";i:0;s:3:\"qty\";i:5000;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:0;s:9:\"is_active\";i:1;s:8:\"new_from\";N;s:6:\"new_to\";N;s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"is_virtual\";i:0;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:4:{s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:43:\"Modules\\Product\\Entities\\ProductTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:20:\"product_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:70;s:10:\"product_id\";i:70;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:39:\"Mix Vegetables Momos (1 Kg Retail Pack)\";s:11:\"description\";s:271:\"<p>Crisp organic cabbage, mountain carrots, farm-fresh green peas, and shallots wrapped in paper-thin dough. Healthy and 100% vegetarian.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>\";s:17:\"short_description\";s:134:\"Crisp organic cabbage, mountain carrots, farm-fresh green peas, and shallots wrapped in paper-thin dough. Healthy and 100% vegetarian.\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:70;s:10:\"product_id\";i:70;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:39:\"Mix Vegetables Momos (1 Kg Retail Pack)\";s:11:\"description\";s:271:\"<p>Crisp organic cabbage, mountain carrots, farm-fresh green peas, and shallots wrapped in paper-thin dough. Healthy and 100% vegetarian.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>\";s:17:\"short_description\";s:134:\"Crisp organic cabbage, mountain carrots, farm-fresh green peas, and shallots wrapped in paper-thin dough. Healthy and 100% vegetarian.\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:5:\"files\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:10:{s:2:\"id\";i:74;s:7:\"user_id\";i:1;s:8:\"filename\";s:16:\"mix_veg_momo.jpg\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:22:\"media/mix_veg_momo.jpg\";s:9:\"extension\";s:3:\"jpg\";s:4:\"mime\";s:10:\"image/jpeg\";s:4:\"size\";s:6:\"238387\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";}s:11:\"\0*\0original\";a:17:{s:2:\"id\";i:74;s:7:\"user_id\";i:1;s:8:\"filename\";s:16:\"mix_veg_momo.jpg\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:22:\"media/mix_veg_momo.jpg\";s:9:\"extension\";s:3:\"jpg\";s:4:\"mime\";s:10:\"image/jpeg\";s:4:\"size\";s:6:\"238387\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";s:15:\"pivot_entity_id\";i:70;s:13:\"pivot_file_id\";i:74;s:17:\"pivot_entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:8:\"pivot_id\";i:129;s:10:\"pivot_zone\";s:10:\"base_image\";s:16:\"pivot_created_at\";s:19:\"2026-09-11 11:15:23\";s:16:\"pivot_updated_at\";s:19:\"2026-09-11 11:15:23\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:5:\"pivot\";O:49:\"Illuminate\\Database\\Eloquent\\Relations\\MorphPivot\":36:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:12:\"entity_files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:70;s:7:\"file_id\";i:74;s:2:\"id\";i:129;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";}s:11:\"\0*\0original\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:70;s:7:\"file_id\";i:74;s:2:\"id\";i:129;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:13:\"\0*\0foreignKey\";s:9:\"entity_id\";s:13:\"\0*\0relatedKey\";s:7:\"file_id\";s:12:\"\0*\0morphType\";s:11:\"entity_type\";s:13:\"\0*\0morphClass\";s:32:\"Modules\\Product\\Entities\\Product\";}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"categories\";O:26:\"TypiCMS\\NestableCollection\":8:{s:8:\"\0*\0items\";a:1:{i:0;O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:41;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"authentic-himalayan-momos\";s:8:\"position\";i:0;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";}s:11:\"\0*\0original\";a:10:{s:2:\"id\";i:41;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"authentic-himalayan-momos\";s:8:\"position\";i:0;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";s:16:\"pivot_product_id\";i:70;s:17:\"pivot_category_id\";i:41;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:2:{s:5:\"pivot\";O:44:\"Illuminate\\Database\\Eloquent\\Relations\\Pivot\":34:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:18:\"product_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:10:\"product_id\";i:70;s:11:\"category_id\";i:41;}s:11:\"\0*\0original\";a:2:{s:10:\"product_id\";i:70;s:11:\"category_id\";i:41;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}s:13:\"\0*\0foreignKey\";s:10:\"product_id\";s:13:\"\0*\0relatedKey\";s:11:\"category_id\";}s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:45:\"Modules\\Category\\Entities\\CategoryTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:21:\"category_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:4:{s:2:\"id\";i:41;s:11:\"category_id\";i:41;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:25:\"Authentic Himalayan Momos\";}s:11:\"\0*\0original\";a:4:{s:2:\"id\";i:41;s:11:\"category_id\";i:41;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:25:\"Authentic Himalayan Momos\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:4:\"name\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:8:\"\0*\0total\";i:1;s:15:\"\0*\0parentColumn\";s:9:\"parent_id\";s:33:\"\0*\0removeItemsWithMissingAncestor\";b:1;s:14:\"\0*\0indentChars\";s:8:\"    \";s:15:\"\0*\0childrenName\";s:5:\"items\";s:17:\"\0*\0parentRelation\";s:6:\"parent\";}s:8:\"taxClass\";O:29:\"Modules\\Tax\\Entities\\TaxClass\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:11:\"tax_classes\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:3:{s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:8:\"based_on\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:20:\"translatedAttributes\";a:1:{i:0;s:5:\"label\";}s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0forceDeleting\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:7:\"variant\";N;s:4:\"item\";r:11;s:10:\"variations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:7:\"options\";O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"created_at\";i:1789201056;}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:9:\"\0*\0config\";a:5:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:6:\"events\";N;}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}','2026-09-12 08:47:37','2026-09-12 08:47:37'),
('jMIcBmUeWitBx5xSMNOlMMi17ha8ONLrCxsLDkZf_cart_items','O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:4:{s:32:\"993fe0ce6c2e61a2cc2ed707a2537d49\";O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:8:\"\0*\0items\";a:6:{s:2:\"id\";s:32:\"993fe0ce6c2e61a2cc2ed707a2537d49\";s:4:\"name\";s:51:\"Sony WH-1000XM5 Wireless Noise-Canceling Headphones\";s:5:\"price\";d:349.99;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:6:{s:7:\"product\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:22:{s:2:\"id\";i:3;s:8:\"brand_id\";i:2;s:12:\"tax_class_id\";N;s:4:\"slug\";s:51:\"sony-wh-1000xm5-wireless-noise-canceling-headphones\";s:5:\"price\";s:8:\"399.9900\";s:13:\"special_price\";s:8:\"349.9900\";s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-08-17\";s:17:\"special_price_end\";s:10:\"2028-08-22\";s:13:\"selling_price\";s:8:\"349.9900\";s:3:\"sku\";s:14:\"SONY-WH1000XM5\";s:12:\"manage_stock\";i:1;s:3:\"qty\";i:40;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:0;s:9:\"is_active\";i:1;s:8:\"new_from\";s:19:\"2026-08-12 14:06:13\";s:6:\"new_to\";s:19:\"2026-10-21 14:06:13\";s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-08-22 14:06:13\";s:10:\"updated_at\";s:19:\"2026-08-22 14:06:13\";s:10:\"is_virtual\";i:0;}s:11:\"\0*\0original\";a:22:{s:2:\"id\";i:3;s:8:\"brand_id\";i:2;s:12:\"tax_class_id\";N;s:4:\"slug\";s:51:\"sony-wh-1000xm5-wireless-noise-canceling-headphones\";s:5:\"price\";s:8:\"399.9900\";s:13:\"special_price\";s:8:\"349.9900\";s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-08-17\";s:17:\"special_price_end\";s:10:\"2028-08-22\";s:13:\"selling_price\";s:8:\"349.9900\";s:3:\"sku\";s:14:\"SONY-WH1000XM5\";s:12:\"manage_stock\";i:1;s:3:\"qty\";i:40;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:0;s:9:\"is_active\";i:1;s:8:\"new_from\";s:19:\"2026-08-12 14:06:13\";s:6:\"new_to\";s:19:\"2026-10-21 14:06:13\";s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-08-22 14:06:13\";s:10:\"updated_at\";s:19:\"2026-08-22 14:06:13\";s:10:\"is_virtual\";i:0;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:4:{s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:43:\"Modules\\Product\\Entities\\ProductTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:20:\"product_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:3;s:10:\"product_id\";i:3;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:51:\"Sony WH-1000XM5 Wireless Noise-Canceling Headphones\";s:11:\"description\";s:551:\"<p>With two processors and eight microphones, the Sony WH-1000XM5 headphones keep out more high and mid frequency sounds than ever. Enjoy magnificent sound quality engineered to perfection with High-Resolution Audio support.</p><ul><li>Industry-leading noise cancellation with Auto NC Optimizer</li><li>Magnificent Sound with new Integrated Processor V1</li><li>Crystal clear hands-free calling with 4 beamforming mics</li><li>Up to 30-hour battery life with quick charging</li><li>Ultra-comfortable, lightweight design with soft fit leather</li></ul>\";s:17:\"short_description\";s:101:\"Industry-leading noise cancellation with two processors and 8 microphones for unparalleled quietness.\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:3;s:10:\"product_id\";i:3;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:51:\"Sony WH-1000XM5 Wireless Noise-Canceling Headphones\";s:11:\"description\";s:551:\"<p>With two processors and eight microphones, the Sony WH-1000XM5 headphones keep out more high and mid frequency sounds than ever. Enjoy magnificent sound quality engineered to perfection with High-Resolution Audio support.</p><ul><li>Industry-leading noise cancellation with Auto NC Optimizer</li><li>Magnificent Sound with new Integrated Processor V1</li><li>Crystal clear hands-free calling with 4 beamforming mics</li><li>Up to 30-hour battery life with quick charging</li><li>Ultra-comfortable, lightweight design with soft fit leather</li></ul>\";s:17:\"short_description\";s:101:\"Industry-leading noise cancellation with two processors and 8 microphones for unparalleled quietness.\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:5:\"files\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:10:{s:2:\"id\";i:3;s:7:\"user_id\";i:1;s:8:\"filename\";s:8:\"DZ-8.jpg\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:21:\"media/images/DZ-8.jpg\";s:9:\"extension\";s:3:\"jpg\";s:4:\"mime\";s:10:\"image/jpeg\";s:4:\"size\";s:5:\"39935\";s:10:\"created_at\";s:19:\"2026-08-22 14:07:12\";s:10:\"updated_at\";s:19:\"2026-08-22 14:07:12\";}s:11:\"\0*\0original\";a:17:{s:2:\"id\";i:3;s:7:\"user_id\";i:1;s:8:\"filename\";s:8:\"DZ-8.jpg\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:21:\"media/images/DZ-8.jpg\";s:9:\"extension\";s:3:\"jpg\";s:4:\"mime\";s:10:\"image/jpeg\";s:4:\"size\";s:5:\"39935\";s:10:\"created_at\";s:19:\"2026-08-22 14:07:12\";s:10:\"updated_at\";s:19:\"2026-08-22 14:07:12\";s:15:\"pivot_entity_id\";i:3;s:13:\"pivot_file_id\";i:3;s:17:\"pivot_entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:8:\"pivot_id\";i:3;s:10:\"pivot_zone\";s:10:\"base_image\";s:16:\"pivot_created_at\";s:19:\"2026-08-22 14:07:12\";s:16:\"pivot_updated_at\";s:19:\"2026-08-22 14:07:12\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:5:\"pivot\";O:49:\"Illuminate\\Database\\Eloquent\\Relations\\MorphPivot\":36:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:12:\"entity_files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:3;s:7:\"file_id\";i:3;s:2:\"id\";i:3;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-08-22 14:07:12\";s:10:\"updated_at\";s:19:\"2026-08-22 14:07:12\";}s:11:\"\0*\0original\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:3;s:7:\"file_id\";i:3;s:2:\"id\";i:3;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-08-22 14:07:12\";s:10:\"updated_at\";s:19:\"2026-08-22 14:07:12\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:13:\"\0*\0foreignKey\";s:9:\"entity_id\";s:13:\"\0*\0relatedKey\";s:7:\"file_id\";s:12:\"\0*\0morphType\";s:11:\"entity_type\";s:13:\"\0*\0morphClass\";s:32:\"Modules\\Product\\Entities\\Product\";}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"categories\";O:26:\"TypiCMS\\NestableCollection\":8:{s:8:\"\0*\0items\";a:2:{i:0;O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:1;s:9:\"parent_id\";N;s:4:\"slug\";s:11:\"electronics\";s:8:\"position\";i:1;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-08-22 14:06:12\";s:10:\"updated_at\";s:19:\"2026-08-22 14:06:12\";}s:11:\"\0*\0original\";a:10:{s:2:\"id\";i:1;s:9:\"parent_id\";N;s:4:\"slug\";s:11:\"electronics\";s:8:\"position\";i:1;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-08-22 14:06:12\";s:10:\"updated_at\";s:19:\"2026-08-22 14:06:12\";s:16:\"pivot_product_id\";i:3;s:17:\"pivot_category_id\";i:1;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:2:{s:5:\"pivot\";O:44:\"Illuminate\\Database\\Eloquent\\Relations\\Pivot\":34:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:18:\"product_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:10:\"product_id\";i:3;s:11:\"category_id\";i:1;}s:11:\"\0*\0original\";a:2:{s:10:\"product_id\";i:3;s:11:\"category_id\";i:1;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}s:13:\"\0*\0foreignKey\";s:10:\"product_id\";s:13:\"\0*\0relatedKey\";s:11:\"category_id\";}s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:45:\"Modules\\Category\\Entities\\CategoryTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:21:\"category_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:4:{s:2:\"id\";i:1;s:11:\"category_id\";i:1;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:11:\"Electronics\";}s:11:\"\0*\0original\";a:4:{s:2:\"id\";i:1;s:11:\"category_id\";i:1;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:11:\"Electronics\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:4:\"name\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}i:1;O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:4;s:9:\"parent_id\";i:1;s:4:\"slug\";s:16:\"audio-headphones\";s:8:\"position\";i:3;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-08-22 14:06:12\";s:10:\"updated_at\";s:19:\"2026-08-22 14:06:12\";}s:11:\"\0*\0original\";a:10:{s:2:\"id\";i:4;s:9:\"parent_id\";i:1;s:4:\"slug\";s:16:\"audio-headphones\";s:8:\"position\";i:3;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-08-22 14:06:12\";s:10:\"updated_at\";s:19:\"2026-08-22 14:06:12\";s:16:\"pivot_product_id\";i:3;s:17:\"pivot_category_id\";i:4;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:2:{s:5:\"pivot\";O:44:\"Illuminate\\Database\\Eloquent\\Relations\\Pivot\":34:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:18:\"product_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:10:\"product_id\";i:3;s:11:\"category_id\";i:4;}s:11:\"\0*\0original\";a:2:{s:10:\"product_id\";i:3;s:11:\"category_id\";i:4;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";r:461;s:12:\"pivotRelated\";r:541;s:13:\"\0*\0foreignKey\";s:10:\"product_id\";s:13:\"\0*\0relatedKey\";s:11:\"category_id\";}s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:45:\"Modules\\Category\\Entities\\CategoryTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:21:\"category_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:4:{s:2:\"id\";i:4;s:11:\"category_id\";i:4;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:18:\"Audio & Headphones\";}s:11:\"\0*\0original\";a:4:{s:2:\"id\";i:4;s:11:\"category_id\";i:4;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:18:\"Audio & Headphones\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:4:\"name\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:8:\"\0*\0total\";i:2;s:15:\"\0*\0parentColumn\";s:9:\"parent_id\";s:33:\"\0*\0removeItemsWithMissingAncestor\";b:1;s:14:\"\0*\0indentChars\";s:8:\"    \";s:15:\"\0*\0childrenName\";s:5:\"items\";s:17:\"\0*\0parentRelation\";s:6:\"parent\";}s:8:\"taxClass\";O:29:\"Modules\\Tax\\Entities\\TaxClass\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:11:\"tax_classes\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:3:{s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:8:\"based_on\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:20:\"translatedAttributes\";a:1:{i:0;s:5:\"label\";}s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0forceDeleting\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:7:\"variant\";N;s:4:\"item\";r:11;s:10:\"variations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:7:\"options\";O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"created_at\";i:1789065233;}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:9:\"\0*\0config\";a:5:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:6:\"events\";N;}}s:32:\"a9e619f656020d3b4e8c0031a4f56052\";O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:8:\"\0*\0items\";a:6:{s:2:\"id\";s:32:\"a9e619f656020d3b4e8c0031a4f56052\";s:4:\"name\";s:47:\"Crispy Peri Peri French Fries (1 Kg Jumbo Pack)\";s:5:\"price\";d:220;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:6:{s:7:\"product\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:22:{s:2:\"id\";i:59;s:8:\"brand_id\";N;s:12:\"tax_class_id\";N;s:4:\"slug\";s:45:\"crispy-peri-peri-french-fries-1-kg-jumbo-pack\";s:5:\"price\";s:8:\"220.0000\";s:13:\"special_price\";s:7:\"89.0000\";s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-09-11\";s:17:\"special_price_end\";s:10:\"2029-09-11\";s:13:\"selling_price\";s:8:\"220.0000\";s:3:\"sku\";s:14:\"FRIES-PERI-1KG\";s:12:\"manage_stock\";i:0;s:3:\"qty\";i:5000;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:0;s:9:\"is_active\";i:1;s:8:\"new_from\";N;s:6:\"new_to\";N;s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"is_virtual\";i:0;}s:11:\"\0*\0original\";a:22:{s:2:\"id\";i:59;s:8:\"brand_id\";N;s:12:\"tax_class_id\";N;s:4:\"slug\";s:45:\"crispy-peri-peri-french-fries-1-kg-jumbo-pack\";s:5:\"price\";s:8:\"220.0000\";s:13:\"special_price\";s:7:\"89.0000\";s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-09-11\";s:17:\"special_price_end\";s:10:\"2029-09-11\";s:13:\"selling_price\";s:8:\"220.0000\";s:3:\"sku\";s:14:\"FRIES-PERI-1KG\";s:12:\"manage_stock\";i:0;s:3:\"qty\";i:5000;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:0;s:9:\"is_active\";i:1;s:8:\"new_from\";N;s:6:\"new_to\";N;s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"is_virtual\";i:0;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:4:{s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:43:\"Modules\\Product\\Entities\\ProductTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:20:\"product_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:59;s:10:\"product_id\";i:59;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:47:\"Crispy Peri Peri French Fries (1 Kg Jumbo Pack)\";s:11:\"description\";s:152:\"Golden extra crunchy frozen french fries dusted with tangy peri peri masala spice mix. Premium North Bengal potato cut fries, ready to fry in 3 minutes.\";s:17:\"short_description\";s:49:\"1 Kg Jumbo pack of extra crunchy Peri Peri Fries.\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:59;s:10:\"product_id\";i:59;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:47:\"Crispy Peri Peri French Fries (1 Kg Jumbo Pack)\";s:11:\"description\";s:152:\"Golden extra crunchy frozen french fries dusted with tangy peri peri masala spice mix. Premium North Bengal potato cut fries, ready to fry in 3 minutes.\";s:17:\"short_description\";s:49:\"1 Kg Jumbo pack of extra crunchy Peri Peri Fries.\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:5:\"files\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:10:{s:2:\"id\";i:61;s:7:\"user_id\";i:1;s:8:\"filename\";s:9:\"fries.png\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:15:\"media/fries.png\";s:9:\"extension\";s:3:\"png\";s:4:\"mime\";s:9:\"image/png\";s:4:\"size\";s:7:\"1847401\";s:10:\"created_at\";s:19:\"2026-09-11 01:38:32\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:32\";}s:11:\"\0*\0original\";a:17:{s:2:\"id\";i:61;s:7:\"user_id\";i:1;s:8:\"filename\";s:9:\"fries.png\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:15:\"media/fries.png\";s:9:\"extension\";s:3:\"png\";s:4:\"mime\";s:9:\"image/png\";s:4:\"size\";s:7:\"1847401\";s:10:\"created_at\";s:19:\"2026-09-11 01:38:32\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:32\";s:15:\"pivot_entity_id\";i:59;s:13:\"pivot_file_id\";i:61;s:17:\"pivot_entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:8:\"pivot_id\";i:115;s:10:\"pivot_zone\";s:10:\"base_image\";s:16:\"pivot_created_at\";s:19:\"2026-09-11 01:38:33\";s:16:\"pivot_updated_at\";s:19:\"2026-09-11 01:38:33\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:5:\"pivot\";O:49:\"Illuminate\\Database\\Eloquent\\Relations\\MorphPivot\":36:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:12:\"entity_files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:59;s:7:\"file_id\";i:61;s:2:\"id\";i:115;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";}s:11:\"\0*\0original\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:59;s:7:\"file_id\";i:61;s:2:\"id\";i:115;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:13:\"\0*\0foreignKey\";s:9:\"entity_id\";s:13:\"\0*\0relatedKey\";s:7:\"file_id\";s:12:\"\0*\0morphType\";s:11:\"entity_type\";s:13:\"\0*\0morphClass\";s:32:\"Modules\\Product\\Entities\\Product\";}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"categories\";O:26:\"TypiCMS\\NestableCollection\":8:{s:8:\"\0*\0items\";a:1:{i:0;O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:43;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"crispy-fries-finger-foods\";s:8:\"position\";i:2;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";}s:11:\"\0*\0original\";a:10:{s:2:\"id\";i:43;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"crispy-fries-finger-foods\";s:8:\"position\";i:2;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";s:16:\"pivot_product_id\";i:59;s:17:\"pivot_category_id\";i:43;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:2:{s:5:\"pivot\";O:44:\"Illuminate\\Database\\Eloquent\\Relations\\Pivot\":34:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:18:\"product_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:10:\"product_id\";i:59;s:11:\"category_id\";i:43;}s:11:\"\0*\0original\";a:2:{s:10:\"product_id\";i:59;s:11:\"category_id\";i:43;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}s:13:\"\0*\0foreignKey\";s:10:\"product_id\";s:13:\"\0*\0relatedKey\";s:11:\"category_id\";}s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:45:\"Modules\\Category\\Entities\\CategoryTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:21:\"category_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:4:{s:2:\"id\";i:43;s:11:\"category_id\";i:43;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:27:\"Crispy Fries & Finger Foods\";}s:11:\"\0*\0original\";a:4:{s:2:\"id\";i:43;s:11:\"category_id\";i:43;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:27:\"Crispy Fries & Finger Foods\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:4:\"name\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:8:\"\0*\0total\";i:1;s:15:\"\0*\0parentColumn\";s:9:\"parent_id\";s:33:\"\0*\0removeItemsWithMissingAncestor\";b:1;s:14:\"\0*\0indentChars\";s:8:\"    \";s:15:\"\0*\0childrenName\";s:5:\"items\";s:17:\"\0*\0parentRelation\";s:6:\"parent\";}s:8:\"taxClass\";O:29:\"Modules\\Tax\\Entities\\TaxClass\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:11:\"tax_classes\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:3:{s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:8:\"based_on\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:20:\"translatedAttributes\";a:1:{i:0;s:5:\"label\";}s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0forceDeleting\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:7:\"variant\";N;s:4:\"item\";r:903;s:10:\"variations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:7:\"options\";O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"created_at\";i:1789070191;}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:9:\"\0*\0config\";a:5:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:6:\"events\";N;}}s:32:\"5ca95b95e27c6d97132bc4f0203dceab\";O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:8:\"\0*\0items\";a:6:{s:2:\"id\";s:32:\"5ca95b95e27c6d97132bc4f0203dceab\";s:4:\"name\";s:46:\"Classic Golden Salted French Fries (1 Kg Pack)\";s:5:\"price\";d:199;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:6:{s:7:\"product\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:22:{s:2:\"id\";i:60;s:8:\"brand_id\";N;s:12:\"tax_class_id\";N;s:4:\"slug\";s:44:\"classic-golden-salted-french-fries-1-kg-pack\";s:5:\"price\";s:8:\"199.0000\";s:13:\"special_price\";s:7:\"79.0000\";s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-09-11\";s:17:\"special_price_end\";s:10:\"2029-09-11\";s:13:\"selling_price\";s:8:\"199.0000\";s:3:\"sku\";s:13:\"FRIES-CLS-1KG\";s:12:\"manage_stock\";i:0;s:3:\"qty\";i:5000;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:0;s:9:\"is_active\";i:1;s:8:\"new_from\";N;s:6:\"new_to\";N;s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"is_virtual\";i:0;}s:11:\"\0*\0original\";a:22:{s:2:\"id\";i:60;s:8:\"brand_id\";N;s:12:\"tax_class_id\";N;s:4:\"slug\";s:44:\"classic-golden-salted-french-fries-1-kg-pack\";s:5:\"price\";s:8:\"199.0000\";s:13:\"special_price\";s:7:\"79.0000\";s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-09-11\";s:17:\"special_price_end\";s:10:\"2029-09-11\";s:13:\"selling_price\";s:8:\"199.0000\";s:3:\"sku\";s:13:\"FRIES-CLS-1KG\";s:12:\"manage_stock\";i:0;s:3:\"qty\";i:5000;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:0;s:9:\"is_active\";i:1;s:8:\"new_from\";N;s:6:\"new_to\";N;s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"is_virtual\";i:0;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:4:{s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:43:\"Modules\\Product\\Entities\\ProductTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:20:\"product_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:60;s:10:\"product_id\";i:60;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:46:\"Classic Golden Salted French Fries (1 Kg Pack)\";s:11:\"description\";s:142:\"Crispy restaurant-grade cut french fries. Made from high-grade potatoes, lightly blanched and blast-frozen at -18°C for unbeatable crispness.\";s:17:\"short_description\";s:49:\"100% crispy golden salted fries for quick snacks.\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:60;s:10:\"product_id\";i:60;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:46:\"Classic Golden Salted French Fries (1 Kg Pack)\";s:11:\"description\";s:142:\"Crispy restaurant-grade cut french fries. Made from high-grade potatoes, lightly blanched and blast-frozen at -18°C for unbeatable crispness.\";s:17:\"short_description\";s:49:\"100% crispy golden salted fries for quick snacks.\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:5:\"files\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:10:{s:2:\"id\";i:61;s:7:\"user_id\";i:1;s:8:\"filename\";s:9:\"fries.png\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:15:\"media/fries.png\";s:9:\"extension\";s:3:\"png\";s:4:\"mime\";s:9:\"image/png\";s:4:\"size\";s:7:\"1847401\";s:10:\"created_at\";s:19:\"2026-09-11 01:38:32\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:32\";}s:11:\"\0*\0original\";a:17:{s:2:\"id\";i:61;s:7:\"user_id\";i:1;s:8:\"filename\";s:9:\"fries.png\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:15:\"media/fries.png\";s:9:\"extension\";s:3:\"png\";s:4:\"mime\";s:9:\"image/png\";s:4:\"size\";s:7:\"1847401\";s:10:\"created_at\";s:19:\"2026-09-11 01:38:32\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:32\";s:15:\"pivot_entity_id\";i:60;s:13:\"pivot_file_id\";i:61;s:17:\"pivot_entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:8:\"pivot_id\";i:116;s:10:\"pivot_zone\";s:10:\"base_image\";s:16:\"pivot_created_at\";s:19:\"2026-09-11 01:38:33\";s:16:\"pivot_updated_at\";s:19:\"2026-09-11 01:38:33\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:5:\"pivot\";O:49:\"Illuminate\\Database\\Eloquent\\Relations\\MorphPivot\":36:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:12:\"entity_files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:60;s:7:\"file_id\";i:61;s:2:\"id\";i:116;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";}s:11:\"\0*\0original\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:60;s:7:\"file_id\";i:61;s:2:\"id\";i:116;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:13:\"\0*\0foreignKey\";s:9:\"entity_id\";s:13:\"\0*\0relatedKey\";s:7:\"file_id\";s:12:\"\0*\0morphType\";s:11:\"entity_type\";s:13:\"\0*\0morphClass\";s:32:\"Modules\\Product\\Entities\\Product\";}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"categories\";O:26:\"TypiCMS\\NestableCollection\":8:{s:8:\"\0*\0items\";a:1:{i:0;O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:43;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"crispy-fries-finger-foods\";s:8:\"position\";i:2;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";}s:11:\"\0*\0original\";a:10:{s:2:\"id\";i:43;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"crispy-fries-finger-foods\";s:8:\"position\";i:2;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";s:16:\"pivot_product_id\";i:60;s:17:\"pivot_category_id\";i:43;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:2:{s:5:\"pivot\";O:44:\"Illuminate\\Database\\Eloquent\\Relations\\Pivot\":34:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:18:\"product_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:10:\"product_id\";i:60;s:11:\"category_id\";i:43;}s:11:\"\0*\0original\";a:2:{s:10:\"product_id\";i:60;s:11:\"category_id\";i:43;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}s:13:\"\0*\0foreignKey\";s:10:\"product_id\";s:13:\"\0*\0relatedKey\";s:11:\"category_id\";}s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:45:\"Modules\\Category\\Entities\\CategoryTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:21:\"category_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:4:{s:2:\"id\";i:43;s:11:\"category_id\";i:43;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:27:\"Crispy Fries & Finger Foods\";}s:11:\"\0*\0original\";a:4:{s:2:\"id\";i:43;s:11:\"category_id\";i:43;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:27:\"Crispy Fries & Finger Foods\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:4:\"name\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:8:\"\0*\0total\";i:1;s:15:\"\0*\0parentColumn\";s:9:\"parent_id\";s:33:\"\0*\0removeItemsWithMissingAncestor\";b:1;s:14:\"\0*\0indentChars\";s:8:\"    \";s:15:\"\0*\0childrenName\";s:5:\"items\";s:17:\"\0*\0parentRelation\";s:6:\"parent\";}s:8:\"taxClass\";O:29:\"Modules\\Tax\\Entities\\TaxClass\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:11:\"tax_classes\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:3:{s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:8:\"based_on\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:20:\"translatedAttributes\";a:1:{i:0;s:5:\"label\";}s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0forceDeleting\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:7:\"variant\";N;s:4:\"item\";r:1649;s:10:\"variations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:7:\"options\";O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"created_at\";i:1789070197;}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:9:\"\0*\0config\";a:5:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:6:\"events\";N;}}s:32:\"79ded2f751fd791bb12f1020a5f6cc60\";O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:8:\"\0*\0items\";a:6:{s:2:\"id\";s:32:\"79ded2f751fd791bb12f1020a5f6cc60\";s:4:\"name\";s:48:\"Authentic Darjeeling Veg & Cheese Momos (24 Pcs)\";s:5:\"price\";d:249;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:6:{s:7:\"product\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:22:{s:2:\"id\";i:57;s:8:\"brand_id\";N;s:12:\"tax_class_id\";N;s:4:\"slug\";s:44:\"authentic-darjeeling-veg-cheese-momos-24-pcs\";s:5:\"price\";s:8:\"249.0000\";s:13:\"special_price\";s:7:\"99.0000\";s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-09-11\";s:17:\"special_price_end\";s:10:\"2029-09-11\";s:13:\"selling_price\";s:8:\"249.0000\";s:3:\"sku\";s:11:\"MOMO-VEG-24\";s:12:\"manage_stock\";i:0;s:3:\"qty\";i:5000;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:0;s:9:\"is_active\";i:1;s:8:\"new_from\";N;s:6:\"new_to\";N;s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"is_virtual\";i:0;}s:11:\"\0*\0original\";a:22:{s:2:\"id\";i:57;s:8:\"brand_id\";N;s:12:\"tax_class_id\";N;s:4:\"slug\";s:44:\"authentic-darjeeling-veg-cheese-momos-24-pcs\";s:5:\"price\";s:8:\"249.0000\";s:13:\"special_price\";s:7:\"99.0000\";s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-09-11\";s:17:\"special_price_end\";s:10:\"2029-09-11\";s:13:\"selling_price\";s:8:\"249.0000\";s:3:\"sku\";s:11:\"MOMO-VEG-24\";s:12:\"manage_stock\";i:0;s:3:\"qty\";i:5000;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:0;s:9:\"is_active\";i:1;s:8:\"new_from\";N;s:6:\"new_to\";N;s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"is_virtual\";i:0;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:4:{s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:43:\"Modules\\Product\\Entities\\ProductTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:20:\"product_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:57;s:10:\"product_id\";i:57;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:48:\"Authentic Darjeeling Veg & Cheese Momos (24 Pcs)\";s:11:\"description\";s:205:\"Traditional Darjeeling style vegetable & melted cheese momos filled with finely shredded fresh cabbage, carrots, bell peppers, processed cheese, and aromatic Himalayan herbs. Steam or pan-fry in 5 minutes.\";s:17:\"short_description\";s:54:\"Melted cheese & fresh veg momos from Darjeeling hills.\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:57;s:10:\"product_id\";i:57;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:48:\"Authentic Darjeeling Veg & Cheese Momos (24 Pcs)\";s:11:\"description\";s:205:\"Traditional Darjeeling style vegetable & melted cheese momos filled with finely shredded fresh cabbage, carrots, bell peppers, processed cheese, and aromatic Himalayan herbs. Steam or pan-fry in 5 minutes.\";s:17:\"short_description\";s:54:\"Melted cheese & fresh veg momos from Darjeeling hills.\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:5:\"files\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:10:{s:2:\"id\";i:60;s:7:\"user_id\";i:1;s:8:\"filename\";s:9:\"momos.png\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:15:\"media/momos.png\";s:9:\"extension\";s:3:\"png\";s:4:\"mime\";s:9:\"image/png\";s:4:\"size\";s:7:\"1838711\";s:10:\"created_at\";s:19:\"2026-09-11 01:38:32\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:32\";}s:11:\"\0*\0original\";a:17:{s:2:\"id\";i:60;s:7:\"user_id\";i:1;s:8:\"filename\";s:9:\"momos.png\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:15:\"media/momos.png\";s:9:\"extension\";s:3:\"png\";s:4:\"mime\";s:9:\"image/png\";s:4:\"size\";s:7:\"1838711\";s:10:\"created_at\";s:19:\"2026-09-11 01:38:32\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:32\";s:15:\"pivot_entity_id\";i:57;s:13:\"pivot_file_id\";i:60;s:17:\"pivot_entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:8:\"pivot_id\";i:113;s:10:\"pivot_zone\";s:10:\"base_image\";s:16:\"pivot_created_at\";s:19:\"2026-09-11 01:38:33\";s:16:\"pivot_updated_at\";s:19:\"2026-09-11 01:38:33\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:5:\"pivot\";O:49:\"Illuminate\\Database\\Eloquent\\Relations\\MorphPivot\":36:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:12:\"entity_files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:57;s:7:\"file_id\";i:60;s:2:\"id\";i:113;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";}s:11:\"\0*\0original\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:57;s:7:\"file_id\";i:60;s:2:\"id\";i:113;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:13:\"\0*\0foreignKey\";s:9:\"entity_id\";s:13:\"\0*\0relatedKey\";s:7:\"file_id\";s:12:\"\0*\0morphType\";s:11:\"entity_type\";s:13:\"\0*\0morphClass\";s:32:\"Modules\\Product\\Entities\\Product\";}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"categories\";O:26:\"TypiCMS\\NestableCollection\":8:{s:8:\"\0*\0items\";a:2:{i:0;O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:41;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"authentic-himalayan-momos\";s:8:\"position\";i:0;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";}s:11:\"\0*\0original\";a:10:{s:2:\"id\";i:41;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"authentic-himalayan-momos\";s:8:\"position\";i:0;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";s:16:\"pivot_product_id\";i:57;s:17:\"pivot_category_id\";i:41;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:2:{s:5:\"pivot\";O:44:\"Illuminate\\Database\\Eloquent\\Relations\\Pivot\":34:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:18:\"product_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:10:\"product_id\";i:57;s:11:\"category_id\";i:41;}s:11:\"\0*\0original\";a:2:{s:10:\"product_id\";i:57;s:11:\"category_id\";i:41;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}s:13:\"\0*\0foreignKey\";s:10:\"product_id\";s:13:\"\0*\0relatedKey\";s:11:\"category_id\";}s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:45:\"Modules\\Category\\Entities\\CategoryTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:21:\"category_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:4:{s:2:\"id\";i:41;s:11:\"category_id\";i:41;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:25:\"Authentic Himalayan Momos\";}s:11:\"\0*\0original\";a:4:{s:2:\"id\";i:41;s:11:\"category_id\";i:41;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:25:\"Authentic Himalayan Momos\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:4:\"name\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}i:1;O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:44;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"himalayan-kebabs-starters\";s:8:\"position\";i:3;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";}s:11:\"\0*\0original\";a:10:{s:2:\"id\";i:44;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"himalayan-kebabs-starters\";s:8:\"position\";i:3;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";s:16:\"pivot_product_id\";i:57;s:17:\"pivot_category_id\";i:44;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:2:{s:5:\"pivot\";O:44:\"Illuminate\\Database\\Eloquent\\Relations\\Pivot\":34:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:18:\"product_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:10:\"product_id\";i:57;s:11:\"category_id\";i:44;}s:11:\"\0*\0original\";a:2:{s:10:\"product_id\";i:57;s:11:\"category_id\";i:44;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";r:2845;s:12:\"pivotRelated\";r:2925;s:13:\"\0*\0foreignKey\";s:10:\"product_id\";s:13:\"\0*\0relatedKey\";s:11:\"category_id\";}s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:45:\"Modules\\Category\\Entities\\CategoryTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:21:\"category_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:4:{s:2:\"id\";i:44;s:11:\"category_id\";i:44;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:27:\"Himalayan Kebabs & Starters\";}s:11:\"\0*\0original\";a:4:{s:2:\"id\";i:44;s:11:\"category_id\";i:44;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:27:\"Himalayan Kebabs & Starters\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:4:\"name\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:8:\"\0*\0total\";i:2;s:15:\"\0*\0parentColumn\";s:9:\"parent_id\";s:33:\"\0*\0removeItemsWithMissingAncestor\";b:1;s:14:\"\0*\0indentChars\";s:8:\"    \";s:15:\"\0*\0childrenName\";s:5:\"items\";s:17:\"\0*\0parentRelation\";s:6:\"parent\";}s:8:\"taxClass\";O:29:\"Modules\\Tax\\Entities\\TaxClass\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:11:\"tax_classes\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:3:{s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:8:\"based_on\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:20:\"translatedAttributes\";a:1:{i:0;s:5:\"label\";}s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0forceDeleting\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:7:\"variant\";N;s:4:\"item\";r:2395;s:10:\"variations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:7:\"options\";O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"created_at\";i:1789071107;}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:9:\"\0*\0config\";a:5:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:6:\"events\";N;}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}','2026-09-10 19:03:53','2026-09-10 20:41:47'),
('SZJys6bwh4iwADDTNi7oI5dNFE7dZB4qzhBy4f0O_cart_conditions','O:41:\"Darryldecode\\Cart\\CartConditionCollection\":2:{s:8:\"\0*\0items\";a:1:{s:13:\"Free Shipping\";O:26:\"Modules\\Cart\\CartCondition\":2:{s:37:\"\0Darryldecode\\Cart\\CartCondition\0args\";a:6:{s:4:\"name\";s:13:\"Free Shipping\";s:4:\"type\";s:15:\"shipping_method\";s:6:\"target\";s:5:\"total\";s:5:\"value\";i:0;s:5:\"order\";i:1;s:10:\"attributes\";a:1:{s:15:\"shipping_method\";O:23:\"Modules\\Shipping\\Method\":3:{s:4:\"name\";s:13:\"free_shipping\";s:5:\"label\";s:13:\"Free Shipping\";s:4:\"cost\";O:21:\"Modules\\Support\\Money\":2:{s:29:\"\0Modules\\Support\\Money\0amount\";i:0;s:31:\"\0Modules\\Support\\Money\0currency\";s:3:\"INR\";}}}}s:14:\"parsedRawValue\";N;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}','2026-09-12 18:29:55','2026-09-12 18:30:03'),
('SZJys6bwh4iwADDTNi7oI5dNFE7dZB4qzhBy4f0O_cart_items','O:32:\"Darryldecode\\Cart\\CartCollection\":2:{s:8:\"\0*\0items\";a:2:{s:32:\"d3a7b863f3cc5e7eb0c88292f6515ee2\";O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:8:\"\0*\0items\";a:6:{s:2:\"id\";s:32:\"d3a7b863f3cc5e7eb0c88292f6515ee2\";s:4:\"name\";s:37:\"Mailee ₹10 VIP Club Membership Pass\";s:5:\"price\";d:10;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:6:{s:7:\"product\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:22:{s:2:\"id\";i:68;s:8:\"brand_id\";N;s:12:\"tax_class_id\";N;s:4:\"slug\";s:36:\"mailee-rs10-vip-club-membership-pass\";s:5:\"price\";s:7:\"10.0000\";s:13:\"special_price\";N;s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-09-11\";s:17:\"special_price_end\";s:10:\"2029-09-11\";s:13:\"selling_price\";s:7:\"10.0000\";s:3:\"sku\";s:15:\"MAILEE-VIP-PASS\";s:12:\"manage_stock\";i:0;s:3:\"qty\";i:5000;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:1;s:9:\"is_active\";i:1;s:8:\"new_from\";N;s:6:\"new_to\";N;s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"is_virtual\";i:0;}s:11:\"\0*\0original\";a:22:{s:2:\"id\";i:68;s:8:\"brand_id\";N;s:12:\"tax_class_id\";N;s:4:\"slug\";s:36:\"mailee-rs10-vip-club-membership-pass\";s:5:\"price\";s:7:\"10.0000\";s:13:\"special_price\";N;s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-09-11\";s:17:\"special_price_end\";s:10:\"2029-09-11\";s:13:\"selling_price\";s:7:\"10.0000\";s:3:\"sku\";s:15:\"MAILEE-VIP-PASS\";s:12:\"manage_stock\";i:0;s:3:\"qty\";i:5000;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:1;s:9:\"is_active\";i:1;s:8:\"new_from\";N;s:6:\"new_to\";N;s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"is_virtual\";i:0;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:4:{s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:43:\"Modules\\Product\\Entities\\ProductTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:20:\"product_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:68;s:10:\"product_id\";i:68;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:37:\"Mailee ₹10 VIP Club Membership Pass\";s:11:\"description\";s:275:\"Join the official Mailee ₹10 VIP Club! Pay just ₹10 once and unlock extreme wholesale discount prices (up to 70% OFF) on all authentic Himalayan frozen momos, parathas, fries, and finger foods delivered across North Bengal (Siliguri, Darjeeling, Jalpaiguri, Cooch Behar).\";s:17:\"short_description\";s:61:\"Pay ₹10 & Unlock Extreme Wholesale Discounts on All Orders!\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:68;s:10:\"product_id\";i:68;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:37:\"Mailee ₹10 VIP Club Membership Pass\";s:11:\"description\";s:275:\"Join the official Mailee ₹10 VIP Club! Pay just ₹10 once and unlock extreme wholesale discount prices (up to 70% OFF) on all authentic Himalayan frozen momos, parathas, fries, and finger foods delivered across North Bengal (Siliguri, Darjeeling, Jalpaiguri, Cooch Behar).\";s:17:\"short_description\";s:61:\"Pay ₹10 & Unlock Extreme Wholesale Discounts on All Orders!\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:5:\"files\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:10:{s:2:\"id\";i:59;s:7:\"user_id\";i:1;s:8:\"filename\";s:14:\"membership.png\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:20:\"media/membership.png\";s:9:\"extension\";s:3:\"png\";s:4:\"mime\";s:9:\"image/png\";s:4:\"size\";s:7:\"1450134\";s:10:\"created_at\";s:19:\"2026-09-11 01:38:32\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:32\";}s:11:\"\0*\0original\";a:17:{s:2:\"id\";i:59;s:7:\"user_id\";i:1;s:8:\"filename\";s:14:\"membership.png\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:20:\"media/membership.png\";s:9:\"extension\";s:3:\"png\";s:4:\"mime\";s:9:\"image/png\";s:4:\"size\";s:7:\"1450134\";s:10:\"created_at\";s:19:\"2026-09-11 01:38:32\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:32\";s:15:\"pivot_entity_id\";i:68;s:13:\"pivot_file_id\";i:59;s:17:\"pivot_entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:8:\"pivot_id\";i:124;s:10:\"pivot_zone\";s:10:\"base_image\";s:16:\"pivot_created_at\";s:19:\"2026-09-11 01:38:33\";s:16:\"pivot_updated_at\";s:19:\"2026-09-11 01:38:33\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:5:\"pivot\";O:49:\"Illuminate\\Database\\Eloquent\\Relations\\MorphPivot\":36:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:12:\"entity_files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:68;s:7:\"file_id\";i:59;s:2:\"id\";i:124;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";}s:11:\"\0*\0original\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:68;s:7:\"file_id\";i:59;s:2:\"id\";i:124;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:13:\"\0*\0foreignKey\";s:9:\"entity_id\";s:13:\"\0*\0relatedKey\";s:7:\"file_id\";s:12:\"\0*\0morphType\";s:11:\"entity_type\";s:13:\"\0*\0morphClass\";s:32:\"Modules\\Product\\Entities\\Product\";}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"categories\";O:26:\"TypiCMS\\NestableCollection\":8:{s:8:\"\0*\0items\";a:1:{i:0;O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:47;s:9:\"parent_id\";N;s:4:\"slug\";s:26:\"mailee-rs10-vip-membership\";s:8:\"position\";i:6;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";}s:11:\"\0*\0original\";a:10:{s:2:\"id\";i:47;s:9:\"parent_id\";N;s:4:\"slug\";s:26:\"mailee-rs10-vip-membership\";s:8:\"position\";i:6;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";s:16:\"pivot_product_id\";i:68;s:17:\"pivot_category_id\";i:47;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:2:{s:5:\"pivot\";O:44:\"Illuminate\\Database\\Eloquent\\Relations\\Pivot\":34:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:18:\"product_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:10:\"product_id\";i:68;s:11:\"category_id\";i:47;}s:11:\"\0*\0original\";a:2:{s:10:\"product_id\";i:68;s:11:\"category_id\";i:47;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}s:13:\"\0*\0foreignKey\";s:10:\"product_id\";s:13:\"\0*\0relatedKey\";s:11:\"category_id\";}s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:45:\"Modules\\Category\\Entities\\CategoryTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:21:\"category_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:4:{s:2:\"id\";i:47;s:11:\"category_id\";i:47;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:27:\"Mailee ₹10 VIP Membership\";}s:11:\"\0*\0original\";a:4:{s:2:\"id\";i:47;s:11:\"category_id\";i:47;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:27:\"Mailee ₹10 VIP Membership\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:4:\"name\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:8:\"\0*\0total\";i:1;s:15:\"\0*\0parentColumn\";s:9:\"parent_id\";s:33:\"\0*\0removeItemsWithMissingAncestor\";b:1;s:14:\"\0*\0indentChars\";s:8:\"    \";s:15:\"\0*\0childrenName\";s:5:\"items\";s:17:\"\0*\0parentRelation\";s:6:\"parent\";}s:8:\"taxClass\";O:29:\"Modules\\Tax\\Entities\\TaxClass\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:11:\"tax_classes\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:3:{s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:8:\"based_on\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:20:\"translatedAttributes\";a:1:{i:0;s:5:\"label\";}s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0forceDeleting\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:7:\"variant\";N;s:4:\"item\";r:11;s:10:\"variations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:7:\"options\";O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"created_at\";i:1789241533;}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:9:\"\0*\0config\";a:5:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:6:\"events\";N;}}s:32:\"eeb83c1b55cfce3c11a31227aacb4510\";O:32:\"Darryldecode\\Cart\\ItemCollection\":3:{s:8:\"\0*\0items\";a:6:{s:2:\"id\";s:32:\"eeb83c1b55cfce3c11a31227aacb4510\";s:4:\"name\";s:36:\"Mutton (Goat Meat) Momos (1 Kg Pack)\";s:5:\"price\";d:560;s:8:\"quantity\";i:1;s:10:\"attributes\";O:41:\"Darryldecode\\Cart\\ItemAttributeCollection\":2:{s:8:\"\0*\0items\";a:6:{s:7:\"product\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:22:{s:2:\"id\";i:71;s:8:\"brand_id\";N;s:12:\"tax_class_id\";N;s:4:\"slug\";s:26:\"mutton-goat-meat-momos-1kg\";s:5:\"price\";s:8:\"800.0000\";s:13:\"special_price\";s:8:\"560.0000\";s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-09-10\";s:17:\"special_price_end\";s:10:\"2029-09-11\";s:13:\"selling_price\";s:8:\"560.0000\";s:3:\"sku\";s:9:\"ML-92EE8A\";s:12:\"manage_stock\";i:0;s:3:\"qty\";i:5000;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:0;s:9:\"is_active\";i:1;s:8:\"new_from\";N;s:6:\"new_to\";N;s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"is_virtual\";i:0;}s:11:\"\0*\0original\";a:22:{s:2:\"id\";i:71;s:8:\"brand_id\";N;s:12:\"tax_class_id\";N;s:4:\"slug\";s:26:\"mutton-goat-meat-momos-1kg\";s:5:\"price\";s:8:\"800.0000\";s:13:\"special_price\";s:8:\"560.0000\";s:18:\"special_price_type\";s:5:\"fixed\";s:19:\"special_price_start\";s:10:\"2026-09-10\";s:17:\"special_price_end\";s:10:\"2029-09-11\";s:13:\"selling_price\";s:8:\"560.0000\";s:3:\"sku\";s:9:\"ML-92EE8A\";s:12:\"manage_stock\";i:0;s:3:\"qty\";i:5000;s:8:\"in_stock\";i:1;s:6:\"viewed\";i:0;s:9:\"is_active\";i:1;s:8:\"new_from\";N;s:6:\"new_to\";N;s:10:\"deleted_at\";N;s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"is_virtual\";i:0;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:4:{s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:43:\"Modules\\Product\\Entities\\ProductTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:20:\"product_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:71;s:10:\"product_id\";i:71;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:36:\"Mutton (Goat Meat) Momos (1 Kg Pack)\";s:11:\"description\";s:270:\"<p>Rich, juicy Himalayan goat meat filling spiced with hand-pounded mountain coriander, garlic, and wild herbs. The pride of Darjeeling.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>\";s:17:\"short_description\";s:133:\"Rich, juicy Himalayan goat meat filling spiced with hand-pounded mountain coriander, garlic, and wild herbs. The pride of Darjeeling.\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:71;s:10:\"product_id\";i:71;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:36:\"Mutton (Goat Meat) Momos (1 Kg Pack)\";s:11:\"description\";s:270:\"<p>Rich, juicy Himalayan goat meat filling spiced with hand-pounded mountain coriander, garlic, and wild herbs. The pride of Darjeeling.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>\";s:17:\"short_description\";s:133:\"Rich, juicy Himalayan goat meat filling spiced with hand-pounded mountain coriander, garlic, and wild herbs. The pride of Darjeeling.\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:5:\"files\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:10:{s:2:\"id\";i:75;s:7:\"user_id\";i:1;s:8:\"filename\";s:15:\"mutton_momo.jpg\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:21:\"media/mutton_momo.jpg\";s:9:\"extension\";s:3:\"jpg\";s:4:\"mime\";s:10:\"image/jpeg\";s:4:\"size\";s:6:\"158822\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";}s:11:\"\0*\0original\";a:17:{s:2:\"id\";i:75;s:7:\"user_id\";i:1;s:8:\"filename\";s:15:\"mutton_momo.jpg\";s:4:\"disk\";s:14:\"public_storage\";s:4:\"path\";s:21:\"media/mutton_momo.jpg\";s:9:\"extension\";s:3:\"jpg\";s:4:\"mime\";s:10:\"image/jpeg\";s:4:\"size\";s:6:\"158822\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";s:15:\"pivot_entity_id\";i:71;s:13:\"pivot_file_id\";i:75;s:17:\"pivot_entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:8:\"pivot_id\";i:130;s:10:\"pivot_zone\";s:10:\"base_image\";s:16:\"pivot_created_at\";s:19:\"2026-09-11 11:15:23\";s:16:\"pivot_updated_at\";s:19:\"2026-09-11 11:15:23\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:5:\"pivot\";O:49:\"Illuminate\\Database\\Eloquent\\Relations\\MorphPivot\":36:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:12:\"entity_files\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:71;s:7:\"file_id\";i:75;s:2:\"id\";i:130;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";}s:11:\"\0*\0original\";a:7:{s:11:\"entity_type\";s:32:\"Modules\\Product\\Entities\\Product\";s:9:\"entity_id\";i:71;s:7:\"file_id\";i:75;s:2:\"id\";i:130;s:4:\"zone\";s:10:\"base_image\";s:10:\"created_at\";s:19:\"2026-09-11 11:15:23\";s:10:\"updated_at\";s:19:\"2026-09-11 11:15:23\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:27:\"Modules\\Media\\Entities\\File\":30:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:13:\"\0*\0foreignKey\";s:9:\"entity_id\";s:13:\"\0*\0relatedKey\";s:7:\"file_id\";s:12:\"\0*\0morphType\";s:11:\"entity_type\";s:13:\"\0*\0morphClass\";s:32:\"Modules\\Product\\Entities\\Product\";}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:3:{i:0;s:2:\"id\";i:1;s:8:\"filename\";i:2;s:4:\"path\";}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"categories\";O:26:\"TypiCMS\\NestableCollection\":8:{s:8:\"\0*\0items\";a:1:{i:0;O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:41;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"authentic-himalayan-momos\";s:8:\"position\";i:0;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";}s:11:\"\0*\0original\";a:10:{s:2:\"id\";i:41;s:9:\"parent_id\";N;s:4:\"slug\";s:25:\"authentic-himalayan-momos\";s:8:\"position\";i:0;s:13:\"is_searchable\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-09-11 01:38:33\";s:10:\"updated_at\";s:19:\"2026-09-11 01:38:33\";s:16:\"pivot_product_id\";i:71;s:17:\"pivot_category_id\";i:41;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:2:{s:5:\"pivot\";O:44:\"Illuminate\\Database\\Eloquent\\Relations\\Pivot\":34:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:18:\"product_categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:0;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:10:\"product_id\";i:71;s:11:\"category_id\";i:41;}s:11:\"\0*\0original\";a:2:{s:10:\"product_id\";i:71;s:11:\"category_id\";i:41;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}s:11:\"pivotParent\";O:32:\"Modules\\Product\\Entities\\Product\":35:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:9:{s:10:\"is_virtual\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";s:19:\"special_price_start\";s:8:\"datetime\";s:17:\"special_price_end\";s:8:\"datetime\";s:8:\"new_from\";s:8:\"datetime\";s:6:\"new_to\";s:8:\"datetime\";s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:13:{i:0;s:10:\"base_image\";i:1;s:17:\"additional_images\";i:2;s:5:\"media\";i:3;s:15:\"formatted_price\";i:4;s:21:\"formatted_price_range\";i:5;s:28:\"has_percentage_special_price\";i:6;s:21:\"special_price_percent\";i:7;s:14:\"rating_percent\";i:8;s:17:\"does_manage_stock\";i:9;s:11:\"is_in_stock\";i:10;s:15:\"is_out_of_stock\";i:11;s:6:\"is_new\";i:12;s:7:\"variant\";}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:12:\"pivotRelated\";O:34:\"Modules\\Category\\Entities\\Category\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:13:\"is_searchable\";s:7:\"boolean\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}s:13:\"\0*\0foreignKey\";s:10:\"product_id\";s:13:\"\0*\0relatedKey\";s:11:\"category_id\";}s:12:\"translations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:45:\"Modules\\Category\\Entities\\CategoryTranslation\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:21:\"category_translations\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:4:{s:2:\"id\";i:41;s:11:\"category_id\";i:41;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:25:\"Authentic Himalayan Momos\";}s:11:\"\0*\0original\";a:4:{s:2:\"id\";i:41;s:11:\"category_id\";i:41;s:6:\"locale\";s:2:\"en\";s:4:\"name\";s:25:\"Authentic Himalayan Momos\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:4:\"name\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:12:\"translations\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:5:{i:0;s:9:\"parent_id\";i:1;s:4:\"slug\";i:2;s:8:\"position\";i:3;s:13:\"is_searchable\";i:4;s:9:\"is_active\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:1:{i:0;s:4:\"name\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:8:\"\0*\0total\";i:1;s:15:\"\0*\0parentColumn\";s:9:\"parent_id\";s:33:\"\0*\0removeItemsWithMissingAncestor\";b:1;s:14:\"\0*\0indentChars\";s:8:\"    \";s:15:\"\0*\0childrenName\";s:5:\"items\";s:17:\"\0*\0parentRelation\";s:6:\"parent\";}s:8:\"taxClass\";O:29:\"Modules\\Tax\\Entities\\TaxClass\":33:{s:13:\"\0*\0connection\";N;s:8:\"\0*\0table\";s:11:\"tax_classes\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:1:{i:0;s:12:\"translations\";}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:0;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:0:{}s:11:\"\0*\0original\";a:0:{}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:3:{s:10:\"start_date\";s:8:\"datetime\";s:8:\"end_date\";s:8:\"datetime\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:8:\"based_on\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:20:\"translatedAttributes\";a:1:{i:0;s:5:\"label\";}s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0forceDeleting\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:17:{i:0;s:8:\"brand_id\";i:1;s:12:\"tax_class_id\";i:2;s:4:\"slug\";i:3;s:3:\"sku\";i:4;s:5:\"price\";i:5;s:13:\"special_price\";i:6;s:18:\"special_price_type\";i:7;s:19:\"special_price_start\";i:8;s:17:\"special_price_end\";i:9;s:13:\"selling_price\";i:10;s:12:\"manage_stock\";i:11;s:3:\"qty\";i:12;s:8:\"in_stock\";i:13;s:10:\"is_virtual\";i:14;s:9:\"is_active\";i:15;s:8:\"new_from\";i:16;s:6:\"new_to\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}s:23:\"\0*\0translatedAttributes\";a:3:{i:0;s:4:\"name\";i:1;s:11:\"description\";i:2;s:17:\"short_description\";}s:16:\"\0*\0slugAttribute\";s:4:\"name\";s:16:\"\0*\0defaultLocale\";N;s:16:\"\0*\0scoutMetadata\";a:0:{}s:16:\"\0*\0forceDeleting\";b:0;}s:7:\"variant\";N;s:4:\"item\";r:757;s:10:\"variations\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:7:\"options\";O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"created_at\";i:1789238394;}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"conditions\";a:0:{}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:9:\"\0*\0config\";a:5:{s:14:\"format_numbers\";b:0;s:8:\"decimals\";i:0;s:9:\"dec_point\";s:1:\".\";s:13:\"thousands_sep\";s:1:\",\";s:6:\"events\";N;}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}','2026-09-12 18:17:04','2026-09-12 20:02:17');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `is_searchable` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES
(41,NULL,'authentic-himalayan-momos',0,1,1,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(42,NULL,'frozen-parathas-breads',1,1,1,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(43,NULL,'crispy-fries-finger-foods',2,1,1,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(44,NULL,'himalayan-kebabs-starters',3,1,1,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(45,NULL,'sub-zero-farm-iqf-veggies',4,1,1,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(46,NULL,'curated-combos-party-packs',5,1,1,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(47,NULL,'mailee-rs10-vip-membership',6,1,1,'2026-09-10 20:08:33','2026-09-10 20:08:33');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `category_translations`
--

DROP TABLE IF EXISTS `category_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_translations_category_id_locale_unique` (`category_id`,`locale`),
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `category_translations` WRITE;
/*!40000 ALTER TABLE `category_translations` DISABLE KEYS */;
INSERT INTO `category_translations` VALUES
(41,41,'en','Authentic Himalayan Momos'),
(42,42,'en','Frozen Parathas & Breads'),
(43,43,'en','Crispy Fries & Finger Foods'),
(44,44,'en','Himalayan Kebabs & Starters'),
(45,45,'en','Sub-Zero Farm IQF Veggies'),
(46,46,'en','Curated Combos & Party Packs'),
(47,47,'en','Mailee ₹10 VIP Membership');
/*!40000 ALTER TABLE `category_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `coupon_categories`
--

DROP TABLE IF EXISTS `coupon_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_categories` (
  `coupon_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `exclude` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`coupon_id`,`category_id`,`exclude`),
  KEY `coupon_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `coupon_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `coupon_categories_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_categories`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `coupon_categories` WRITE;
/*!40000 ALTER TABLE `coupon_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `coupon_products`
--

DROP TABLE IF EXISTS `coupon_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_products` (
  `coupon_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `exclude` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`coupon_id`,`product_id`),
  KEY `coupon_products_product_id_foreign` (`product_id`),
  CONSTRAINT `coupon_products_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `coupon_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_products`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `coupon_products` WRITE;
/*!40000 ALTER TABLE `coupon_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_products` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `coupon_translations`
--

DROP TABLE IF EXISTS `coupon_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupon_translations_coupon_id_locale_unique` (`coupon_id`,`locale`),
  CONSTRAINT `coupon_translations_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `coupon_translations` WRITE;
/*!40000 ALTER TABLE `coupon_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `value` decimal(18,4) unsigned DEFAULT NULL,
  `is_percent` tinyint(1) NOT NULL,
  `free_shipping` tinyint(1) NOT NULL,
  `minimum_spend` decimal(18,4) unsigned DEFAULT NULL,
  `maximum_spend` decimal(18,4) unsigned DEFAULT NULL,
  `usage_limit_per_coupon` int(10) unsigned DEFAULT NULL,
  `usage_limit_per_customer` int(10) unsigned DEFAULT NULL,
  `used` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coupons_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `cross_sell_products`
--

DROP TABLE IF EXISTS `cross_sell_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cross_sell_products` (
  `product_id` int(10) unsigned NOT NULL,
  `cross_sell_product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`,`cross_sell_product_id`),
  KEY `cross_sell_products_cross_sell_product_id_foreign` (`cross_sell_product_id`),
  CONSTRAINT `cross_sell_products_cross_sell_product_id_foreign` FOREIGN KEY (`cross_sell_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cross_sell_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cross_sell_products`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `cross_sell_products` WRITE;
/*!40000 ALTER TABLE `cross_sell_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `cross_sell_products` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `currency_rates`
--

DROP TABLE IF EXISTS `currency_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(191) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_rates_currency_unique` (`currency`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_rates`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `currency_rates` WRITE;
/*!40000 ALTER TABLE `currency_rates` DISABLE KEYS */;
INSERT INTO `currency_rates` VALUES
(5,'INR',1.0000,'2026-09-10 20:08:33','2026-09-10 20:08:33');
/*!40000 ALTER TABLE `currency_rates` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `default_addresses`
--

DROP TABLE IF EXISTS `default_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `default_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `address_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `default_addresses_customer_id_foreign` (`customer_id`),
  KEY `default_addresses_address_id_foreign` (`address_id`),
  CONSTRAINT `default_addresses_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `default_addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_addresses`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `default_addresses` WRITE;
/*!40000 ALTER TABLE `default_addresses` DISABLE KEYS */;
INSERT INTO `default_addresses` VALUES
(1,1,1);
/*!40000 ALTER TABLE `default_addresses` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `entity_files`
--

DROP TABLE IF EXISTS `entity_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `entity_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned NOT NULL,
  `entity_type` varchar(191) NOT NULL,
  `entity_id` bigint(20) unsigned NOT NULL,
  `zone` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entity_files_entity_type_entity_id_index` (`entity_type`,`entity_id`),
  KEY `entity_files_file_id_index` (`file_id`),
  KEY `entity_files_zone_index` (`zone`),
  CONSTRAINT `entity_files_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_files`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `entity_files` WRITE;
/*!40000 ALTER TABLE `entity_files` DISABLE KEYS */;
INSERT INTO `entity_files` VALUES
(98,60,'Modules\\Category\\Entities\\Category',41,'logo','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(99,60,'Modules\\Category\\Entities\\Category',41,'banner','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(100,62,'Modules\\Category\\Entities\\Category',42,'logo','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(101,62,'Modules\\Category\\Entities\\Category',42,'banner','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(102,61,'Modules\\Category\\Entities\\Category',43,'logo','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(103,61,'Modules\\Category\\Entities\\Category',43,'banner','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(104,64,'Modules\\Category\\Entities\\Category',44,'logo','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(105,64,'Modules\\Category\\Entities\\Category',44,'banner','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(106,65,'Modules\\Category\\Entities\\Category',45,'logo','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(107,65,'Modules\\Category\\Entities\\Category',45,'banner','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(108,60,'Modules\\Category\\Entities\\Category',46,'logo','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(109,60,'Modules\\Category\\Entities\\Category',46,'banner','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(110,59,'Modules\\Category\\Entities\\Category',47,'logo','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(111,59,'Modules\\Category\\Entities\\Category',47,'banner','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(112,60,'Modules\\Product\\Entities\\Product',56,'base_image','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(113,60,'Modules\\Product\\Entities\\Product',57,'base_image','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(114,60,'Modules\\Product\\Entities\\Product',58,'base_image','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(115,61,'Modules\\Product\\Entities\\Product',59,'base_image','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(116,61,'Modules\\Product\\Entities\\Product',60,'base_image','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(117,62,'Modules\\Product\\Entities\\Product',61,'base_image','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(118,63,'Modules\\Product\\Entities\\Product',62,'base_image','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(119,64,'Modules\\Product\\Entities\\Product',63,'base_image','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(120,65,'Modules\\Product\\Entities\\Product',64,'base_image','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(121,66,'Modules\\Product\\Entities\\Product',65,'base_image','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(122,63,'Modules\\Product\\Entities\\Product',66,'base_image','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(123,60,'Modules\\Product\\Entities\\Product',67,'base_image','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(124,59,'Modules\\Product\\Entities\\Product',68,'base_image','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(125,60,'Modules\\Blog\\Entities\\BlogPost',4,'featured_image','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(126,62,'Modules\\Blog\\Entities\\BlogPost',5,'featured_image','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(127,63,'Modules\\Blog\\Entities\\BlogPost',6,'featured_image','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(128,73,'Modules\\Product\\Entities\\Product',69,'base_image','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(129,74,'Modules\\Product\\Entities\\Product',70,'base_image','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(130,75,'Modules\\Product\\Entities\\Product',71,'base_image','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(131,76,'Modules\\Product\\Entities\\Product',72,'base_image','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(132,77,'Modules\\Product\\Entities\\Product',73,'base_image','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(133,79,'Modules\\Product\\Entities\\Product',74,'base_image','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(134,81,'Modules\\Product\\Entities\\Product',75,'base_image','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(135,80,'Modules\\Product\\Entities\\Product',76,'base_image','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(136,83,'Modules\\Product\\Entities\\Product',77,'base_image','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(137,74,'Modules\\Product\\Entities\\Product',78,'base_image','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(138,84,'Modules\\Product\\Entities\\Product',79,'base_image','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(139,86,'Modules\\Product\\Entities\\Product',80,'base_image','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(140,87,'Modules\\Product\\Entities\\Product',81,'base_image','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(141,88,'Modules\\Product\\Entities\\Product',82,'base_image','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(142,90,'Modules\\Product\\Entities\\Product',83,'base_image','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(143,89,'Modules\\Product\\Entities\\Product',84,'base_image','2026-09-11 05:45:23','2026-09-11 05:45:23');
/*!40000 ALTER TABLE `entity_files` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `filename` varchar(191) NOT NULL,
  `disk` varchar(191) NOT NULL,
  `path` varchar(191) NOT NULL,
  `extension` varchar(191) NOT NULL,
  `mime` varchar(191) NOT NULL,
  `size` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `files_user_id_index` (`user_id`),
  KEY `files_filename_index` (`filename`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES
(57,1,'logo.png','public_storage','media/logo.png','png','image/png','156761','2026-09-10 20:08:32','2026-09-10 20:08:32'),
(58,1,'hero_banner.png','public_storage','media/hero_banner.png','png','image/png','1695392','2026-09-10 20:08:32','2026-09-10 20:08:32'),
(59,1,'membership.png','public_storage','media/membership.png','png','image/png','1450134','2026-09-10 20:08:32','2026-09-10 20:08:32'),
(60,1,'momos.png','public_storage','media/momos.png','png','image/png','1838711','2026-09-10 20:08:32','2026-09-10 20:08:32'),
(61,1,'fries.png','public_storage','media/fries.png','png','image/png','1847401','2026-09-10 20:08:32','2026-09-10 20:08:32'),
(62,1,'paratha.png','public_storage','media/paratha.png','png','image/png','1994696','2026-09-10 20:08:32','2026-09-10 20:08:32'),
(63,1,'spring_rolls.png','public_storage','media/spring_rolls.png','png','image/png','1862445','2026-09-10 20:08:32','2026-09-10 20:08:32'),
(64,1,'kebabs.png','public_storage','media/kebabs.png','png','image/png','2060176','2026-09-10 20:08:32','2026-09-10 20:08:32'),
(65,1,'peas.png','public_storage','media/peas.png','png','image/png','1932662','2026-09-10 20:08:32','2026-09-10 20:08:32'),
(66,1,'nuggets.png','public_storage','media/nuggets.png','png','image/png','1816023','2026-09-10 20:08:32','2026-09-10 20:08:32'),
(67,1,'side_banner_1.png','public_storage','media/side_banner_1.png','png','image/png','1450134','2026-09-10 20:08:32','2026-09-10 20:08:32'),
(68,1,'side_banner_2.png','public_storage','media/side_banner_2.png','png','image/png','1838711','2026-09-10 20:08:32','2026-09-10 20:08:32'),
(69,1,'one_col_banner.png','public_storage','media/one_col_banner.png','png','image/png','1695392','2026-09-10 20:08:32','2026-09-10 20:08:32'),
(70,1,'two_col_banner_1.png','public_storage','media/two_col_banner_1.png','png','image/png','1862445','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(71,1,'two_col_banner_2.png','public_storage','media/two_col_banner_2.png','png','image/png','2060176','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(72,1,'mailee_mascot_logo.png','public_storage','media/mailee_mascot_logo.png','png','image/png','648396','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(73,1,'classic_chicken_momo.jpg','public_storage','media/classic_chicken_momo.jpg','jpg','image/jpeg','221696','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(74,1,'mix_veg_momo.jpg','public_storage','media/mix_veg_momo.jpg','jpg','image/jpeg','238387','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(75,1,'mutton_momo.jpg','public_storage','media/mutton_momo.jpg','jpg','image/jpeg','158822','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(76,1,'paneer_momo.jpg','public_storage','media/paneer_momo.jpg','jpg','image/jpeg','165580','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(77,1,'palak_paneer_momo.jpg','public_storage','media/palak_paneer_momo.jpg','jpg','image/jpeg','241766','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(78,1,'palak_paneer_plated.jpg','public_storage','media/palak_paneer_plated.jpg','jpg','image/jpeg','119193','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(79,1,'cheese_chicken_momo.jpg','public_storage','media/cheese_chicken_momo.jpg','jpg','image/jpeg','151961','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(80,1,'chicken_rice_momo.jpg','public_storage','media/chicken_rice_momo.jpg','jpg','image/jpeg','191078','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(81,1,'tandoori_chicken_momo.jpg','public_storage','media/tandoori_chicken_momo.jpg','jpg','image/jpeg','224665','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(82,1,'tandoori_paneer_momo.jpg','public_storage','media/tandoori_paneer_momo.jpg','jpg','image/jpeg','161382','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(83,1,'sweet_corn_cheese_momo.jpg','public_storage','media/sweet_corn_cheese_momo.jpg','jpg','image/jpeg','238182','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(84,1,'choco_lava_steam_bun.jpg','public_storage','media/choco_lava_steam_bun.jpg','jpg','image/jpeg','158291','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(85,1,'choco_lava_plate.jpg','public_storage','media/choco_lava_plate.jpg','jpg','image/jpeg','91852','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(86,1,'mutton_meatballs.jpg','public_storage','media/mutton_meatballs.jpg','jpg','image/jpeg','230707','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(87,1,'chicken_keema_paratha.jpg','public_storage','media/chicken_keema_paratha.jpg','jpg','image/jpeg','201523','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(88,1,'laccha_paratha.jpg','public_storage','media/laccha_paratha.jpg','jpg','image/jpeg','147456','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(89,1,'takeaway_bento_box.jpg','public_storage','media/takeaway_bento_box.jpg','jpg','image/jpeg','174899','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(90,1,'crispy_onion_rings.jpg','public_storage','media/crispy_onion_rings.jpg','jpg','image/jpeg','97996','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(91,1,'press_times_of_india.jpg','public_storage','media/press_times_of_india.jpg','jpg','image/jpeg','415846','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(92,1,'press_toi_iim_calcutta.jpg','public_storage','media/press_toi_iim_calcutta.jpg','jpg','image/jpeg','617062','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(93,1,'press_the_statesman.jpg','public_storage','media/press_the_statesman.jpg','jpg','image/jpeg','557568','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(94,1,'press_anandabazar_patrika.jpg','public_storage','media/press_anandabazar_patrika.jpg','jpg','image/jpeg','461004','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(95,1,'press_ei_samay.jpg','public_storage','media/press_ei_samay.jpg','jpg','image/jpeg','623308','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(96,1,'press_dainik_jagran.jpg','public_storage','media/press_dainik_jagran.jpg','jpg','image/jpeg','447590','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(97,1,'press_sikkim_express.jpg','public_storage','media/press_sikkim_express.jpg','jpg','image/jpeg','430489','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(98,1,'press_himalayan_mirror.jpg','public_storage','media/press_himalayan_mirror.jpg','jpg','image/jpeg','558899','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(99,1,'press_karmakshetra.jpg','public_storage','media/press_karmakshetra.jpg','jpg','image/jpeg','664985','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(100,1,'press_egiye_bangla_award.jpg','public_storage','media/press_egiye_bangla_award.jpg','jpg','image/jpeg','548352','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(101,1,'press_dog_welfare.jpg','public_storage','media/press_dog_welfare.jpg','jpg','image/jpeg','479846','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(102,1,'siliguri_food_festival_banner.jpg','public_storage','media/siliguri_food_festival_banner.jpg','jpg','image/jpeg','602931','2026-09-11 05:45:23','2026-09-11 05:45:23'),
(103,1,'hero_festival_banner.jpg','public_storage','media/hero_festival_banner.jpg','jpg','image/jpeg','856490','2026-09-11 10:43:18','2026-09-11 10:43:18');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `flash_sale_product_orders`
--

DROP TABLE IF EXISTS `flash_sale_product_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `flash_sale_product_orders` (
  `flash_sale_product_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`flash_sale_product_id`,`order_id`),
  KEY `flash_sale_product_orders_order_id_foreign` (`order_id`),
  CONSTRAINT `flash_sale_product_orders_flash_sale_product_id_foreign` FOREIGN KEY (`flash_sale_product_id`) REFERENCES `flash_sale_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `flash_sale_product_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_sale_product_orders`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `flash_sale_product_orders` WRITE;
/*!40000 ALTER TABLE `flash_sale_product_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `flash_sale_product_orders` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `flash_sale_products`
--

DROP TABLE IF EXISTS `flash_sale_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `flash_sale_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flash_sale_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `end_date` date NOT NULL,
  `price` decimal(18,4) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `flash_sale_products_flash_sale_id_foreign` (`flash_sale_id`),
  KEY `flash_sale_products_product_id_foreign` (`product_id`),
  CONSTRAINT `flash_sale_products_flash_sale_id_foreign` FOREIGN KEY (`flash_sale_id`) REFERENCES `flash_sales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `flash_sale_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_sale_products`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `flash_sale_products` WRITE;
/*!40000 ALTER TABLE `flash_sale_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `flash_sale_products` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `flash_sale_translations`
--

DROP TABLE IF EXISTS `flash_sale_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `flash_sale_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flash_sale_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `campaign_name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flash_sale_translations_flash_sale_id_locale_unique` (`flash_sale_id`,`locale`),
  CONSTRAINT `flash_sale_translations_flash_sale_id_foreign` FOREIGN KEY (`flash_sale_id`) REFERENCES `flash_sales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_sale_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `flash_sale_translations` WRITE;
/*!40000 ALTER TABLE `flash_sale_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `flash_sale_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `flash_sales`
--

DROP TABLE IF EXISTS `flash_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `flash_sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_sales`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `flash_sales` WRITE;
/*!40000 ALTER TABLE `flash_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `flash_sales` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `menu_item_translations`
--

DROP TABLE IF EXISTS `menu_item_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_item_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_item_translations_menu_item_id_locale_unique` (`menu_item_id`,`locale`),
  CONSTRAINT `menu_item_translations_menu_item_id_foreign` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_item_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `menu_item_translations` WRITE;
/*!40000 ALTER TABLE `menu_item_translations` DISABLE KEYS */;
INSERT INTO `menu_item_translations` VALUES
(60,60,'en','root'),
(61,61,'en','Root'),
(62,62,'en','Authentic Himalayan Momos'),
(63,63,'en','Frozen Parathas & Breads'),
(64,64,'en','Crispy Fries & Finger Foods'),
(65,65,'en','Himalayan Kebabs & Starters'),
(66,66,'en','Sub-Zero Farm IQF Veggies'),
(67,67,'en','Curated Combos & Party Packs'),
(68,68,'en','Mailee ₹10 VIP Membership'),
(69,69,'en','root'),
(70,70,'en','Root'),
(71,71,'en','Home'),
(77,77,'en','VIP Membership'),
(80,80,'en','About Us'),
(81,81,'en','Media & Press'),
(82,82,'en','Contact Us'),
(83,83,'en','root'),
(84,84,'en','Root'),
(85,85,'en','About Us'),
(86,86,'en','Contact Us'),
(87,87,'en','Media & Press'),
(88,88,'en','Privacy Policy'),
(89,89,'en','Shop');
/*!40000 ALTER TABLE `menu_item_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `page_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `target` varchar(191) NOT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `is_root` tinyint(1) NOT NULL DEFAULT 0,
  `is_fluid` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_parent_id_foreign` (`parent_id`),
  KEY `menu_items_category_id_foreign` (`category_id`),
  KEY `menu_items_page_id_foreign` (`page_id`),
  KEY `menu_items_menu_id_index` (`menu_id`),
  CONSTRAINT `menu_items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menu_items_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menu_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES
(60,8,NULL,NULL,NULL,'URL',NULL,NULL,'_self',0,1,0,1,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(61,8,NULL,NULL,NULL,'url','#',NULL,'_self',0,1,0,1,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(62,8,61,41,NULL,'category',NULL,NULL,'_self',1,0,0,1,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(63,8,61,42,NULL,'category',NULL,NULL,'_self',2,0,0,1,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(64,8,61,43,NULL,'category',NULL,NULL,'_self',3,0,0,1,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(65,8,61,44,NULL,'category',NULL,NULL,'_self',4,0,0,1,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(66,8,61,45,NULL,'category',NULL,NULL,'_self',5,0,0,1,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(67,8,61,46,NULL,'category',NULL,NULL,'_self',6,0,0,1,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(68,8,61,47,NULL,'category',NULL,NULL,'_self',7,0,0,1,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(69,9,NULL,NULL,NULL,'URL',NULL,NULL,'_self',0,1,0,1,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(70,9,NULL,NULL,NULL,'url','#',NULL,'_self',0,1,0,1,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(71,9,70,NULL,NULL,'url','/',NULL,'_self',1,0,0,1,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(77,9,70,NULL,NULL,'url','/vip',NULL,'_self',5,0,0,1,'2026-09-10 20:08:33','2026-09-12 20:28:10'),
(80,9,69,NULL,1,'page',NULL,NULL,'_self',3,0,0,1,'2026-09-10 20:08:59','2026-09-12 20:28:10'),
(81,9,69,NULL,3,'page',NULL,NULL,'_self',6,0,0,1,'2026-09-10 20:08:59','2026-09-12 20:28:10'),
(82,9,69,NULL,2,'page',NULL,NULL,'_self',4,0,0,1,'2026-09-10 20:08:59','2026-09-12 20:28:10'),
(83,10,NULL,NULL,NULL,'URL',NULL,NULL,'_self',0,1,0,1,'2026-09-10 20:08:59','2026-09-10 20:08:59'),
(84,10,NULL,NULL,NULL,'url','#',NULL,'_self',0,1,0,1,'2026-09-10 20:08:59','2026-09-10 20:08:59'),
(85,10,84,NULL,1,'page',NULL,NULL,'_self',1,0,0,1,'2026-09-10 20:08:59','2026-09-10 20:08:59'),
(86,10,84,NULL,2,'page',NULL,NULL,'_self',2,0,0,1,'2026-09-10 20:08:59','2026-09-10 20:08:59'),
(87,10,84,NULL,3,'page',NULL,NULL,'_self',3,0,0,1,'2026-09-10 20:08:59','2026-09-10 20:08:59'),
(88,10,84,NULL,4,'page',NULL,NULL,'_self',4,0,0,1,'2026-09-10 20:08:59','2026-09-10 20:08:59'),
(89,9,69,NULL,NULL,'url','/products',NULL,'_self',2,0,0,1,'2026-09-12 20:28:10','2026-09-12 20:28:10');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `menu_translations`
--

DROP TABLE IF EXISTS `menu_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_translations_menu_id_locale_unique` (`menu_id`,`locale`),
  CONSTRAINT `menu_translations_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `menu_translations` WRITE;
/*!40000 ALTER TABLE `menu_translations` DISABLE KEYS */;
INSERT INTO `menu_translations` VALUES
(1,1,'en','Main Navigation'),
(2,2,'en','Quick Links'),
(3,3,'en','Customer Care'),
(4,4,'en','Category Menu'),
(5,5,'en','Primary Menu'),
(6,6,'en','Category Menu'),
(7,7,'en','Primary Menu'),
(8,8,'en','Category Menu'),
(9,9,'en','Primary Menu'),
(10,10,'en','Footer Quick Links');
/*!40000 ALTER TABLE `menu_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES
(8,1,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(9,1,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(10,1,'2026-09-10 20:08:59','2026-09-10 20:08:59');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `meta_data`
--

DROP TABLE IF EXISTS `meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(191) NOT NULL,
  `entity_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_data_entity_type_entity_id_index` (`entity_type`,`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_data`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `meta_data` WRITE;
/*!40000 ALTER TABLE `meta_data` DISABLE KEYS */;
INSERT INTO `meta_data` VALUES
(1,'Modules\\Page\\Entities\\Page',1,'2026-08-22 08:31:28','2026-08-22 08:31:28'),
(2,'Modules\\Page\\Entities\\Page',2,'2026-08-22 08:31:28','2026-08-22 08:31:28'),
(3,'Modules\\Page\\Entities\\Page',3,'2026-08-22 08:31:28','2026-08-22 08:31:28'),
(4,'Modules\\Page\\Entities\\Page',4,'2026-08-22 08:31:28','2026-08-22 08:31:28'),
(5,'Modules\\Page\\Entities\\Page',5,'2026-08-22 08:31:28','2026-08-22 08:31:28'),
(6,'Modules\\Page\\Entities\\Page',6,'2026-08-22 08:31:28','2026-08-22 08:31:28'),
(7,'Modules\\Brand\\Entities\\Brand',1,'2026-08-22 08:31:28','2026-08-22 08:31:28'),
(8,'Modules\\Brand\\Entities\\Brand',2,'2026-08-22 08:31:28','2026-08-22 08:31:28'),
(9,'Modules\\Brand\\Entities\\Brand',3,'2026-08-22 08:31:29','2026-08-22 08:31:29'),
(10,'Modules\\Brand\\Entities\\Brand',4,'2026-08-22 08:31:29','2026-08-22 08:31:29'),
(11,'Modules\\Brand\\Entities\\Brand',5,'2026-08-22 08:31:29','2026-08-22 08:31:29'),
(12,'Modules\\Brand\\Entities\\Brand',6,'2026-08-22 08:31:29','2026-08-22 08:31:29'),
(13,'Modules\\Brand\\Entities\\Brand',7,'2026-08-22 08:31:29','2026-08-22 08:31:29'),
(14,'Modules\\Brand\\Entities\\Brand',8,'2026-08-22 08:31:29','2026-08-22 08:31:29'),
(15,'Modules\\Brand\\Entities\\Brand',9,'2026-08-22 08:31:29','2026-08-22 08:31:29'),
(16,'Modules\\Brand\\Entities\\Brand',10,'2026-08-22 08:31:29','2026-08-22 08:31:29'),
(17,'Modules\\Product\\Entities\\Product',1,'2026-08-22 08:31:30','2026-08-22 08:31:30'),
(18,'Modules\\Product\\Entities\\Product',2,'2026-08-22 08:31:30','2026-08-22 08:31:30'),
(19,'Modules\\Product\\Entities\\Product',3,'2026-08-22 08:31:30','2026-08-22 08:31:30'),
(20,'Modules\\Product\\Entities\\Product',4,'2026-08-22 08:31:30','2026-08-22 08:31:30'),
(21,'Modules\\Product\\Entities\\Product',5,'2026-08-22 08:31:30','2026-08-22 08:31:30'),
(22,'Modules\\Product\\Entities\\Product',6,'2026-08-22 08:31:30','2026-08-22 08:31:30'),
(23,'Modules\\Product\\Entities\\Product',7,'2026-08-22 08:31:30','2026-08-22 08:31:30'),
(24,'Modules\\Product\\Entities\\Product',8,'2026-08-22 08:31:30','2026-08-22 08:31:30'),
(25,'Modules\\Product\\Entities\\Product',9,'2026-08-22 08:31:30','2026-08-22 08:31:30'),
(26,'Modules\\Product\\Entities\\Product',10,'2026-08-22 08:31:30','2026-08-22 08:31:30'),
(27,'Modules\\Product\\Entities\\Product',11,'2026-08-22 08:31:30','2026-08-22 08:31:30'),
(28,'Modules\\Product\\Entities\\Product',12,'2026-08-22 08:31:30','2026-08-22 08:31:30'),
(29,'Modules\\Product\\Entities\\Product',13,'2026-08-22 08:31:30','2026-08-22 08:31:30'),
(30,'Modules\\Product\\Entities\\Product',14,'2026-08-22 08:31:30','2026-08-22 08:31:30'),
(31,'Modules\\Product\\Entities\\Product',15,'2026-08-22 08:31:30','2026-08-22 08:31:30'),
(32,'Modules\\Product\\Entities\\Product',16,'2026-08-22 08:31:30','2026-08-22 08:31:30'),
(33,'Modules\\Blog\\Entities\\BlogCategory',1,'2026-08-22 08:31:30','2026-08-22 08:31:30'),
(34,'Modules\\Blog\\Entities\\BlogCategory',2,'2026-08-22 08:31:30','2026-08-22 08:31:30'),
(35,'Modules\\Blog\\Entities\\BlogCategory',3,'2026-08-22 08:31:30','2026-08-22 08:31:30'),
(36,'Modules\\Blog\\Entities\\BlogPost',1,'2026-08-22 08:35:54','2026-08-22 08:35:54'),
(37,'Modules\\Blog\\Entities\\BlogPost',2,'2026-08-22 08:35:54','2026-08-22 08:35:54'),
(38,'Modules\\Blog\\Entities\\BlogPost',3,'2026-08-22 08:35:54','2026-08-22 08:35:54'),
(39,'Modules\\Product\\Entities\\Product',17,'2026-09-10 20:06:51','2026-09-10 20:06:51'),
(40,'Modules\\Product\\Entities\\Product',18,'2026-09-10 20:06:51','2026-09-10 20:06:51'),
(41,'Modules\\Product\\Entities\\Product',19,'2026-09-10 20:06:51','2026-09-10 20:06:51'),
(42,'Modules\\Product\\Entities\\Product',20,'2026-09-10 20:06:51','2026-09-10 20:06:51'),
(43,'Modules\\Product\\Entities\\Product',21,'2026-09-10 20:06:51','2026-09-10 20:06:51'),
(44,'Modules\\Product\\Entities\\Product',22,'2026-09-10 20:06:51','2026-09-10 20:06:51'),
(45,'Modules\\Product\\Entities\\Product',23,'2026-09-10 20:06:52','2026-09-10 20:06:52'),
(46,'Modules\\Product\\Entities\\Product',24,'2026-09-10 20:06:52','2026-09-10 20:06:52'),
(47,'Modules\\Product\\Entities\\Product',25,'2026-09-10 20:06:52','2026-09-10 20:06:52'),
(48,'Modules\\Product\\Entities\\Product',26,'2026-09-10 20:06:52','2026-09-10 20:06:52'),
(49,'Modules\\Product\\Entities\\Product',27,'2026-09-10 20:06:52','2026-09-10 20:06:52'),
(50,'Modules\\Product\\Entities\\Product',28,'2026-09-10 20:06:52','2026-09-10 20:06:52'),
(51,'Modules\\Product\\Entities\\Product',29,'2026-09-10 20:06:52','2026-09-10 20:06:52'),
(52,'Modules\\Product\\Entities\\Product',30,'2026-09-10 20:07:22','2026-09-10 20:07:22'),
(53,'Modules\\Product\\Entities\\Product',31,'2026-09-10 20:07:22','2026-09-10 20:07:22'),
(54,'Modules\\Product\\Entities\\Product',32,'2026-09-10 20:07:22','2026-09-10 20:07:22'),
(55,'Modules\\Product\\Entities\\Product',33,'2026-09-10 20:07:22','2026-09-10 20:07:22'),
(56,'Modules\\Product\\Entities\\Product',34,'2026-09-10 20:07:22','2026-09-10 20:07:22'),
(57,'Modules\\Product\\Entities\\Product',35,'2026-09-10 20:07:22','2026-09-10 20:07:22'),
(58,'Modules\\Product\\Entities\\Product',36,'2026-09-10 20:07:22','2026-09-10 20:07:22'),
(59,'Modules\\Product\\Entities\\Product',37,'2026-09-10 20:07:22','2026-09-10 20:07:22'),
(60,'Modules\\Product\\Entities\\Product',38,'2026-09-10 20:07:22','2026-09-10 20:07:22'),
(61,'Modules\\Product\\Entities\\Product',39,'2026-09-10 20:07:22','2026-09-10 20:07:22'),
(62,'Modules\\Product\\Entities\\Product',40,'2026-09-10 20:07:22','2026-09-10 20:07:22'),
(63,'Modules\\Product\\Entities\\Product',41,'2026-09-10 20:07:22','2026-09-10 20:07:22'),
(64,'Modules\\Product\\Entities\\Product',42,'2026-09-10 20:07:22','2026-09-10 20:07:22'),
(65,'Modules\\Product\\Entities\\Product',43,'2026-09-10 20:07:51','2026-09-10 20:07:51'),
(66,'Modules\\Product\\Entities\\Product',44,'2026-09-10 20:07:51','2026-09-10 20:07:51'),
(67,'Modules\\Product\\Entities\\Product',45,'2026-09-10 20:07:51','2026-09-10 20:07:51'),
(68,'Modules\\Product\\Entities\\Product',46,'2026-09-10 20:07:51','2026-09-10 20:07:51'),
(69,'Modules\\Product\\Entities\\Product',47,'2026-09-10 20:07:51','2026-09-10 20:07:51'),
(70,'Modules\\Product\\Entities\\Product',48,'2026-09-10 20:07:51','2026-09-10 20:07:51'),
(71,'Modules\\Product\\Entities\\Product',49,'2026-09-10 20:07:51','2026-09-10 20:07:51'),
(72,'Modules\\Product\\Entities\\Product',50,'2026-09-10 20:07:51','2026-09-10 20:07:51'),
(73,'Modules\\Product\\Entities\\Product',51,'2026-09-10 20:07:51','2026-09-10 20:07:51'),
(74,'Modules\\Product\\Entities\\Product',52,'2026-09-10 20:07:51','2026-09-10 20:07:51'),
(75,'Modules\\Product\\Entities\\Product',53,'2026-09-10 20:07:51','2026-09-10 20:07:51'),
(76,'Modules\\Product\\Entities\\Product',54,'2026-09-10 20:07:51','2026-09-10 20:07:51'),
(77,'Modules\\Product\\Entities\\Product',55,'2026-09-10 20:07:51','2026-09-10 20:07:51'),
(78,'Modules\\Product\\Entities\\Product',56,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(79,'Modules\\Product\\Entities\\Product',57,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(80,'Modules\\Product\\Entities\\Product',58,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(81,'Modules\\Product\\Entities\\Product',59,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(82,'Modules\\Product\\Entities\\Product',60,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(83,'Modules\\Product\\Entities\\Product',61,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(84,'Modules\\Product\\Entities\\Product',62,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(85,'Modules\\Product\\Entities\\Product',63,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(86,'Modules\\Product\\Entities\\Product',64,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(87,'Modules\\Product\\Entities\\Product',65,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(88,'Modules\\Product\\Entities\\Product',66,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(89,'Modules\\Product\\Entities\\Product',67,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(90,'Modules\\Product\\Entities\\Product',68,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(91,'Modules\\Blog\\Entities\\BlogPost',4,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(92,'Modules\\Blog\\Entities\\BlogPost',5,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(93,'Modules\\Blog\\Entities\\BlogPost',6,'2026-09-10 20:08:33','2026-09-10 20:08:33');
/*!40000 ALTER TABLE `meta_data` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `meta_data_translations`
--

DROP TABLE IF EXISTS `meta_data_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_data_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `meta_data_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `meta_data_translations_meta_data_id_locale_unique` (`meta_data_id`,`locale`),
  CONSTRAINT `meta_data_translations_meta_data_id_foreign` FOREIGN KEY (`meta_data_id`) REFERENCES `meta_data` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_data_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `meta_data_translations` WRITE;
/*!40000 ALTER TABLE `meta_data_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_data_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'2014_07_02_230147_migration_cartalyst_sentinel',1),
(2,'2014_10_14_200250_create_settings_table',1),
(3,'2014_10_26_162751_create_files_table',1),
(4,'2014_10_30_191858_create_pages_table',1),
(5,'2014_11_31_125848_create_page_translations_table',1),
(6,'2015_02_27_105241_create_entity_files_table',1),
(7,'2015_11_20_184604486385_create_translations_table',1),
(8,'2015_11_20_184604743083_create_translation_translations_table',1),
(9,'2017_05_29_155126144426_create_products_table',1),
(10,'2017_05_30_155126416338_create_product_translations_table',1),
(11,'2017_08_02_153217_create_options_table',1),
(12,'2017_08_02_153217_create_variations_table',1),
(13,'2017_08_02_153348_create_option_translations_table',1),
(14,'2017_08_02_153348_create_variation_translations_table',1),
(15,'2017_08_02_153406_create_option_values_table',1),
(16,'2017_08_02_153406_create_variation_values_table',1),
(17,'2017_08_02_153736_create_option_value_translations_table',1),
(18,'2017_08_02_153736_create_variation_value_translations_table',1),
(19,'2017_08_03_156576_create_product_options_table',1),
(20,'2017_08_17_170128_create_related_products_table',1),
(21,'2017_08_17_175236_create_up_sell_products_table',1),
(22,'2017_08_17_175828_create_cross_sell_products_table',1),
(23,'2017_11_09_141332910964_create_categories_table',1),
(24,'2017_11_09_141332931539_create_category_translations_table',1),
(25,'2017_11_26_083614526622_create_meta_data_table',1),
(26,'2017_11_26_083614526828_create_meta_data_translations_table',1),
(27,'2018_01_24_125642_create_product_categories_table',1),
(28,'2018_02_04_150917488267_create_coupons_table',1),
(29,'2018_02_04_150917488698_create_coupon_translations_table',1),
(30,'2018_03_11_181317_create_coupon_products_table',1),
(31,'2018_03_15_091937_create_coupon_categories_table',1),
(32,'2018_04_18_154028776225_create_reviews_table',1),
(33,'2018_05_17_115822452977_create_currency_rates_table',1),
(34,'2018_07_03_124153537506_create_sliders_table',1),
(35,'2018_07_03_124153537695_create_slider_translations_table',1),
(36,'2018_07_03_133107770172_create_slider_slides_table',1),
(37,'2018_07_03_133107770486_create_slider_slide_translations_table',1),
(38,'2018_07_28_190524758357_create_attribute_sets_table',1),
(39,'2018_07_28_190524758497_create_attribute_set_translations_table',1),
(40,'2018_07_28_190524758646_create_attributes_table',1),
(41,'2018_07_28_190524758877_create_attribute_translations_table',1),
(42,'2018_07_28_190524759461_create_product_attributes_table',1),
(43,'2018_08_01_001919718631_create_tax_classes_table',1),
(44,'2018_08_01_001919718935_create_tax_class_translations_table',1),
(45,'2018_08_01_001919723551_create_tax_rates_table',1),
(46,'2018_08_01_001919723781_create_tax_rate_translations_table',1),
(47,'2018_08_03_195922206748_create_attribute_values_table',1),
(48,'2018_08_03_195922207019_create_attribute_value_translations_table',1),
(49,'2018_08_04_190524764275_create_product_attribute_values_table',1),
(50,'2018_08_07_135631306565_create_orders_table',1),
(51,'2018_08_07_135631309451_create_order_products_table',1),
(52,'2018_08_07_135631309512_create_order_product_options_table',1),
(53,'2018_08_07_135631309624_create_order_product_option_values_table',1),
(54,'2018_09_11_213926106353_create_transactions_table',1),
(55,'2018_09_19_081602135631_create_order_taxes_table',1),
(56,'2018_09_19_103745_create_setting_translations_table',1),
(57,'2018_10_01_224852175056_create_wish_lists_table',1),
(58,'2018_10_04_185608_create_search_terms_table',1),
(59,'2018_11_03_160015_create_menus_table',1),
(60,'2018_11_03_160138_create_menu_translations_table',1),
(61,'2018_11_03_160753_create_menu_items_table',1),
(62,'2018_11_03_160804_create_menu_item_translation_table',1),
(63,'2019_02_05_162605_add_position_to_slider_slides_table',1),
(64,'2019_02_09_164343_remove_file_id_from_slider_slides_table',1),
(65,'2019_02_09_164434_add_file_id_to_slider_slide_translations_table',1),
(66,'2019_02_14_103408_create_attribute_categories_table',1),
(67,'2019_08_09_164759_add_slug_column_to_attributes_table',1),
(68,'2019_11_01_201511_add_special_price_type_column_to_products_table',1),
(69,'2019_11_23_193101_add_value_column_to_order_product_options_table',1),
(70,'2020_01_04_211424_add_icon_column_to_menu_items_table',1),
(71,'2020_01_05_160502_add_direction_column_to_slider_slide_translations_table',1),
(72,'2020_01_05_234014_add_speed_column_to_sliders_table',1),
(73,'2020_01_05_235014_add_fade_column_to_sliders_table',1),
(74,'2020_01_15_000346259038_create_flash_sales_table',1),
(75,'2020_01_15_000346259349_create_flash_sale_translations_table',1),
(76,'2020_01_23_011234_create_flash_sale_products_table',1),
(77,'2020_01_30_015722_create_flash_sale_product_orders_table',1),
(78,'2020_02_22_215943_delete_meta_keywords_column_from_meta_data_translations_table',1),
(79,'2020_03_05_214602901973_create_brands_table',1),
(80,'2020_03_05_214602902369_create_brand_translations_table',1),
(81,'2020_03_06_234605_add_brand_id_column_to_products_table',1),
(82,'2020_04_06_211526_add_note_column_to_orders_table',1),
(83,'2020_04_28_034118164376_create_tags_table',1),
(84,'2020_04_28_034118164618_create_tag_translations_table',1),
(85,'2020_04_28_225657_create_product_tags_table',1),
(86,'2020_05_10_041616_create_updater_scripts_table',1),
(87,'2020_10_07_175000_create_addresses_table',1),
(88,'2020_10_07_175004_create_default_addresses_table',1),
(89,'2020_11_21_163822_add_downloads_columns_to_products_table',1),
(90,'2021_01_08_203241_change_shipping_method_column_in_orders_table',1),
(91,'2021_01_09_172744_add_phone_column_to_users_table',1),
(92,'2021_01_11_170516_create_order_downloads_table',1),
(93,'2023_05_04_194556_rename_column_virtual_to_is_virtual',1),
(94,'2023_05_16_156576_create_product_variations_table',1),
(95,'2023_05_16_170651_create_product_variants_table',1),
(96,'2023_06_11_150030_create_order_product_variations_table',1),
(97,'2023_06_11_150044_create_order_product_variation_values_table',1),
(98,'2023_06_11_150456_add_product_variant_id_column_to_order_products_table',1),
(99,'2023_11_06_084429_create_carts_table',1),
(100,'2023_11_07_113308_add_timestamp_columns_to_related_products_table',1),
(101,'2023_11_07_113325_add_timestamp_columns_to_up_sell_products_table',1),
(102,'2023_11_07_113341_add_timestamp_columns_to_cross_sell_products_table',1),
(103,'2023_11_21_164218_make_price_column_in_the_products_table_nullable',1),
(104,'2024_02_12_115822452977_increase_currency_rate_decimal_total_digits',1),
(105,'2024_03_13_100000_create_blog_categories_table',1),
(106,'2024_03_13_100001_create_blog_category_translations_table',1),
(107,'2024_03_13_100002_create_blog_tags_table',1),
(108,'2024_03_13_100003_create_blog_tag_translations_table',1),
(109,'2024_03_13_100004_create_blog_posts_table',1),
(110,'2024_03_13_100005_create_blog_post_translations_table',1),
(111,'2024_03_13_100006_create_blog_post_blog_tag_table',1),
(112,'2025_05_19_0000001_add_tracking_reference_column_to_orders_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `option_translations`
--

DROP TABLE IF EXISTS `option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `option_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_translations_option_id_locale_unique` (`option_id`,`locale`),
  CONSTRAINT `option_translations_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `option_translations` WRITE;
/*!40000 ALTER TABLE `option_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `option_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `option_value_translations`
--

DROP TABLE IF EXISTS `option_value_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `option_value_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_value_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `label` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_value_translations_option_value_id_locale_unique` (`option_value_id`,`locale`),
  CONSTRAINT `option_value_translations_option_value_id_foreign` FOREIGN KEY (`option_value_id`) REFERENCES `option_values` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_value_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `option_value_translations` WRITE;
/*!40000 ALTER TABLE `option_value_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `option_value_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `option_values`
--

DROP TABLE IF EXISTS `option_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `option_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_id` int(10) unsigned NOT NULL,
  `price` decimal(18,4) unsigned DEFAULT NULL,
  `price_type` varchar(10) NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `option_values_option_id_index` (`option_id`),
  CONSTRAINT `option_values_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_values`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `option_values` WRITE;
/*!40000 ALTER TABLE `option_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `option_values` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_global` tinyint(1) NOT NULL DEFAULT 1,
  `position` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `order_downloads`
--

DROP TABLE IF EXISTS `order_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_downloads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `file_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_downloads_order_id_foreign` (`order_id`),
  KEY `order_downloads_file_id_foreign` (`file_id`),
  CONSTRAINT `order_downloads_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_downloads_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_downloads`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `order_downloads` WRITE;
/*!40000 ALTER TABLE `order_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_downloads` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `order_product_option_values`
--

DROP TABLE IF EXISTS `order_product_option_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product_option_values` (
  `order_product_option_id` int(10) unsigned NOT NULL,
  `option_value_id` int(10) unsigned NOT NULL,
  `price` decimal(18,4) unsigned DEFAULT NULL,
  PRIMARY KEY (`order_product_option_id`,`option_value_id`),
  KEY `order_product_option_values_option_value_id_foreign` (`option_value_id`),
  CONSTRAINT `order_product_option_values_option_value_id_foreign` FOREIGN KEY (`option_value_id`) REFERENCES `option_values` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_product_option_values_order_product_option_id_foreign` FOREIGN KEY (`order_product_option_id`) REFERENCES `order_product_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product_option_values`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `order_product_option_values` WRITE;
/*!40000 ALTER TABLE `order_product_option_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product_option_values` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `order_product_options`
--

DROP TABLE IF EXISTS `order_product_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_product_id` int(10) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_product_options_order_product_id_option_id_unique` (`order_product_id`,`option_id`),
  KEY `order_product_options_option_id_foreign` (`option_id`),
  CONSTRAINT `order_product_options_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_product_options_order_product_id_foreign` FOREIGN KEY (`order_product_id`) REFERENCES `order_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product_options`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `order_product_options` WRITE;
/*!40000 ALTER TABLE `order_product_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product_options` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `order_product_variation_values`
--

DROP TABLE IF EXISTS `order_product_variation_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product_variation_values` (
  `order_product_variation_id` int(10) unsigned NOT NULL,
  `variation_value_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`order_product_variation_id`,`variation_value_id`),
  KEY `order_product_variation_values_variation_value_id_foreign` (`variation_value_id`),
  CONSTRAINT `order_product_variation_values_order_product_variation_id` FOREIGN KEY (`order_product_variation_id`) REFERENCES `order_product_variations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_product_variation_values_variation_value_id_foreign` FOREIGN KEY (`variation_value_id`) REFERENCES `variation_values` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product_variation_values`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `order_product_variation_values` WRITE;
/*!40000 ALTER TABLE `order_product_variation_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product_variation_values` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `order_product_variations`
--

DROP TABLE IF EXISTS `order_product_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product_variations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_product_id` int(10) unsigned NOT NULL,
  `variation_id` int(10) unsigned NOT NULL,
  `type` varchar(191) NOT NULL,
  `value` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_product_variations_order_product_id_variation_id_unique` (`order_product_id`,`variation_id`),
  KEY `order_product_variations_variation_id_foreign` (`variation_id`),
  CONSTRAINT `order_product_variations_order_product_id_foreign` FOREIGN KEY (`order_product_id`) REFERENCES `order_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_product_variations_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product_variations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `order_product_variations` WRITE;
/*!40000 ALTER TABLE `order_product_variations` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_product_variations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `order_products`
--

DROP TABLE IF EXISTS `order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `product_variant_id` bigint(20) unsigned DEFAULT NULL,
  `unit_price` decimal(18,4) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `line_total` decimal(18,4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_products_order_id_foreign` (`order_id`),
  KEY `order_products_product_id_foreign` (`product_id`),
  CONSTRAINT `order_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_products`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `order_products` WRITE;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
INSERT INTO `order_products` VALUES
(1,1,4,NULL,1299.9900,1,1299.9900);
/*!40000 ALTER TABLE `order_products` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `order_taxes`
--

DROP TABLE IF EXISTS `order_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_taxes` (
  `order_id` int(10) unsigned NOT NULL,
  `tax_rate_id` int(10) unsigned NOT NULL,
  `amount` decimal(15,4) unsigned NOT NULL,
  PRIMARY KEY (`order_id`,`tax_rate_id`),
  KEY `order_taxes_tax_rate_id_foreign` (`tax_rate_id`),
  CONSTRAINT `order_taxes_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_taxes_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_taxes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `order_taxes` WRITE;
/*!40000 ALTER TABLE `order_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_taxes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `customer_email` varchar(191) NOT NULL,
  `customer_phone` varchar(191) DEFAULT NULL,
  `customer_first_name` varchar(191) NOT NULL,
  `customer_last_name` varchar(191) NOT NULL,
  `billing_first_name` varchar(191) NOT NULL,
  `billing_last_name` varchar(191) NOT NULL,
  `billing_address_1` varchar(191) NOT NULL,
  `billing_address_2` varchar(191) DEFAULT NULL,
  `billing_city` varchar(191) NOT NULL,
  `billing_state` varchar(191) NOT NULL,
  `billing_zip` varchar(191) NOT NULL,
  `billing_country` varchar(191) NOT NULL,
  `shipping_first_name` varchar(191) NOT NULL,
  `shipping_last_name` varchar(191) NOT NULL,
  `shipping_address_1` varchar(191) NOT NULL,
  `shipping_address_2` varchar(191) DEFAULT NULL,
  `shipping_city` varchar(191) NOT NULL,
  `shipping_state` varchar(191) NOT NULL,
  `shipping_zip` varchar(191) NOT NULL,
  `shipping_country` varchar(191) NOT NULL,
  `sub_total` decimal(18,4) unsigned NOT NULL,
  `shipping_method` varchar(191) DEFAULT NULL,
  `shipping_cost` decimal(18,4) unsigned NOT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `discount` decimal(18,4) unsigned NOT NULL,
  `total` decimal(18,4) unsigned NOT NULL,
  `payment_method` varchar(191) NOT NULL,
  `currency` varchar(191) NOT NULL,
  `currency_rate` decimal(18,4) NOT NULL,
  `locale` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `note` text DEFAULT NULL,
  `tracking_reference` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_customer_id_index` (`customer_id`),
  KEY `orders_coupon_id_index` (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES
(1,1,'rds2197@gmail.com','8250622813','Ramanuj','Dey Sarkar','Ramanuj','Dey Sarkar','24/2, Deshbandhu Para NJP Main Rd','Ward 30, Deshbandhu Para','Siliguri','COX','734004','BD','Ramanuj','Dey Sarkar','24/2, Deshbandhu Para NJP Main Rd','Ward 30, Deshbandhu Para','Siliguri','COX','734004','BD',1299.9900,'free_shipping',0.0000,NULL,0.0000,1299.9900,'cod','USD',1.0000,'en','completed',NULL,NULL,NULL,'2026-08-22 08:42:18','2026-08-22 08:52:49');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `page_translations`
--

DROP TABLE IF EXISTS `page_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `body` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_translations_page_id_locale_unique` (`page_id`,`locale`),
  CONSTRAINT `page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `page_translations` WRITE;
/*!40000 ALTER TABLE `page_translations` DISABLE KEYS */;
INSERT INTO `page_translations` VALUES
(1,1,'en','About Us','<div class=\"about-page-wrapper\">\n                <!-- Hero Banner Card -->\n                <div style=\"background: linear-gradient(135deg, #f4f9f6 0%, #e8f4ee 100%); padding: 35px; border-radius: 12px; border: 1px solid #d4e8dd; margin-bottom: 35px; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap;\">\n                    <div style=\"flex: 1; min-width: 280px; padding-right: 20px;\">\n                        <span style=\"background: #1b4d3e; color: #ffffff; padding: 4px 12px; border-radius: 20px; font-size: 0.85rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;\">About Mailee</span>\n                        <h2 style=\"color: #1b4d3e; font-size: 2rem; font-weight: 700; margin: 15px 0 10px 0;\">Authentic Himalayan & Nepali Flavors</h2>\n                        <p style=\"font-size: 1.05rem; color: #4a5568; line-height: 1.7; margin: 0;\">\n                            Born in North Bengal, <strong>Mailee Frozen Foods</strong> bridges traditional mountain culinary heritage with modern cold-chain convenience. From handcrafted momos to flaky Malabar parathas, we bring restaurant-quality frozen foods straight to your home freezer.\n                        </p>\n                    </div>\n                </div>\n\n                <!-- 3 Pillars Grid -->\n                <h3 style=\"color: #1b4d3e; font-size: 1.5rem; font-weight: 700; margin-bottom: 20px; text-align: center;\">Why Families Love Mailee</h3>\n                <div style=\"display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 20px; margin-bottom: 40px;\">\n                    <div style=\"background: #ffffff; padding: 25px; border-radius: 10px; border: 1px solid #e2e8f0; box-shadow: 0 2px 10px rgba(0,0,0,0.03); text-align: center;\">\n                        <div style=\"width: 60px; height: 60px; background: #e8f4ee; color: #1b4d3e; border-radius: 50%; display: inline-flex; align-items: center; justify-content: center; font-size: 1.8rem; margin-bottom: 15px;\">\n                            <i class=\"las la-utensils\"></i>\n                        </div>\n                        <h4 style=\"color: #2d3748; font-size: 1.2rem; font-weight: 600; margin-bottom: 10px;\">Authentic Recipes</h4>\n                        <p style=\"color: #718096; font-size: 0.95rem; line-height: 1.6; margin: 0;\">Made with authentic Nepali & Darjeeling spice blends crafted by seasoned mountain chefs.</p>\n                    </div>\n\n                    <div style=\"background: #ffffff; padding: 25px; border-radius: 10px; border: 1px solid #e2e8f0; box-shadow: 0 2px 10px rgba(0,0,0,0.03); text-align: center;\">\n                        <div style=\"width: 60px; height: 60px; background: #e8f4ee; color: #1b4d3e; border-radius: 50%; display: inline-flex; align-items: center; justify-content: center; font-size: 1.8rem; margin-bottom: 15px;\">\n                            <i class=\"las la-snowflake\"></i>\n                        </div>\n                        <h4 style=\"color: #2d3748; font-size: 1.2rem; font-weight: 600; margin-bottom: 10px;\">Flash-Frozen Fresh</h4>\n                        <p style=\"color: #718096; font-size: 0.95rem; line-height: 1.6; margin: 0;\">Quick-frozen at -18°C to lock in juice, taste, and nutrition with zero artificial preservatives.</p>\n                    </div>\n\n                    <div style=\"background: #ffffff; padding: 25px; border-radius: 10px; border: 1px solid #e2e8f0; box-shadow: 0 2px 10px rgba(0,0,0,0.03); text-align: center;\">\n                        <div style=\"width: 60px; height: 60px; background: #e8f4ee; color: #1b4d3e; border-radius: 50%; display: inline-flex; align-items: center; justify-content: center; font-size: 1.8rem; margin-bottom: 15px;\">\n                            <i class=\"las la-shipping-fast\"></i>\n                        </div>\n                        <h4 style=\"color: #2d3748; font-size: 1.2rem; font-weight: 600; margin-bottom: 10px;\">Express Cold Delivery</h4>\n                        <p style=\"color: #718096; font-size: 0.95rem; line-height: 1.6; margin: 0;\">Temperature-controlled delivery hubs operating across Siliguri, Darjeeling & Jalpaiguri.</p>\n                    </div>\n                </div>\n\n                <!-- Membership Banner Feature -->\n                <div style=\"background: linear-gradient(135deg, #1b4d3e 0%, #11362b 100%); color: #ffffff; padding: 35px; border-radius: 12px; margin-bottom: 30px; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap;\">\n                    <div style=\"flex: 1; min-width: 280px; padding-right: 20px;\">\n                        <span style=\"background: #e2b714; color: #1a202c; padding: 4px 10px; border-radius: 4px; font-size: 0.8rem; font-weight: 700; text-transform: uppercase;\">Wholesale Direct</span>\n                        <h3 style=\"color: #ffffff; font-size: 1.6rem; font-weight: 700; margin: 10px 0;\">Mailee ₹10 VIP Wholesale Pass</h3>\n                        <p style=\"color: #d0e7de; font-size: 1rem; line-height: 1.6; margin: 0;\">\n                            Join our membership program for just ₹10 and unlock extreme member discounts up to 70% OFF across our entire frozen food catalog.\n                        </p>\n                    </div>\n                    <div style=\"margin-top: 15px;\">\n                        <a href=\"/products/mailee-rs10-vip-club-membership-pass\" style=\"background: #e2b714; color: #1a202c; font-weight: 700; padding: 12px 28px; border-radius: 6px; text-decoration: none; display: inline-block; transition: all 0.3s ease;\">Get ₹10 Pass Now →</a>\n                    </div>\n                </div>\n            </div>'),
(2,2,'en','Contact Us','<div class=\"contact-page-wrapper\">\n                <div style=\"text-align: center; margin-bottom: 35px;\">\n                    <h2 style=\"color: #1b4d3e; font-size: 1.8rem; font-weight: 700; margin-bottom: 10px;\">We\'d Love to Hear From You</h2>\n                    <p style=\"color: #718096; font-size: 1.05rem; max-width: 600px; margin: 0 auto;\">Have a question about your order, cold-chain delivery, or bulk orders? Reach out to our Siliguri support team.</p>\n                </div>\n\n                <div style=\"display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 25px; margin-bottom: 40px;\">\n                    <!-- Card 1 -->\n                    <div style=\"background: #f8faf9; padding: 30px; border-radius: 10px; border: 1px solid #e2e8f0;\">\n                        <div style=\"font-size: 2rem; color: #1b4d3e; margin-bottom: 15px;\"><i class=\"las la-map-marked-alt\"></i></div>\n                        <h4 style=\"color: #1b4d3e; font-size: 1.2rem; font-weight: 600; margin-bottom: 8px;\">Head Office & Hub</h4>\n                        <p style=\"color: #4a5568; line-height: 1.6; margin: 0;\">Mailee Frozen Foods Pvt Ltd<br>Hill Cart Road, Near Airview Bus Stand<br>Siliguri, West Bengal – 734001</p>\n                    </div>\n\n                    <!-- Card 2 -->\n                    <div style=\"background: #f8faf9; padding: 30px; border-radius: 10px; border: 1px solid #e2e8f0;\">\n                        <div style=\"font-size: 2rem; color: #1b4d3e; margin-bottom: 15px;\"><i class=\"las la-envelope-open-text\"></i></div>\n                        <h4 style=\"color: #1b4d3e; font-size: 1.2rem; font-weight: 600; margin-bottom: 8px;\">Email Inquiries</h4>\n                        <p style=\"color: #4a5568; line-height: 1.6; margin: 0;\">\n                            Customer Support: <a href=\"mailto:contact@mailee.in\" style=\"color: #1b4d3e; font-weight: 600;\">contact@mailee.in</a><br>\n                            VIP Club Help: <a href=\"mailto:vip@mailee.in\" style=\"color: #1b4d3e; font-weight: 600;\">vip@mailee.in</a>\n                        </p>\n                    </div>\n\n                    <!-- Card 3 -->\n                    <div style=\"background: #f8faf9; padding: 30px; border-radius: 10px; border: 1px solid #e2e8f0;\">\n                        <div style=\"font-size: 2rem; color: #1b4d3e; margin-bottom: 15px;\"><i class=\"las la-phone-volume\"></i></div>\n                        <h4 style=\"color: #1b4d3e; font-size: 1.2rem; font-weight: 600; margin-bottom: 8px;\">Helpline & WhatsApp</h4>\n                        <p style=\"color: #4a5568; line-height: 1.6; margin: 0;\">\n                            Phone: <strong>+91 98320 12345</strong><br>\n                            Working Hours: Mon – Sat, 8:00 AM – 8:00 PM\n                        </p>\n                    </div>\n                </div>\n\n                <!-- Interactive Contact Form -->\n                <div style=\"background: #ffffff; padding: 35px; border-radius: 12px; border: 1px solid #e2e8f0; box-shadow: 0 4px 15px rgba(0,0,0,0.04);\">\n                    <h3 style=\"color: #1b4d3e; font-size: 1.4rem; font-weight: 700; margin-bottom: 20px;\">Send Us a Direct Message</h3>\n                    <form onsubmit=\"event.preventDefault(); alert(\'Thank you for contacting Mailee! Our team will respond shortly.\');\">\n                        <div style=\"display: grid; grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); gap: 15px; margin-bottom: 15px;\">\n                            <div>\n                                <label style=\"display: block; font-weight: 600; color: #4a5568; margin-bottom: 5px;\">Your Name</label>\n                                <input type=\"text\" required placeholder=\"Enter full name\" style=\"width: 100%; padding: 10px 14px; border: 1px solid #cbd5e0; border-radius: 6px; outline: none;\">\n                            </div>\n                            <div>\n                                <label style=\"display: block; font-weight: 600; color: #4a5568; margin-bottom: 5px;\">Email Address</label>\n                                <input type=\"email\" required placeholder=\"name@example.com\" style=\"width: 100%; padding: 10px 14px; border: 1px solid #cbd5e0; border-radius: 6px; outline: none;\">\n                            </div>\n                        </div>\n\n                        <div style=\"margin-bottom: 15px;\">\n                            <label style=\"display: block; font-weight: 600; color: #4a5568; margin-bottom: 5px;\">Subject</label>\n                            <input type=\"text\" required placeholder=\"e.g. Bulk Momo Order Inquiry\" style=\"width: 100%; padding: 10px 14px; border: 1px solid #cbd5e0; border-radius: 6px; outline: none;\">\n                        </div>\n\n                        <div style=\"margin-bottom: 20px;\">\n                            <label style=\"display: block; font-weight: 600; color: #4a5568; margin-bottom: 5px;\">Message</label>\n                            <textarea rows=\"4\" required placeholder=\"How can we assist you?\" style=\"width: 100%; padding: 10px 14px; border: 1px solid #cbd5e0; border-radius: 6px; outline: none;\"></textarea>\n                        </div>\n\n                        <button type=\"submit\" style=\"background: #1b4d3e; color: #ffffff; font-weight: 600; padding: 12px 30px; border: none; border-radius: 6px; cursor: pointer; transition: background 0.3s ease;\">Send Message</button>\n                    </form>\n                </div>\n            </div>'),
(3,3,'en','Media & Press','<div class=\"media-page-wrapper\">\n                <div style=\"text-align: center; margin-bottom: 35px;\">\n                    <h2 style=\"color: #1b4d3e; font-size: 1.8rem; font-weight: 700; margin-bottom: 10px;\">Mailee Press Room & Media Center</h2>\n                    <p style=\"color: #718096; font-size: 1.05rem; max-width: 600px; margin: 0 auto;\">Official press releases, culinary news coverage, and brand media kits.</p>\n                </div>\n\n                <div style=\"display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px; margin-bottom: 40px;\">\n                    <!-- Release 1 -->\n                    <div style=\"background: #ffffff; padding: 25px; border-radius: 10px; border: 1px solid #e2e8f0; box-shadow: 0 2px 10px rgba(0,0,0,0.03);\">\n                        <span style=\"background: #e8f4ee; color: #1b4d3e; padding: 3px 10px; border-radius: 15px; font-size: 0.8rem; font-weight: 600;\">PRESS RELEASE</span>\n                        <span style=\"color: #a0aec0; font-size: 0.85rem; margin-left: 10px;\">August 2026</span>\n                        <h4 style=\"color: #2d3748; font-size: 1.15rem; font-weight: 600; margin: 12px 0 8px 0;\">Mailee Launches ₹10 VIP Pass for Wholesale Frozen Foods in North Bengal</h4>\n                        <p style=\"color: #718096; font-size: 0.95rem; line-height: 1.6; margin: 0;\">Siliguri-based frozen food startup introduces direct-to-consumer wholesale membership pass for authentic Himalayan momos and snacks.</p>\n                    </div>\n\n                    <!-- Release 2 -->\n                    <div style=\"background: #ffffff; padding: 25px; border-radius: 10px; border: 1px solid #e2e8f0; box-shadow: 0 2px 10px rgba(0,0,0,0.03);\">\n                        <span style=\"background: #e8f4ee; color: #1b4d3e; padding: 3px 10px; border-radius: 15px; font-size: 0.8rem; font-weight: 600;\">CULINARY FEATURE</span>\n                        <span style=\"color: #a0aec0; font-size: 0.85rem; margin-left: 10px;\">July 2026</span>\n                        <h4 style=\"color: #2d3748; font-size: 1.15rem; font-weight: 600; margin: 12px 0 8px 0;\">The Rise of Authentic Darjeeling & Nepali Momos in Modern Kitchens</h4>\n                        <p style=\"color: #718096; font-size: 0.95rem; line-height: 1.6; margin: 0;\">Food trend analysis highlights Mailee\'s flash-freeze technique preserving traditional mountain flavors without artificial preservatives.</p>\n                    </div>\n                </div>\n\n                <!-- Brand Kit Box -->\n                <div style=\"background: #f8faf9; padding: 30px; border-radius: 10px; border: 1px dashed #1b4d3e; display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap;\">\n                    <div>\n                        <h4 style=\"color: #1b4d3e; font-size: 1.2rem; font-weight: 600; margin: 0 0 5px 0;\">Official Media & Brand Assets</h4>\n                        <p style=\"color: #718096; margin: 0; font-size: 0.95rem;\">Download high-resolution Mailee logos, product photography catalog, and brand guidelines.</p>\n                    </div>\n                    <div style=\"margin-top: 15px;\">\n                        <a href=\"mailto:media@mailee.in?subject=Request%20Media%20Kit\" style=\"background: #1b4d3e; color: #ffffff; padding: 10px 22px; border-radius: 6px; text-decoration: none; font-weight: 600;\">Request Media Kit</a>\n                    </div>\n                </div>\n            </div>'),
(4,4,'en','Privacy Policy','<div class=\"privacy-page-wrapper\" style=\"line-height: 1.8; color: #4a5568;\">\n                <div style=\"background: #f8faf9; padding: 20px; border-radius: 8px; border-left: 4px solid #1b4d3e; margin-bottom: 25px;\">\n                    <p style=\"margin: 0; font-weight: 600; color: #1b4d3e;\"><i class=\"las la-shield-alt\" style=\"font-size: 1.3rem; vertical-align: middle;\"></i> Your Privacy & Data Security Matter to Us</p>\n                </div>\n\n                <h3 style=\"color: #1b4d3e; font-size: 1.3rem; font-weight: 700; margin: 20px 0 10px 0;\">1. Information We Collect</h3>\n                <p>When you place an order or sign up for the Mailee ₹10 VIP Pass, we collect your name, shipping address, email address, and phone number to fulfill your delivery via cold-chain logistics.</p>\n\n                <h3 style=\"color: #1b4d3e; font-size: 1.3rem; font-weight: 700; margin: 20px 0 10px 0;\">2. How We Protect Your Data</h3>\n                <p>All sensitive information is processed over 256-bit SSL encrypted connection. We do not store credit card details or share your personal information with third-party advertisers.</p>\n\n                <h3 style=\"color: #1b4d3e; font-size: 1.3rem; font-weight: 700; margin: 20px 0 10px 0;\">3. Contact Privacy Officer</h3>\n                <p>If you have questions regarding our data protection policies, please contact our privacy compliance team at <a href=\"mailto:privacy@mailee.in\" style=\"color: #1b4d3e; font-weight: 600;\">privacy@mailee.in</a>.</p>\n            </div>');
/*!40000 ALTER TABLE `page_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES
(1,'about-us',1,'2026-09-10 20:08:59','2026-09-10 20:08:59'),
(2,'contact-us',1,'2026-09-10 20:08:59','2026-09-10 20:08:59'),
(3,'media',1,'2026-09-10 20:08:59','2026-09-10 20:08:59'),
(4,'privacy-policy',1,'2026-09-10 20:08:59','2026-09-10 20:08:59');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `persistences`
--

DROP TABLE IF EXISTS `persistences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `persistences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persistences_code_unique` (`code`),
  KEY `persistences_user_id_foreign` (`user_id`),
  CONSTRAINT `persistences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persistences`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `persistences` WRITE;
/*!40000 ALTER TABLE `persistences` DISABLE KEYS */;
INSERT INTO `persistences` VALUES
(1,1,'W9DROWw7gJYwO5UilDMuw9z7WnIqjyHY','2026-08-22 07:58:35','2026-08-22 07:58:35');
/*!40000 ALTER TABLE `persistences` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `product_attribute_values`
--

DROP TABLE IF EXISTS `product_attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_attribute_values` (
  `product_attribute_id` int(10) unsigned NOT NULL,
  `attribute_value_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_attribute_id`,`attribute_value_id`),
  KEY `product_attribute_values_attribute_value_id_foreign` (`attribute_value_id`),
  CONSTRAINT `product_attribute_values_attribute_value_id_foreign` FOREIGN KEY (`attribute_value_id`) REFERENCES `attribute_values` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_values_product_attribute_id_foreign` FOREIGN KEY (`product_attribute_id`) REFERENCES `product_attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute_values`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `product_attribute_values` WRITE;
/*!40000 ALTER TABLE `product_attribute_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_attribute_values` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `product_attributes`
--

DROP TABLE IF EXISTS `product_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_attributes_product_id_index` (`product_id`),
  KEY `product_attributes_attribute_id_index` (`attribute_id`),
  CONSTRAINT `product_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attributes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `product_attributes` WRITE;
/*!40000 ALTER TABLE `product_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_attributes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `product_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES
(56,41),
(57,41),
(58,41),
(69,41),
(70,41),
(71,41),
(72,41),
(73,41),
(74,41),
(75,41),
(76,41),
(77,41),
(78,41),
(61,42),
(81,42),
(82,42),
(59,43),
(60,43),
(62,43),
(65,43),
(83,43),
(84,43),
(56,44),
(57,44),
(62,44),
(63,44),
(80,44),
(64,45),
(66,46),
(67,46),
(79,46),
(68,47);
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `product_options`
--

DROP TABLE IF EXISTS `product_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_options` (
  `product_id` int(10) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`option_id`),
  KEY `product_options_option_id_foreign` (`option_id`),
  CONSTRAINT `product_options_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_options`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `product_options` WRITE;
/*!40000 ALTER TABLE `product_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_options` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `product_tags`
--

DROP TABLE IF EXISTS `product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_tags` (
  `product_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`tag_id`),
  KEY `product_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `product_tags_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tags`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `product_tags` WRITE;
/*!40000 ALTER TABLE `product_tags` DISABLE KEYS */;
INSERT INTO `product_tags` VALUES
(1,1),
(2,1),
(4,1),
(6,1),
(10,1),
(11,1),
(15,1),
(16,1),
(2,2),
(3,2),
(5,2),
(8,2),
(9,2),
(12,2),
(13,2),
(4,4),
(8,4),
(13,4),
(1,5),
(3,5),
(5,5),
(7,5),
(9,5),
(11,5),
(14,5),
(15,5),
(3,6),
(5,6),
(12,6),
(16,6),
(2,7),
(4,7),
(10,7),
(11,7),
(14,7),
(16,7),
(1,8),
(6,8),
(7,8),
(10,8);
/*!40000 ALTER TABLE `product_tags` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `product_translations`
--

DROP TABLE IF EXISTS `product_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext NOT NULL,
  `short_description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_translations_product_id_locale_unique` (`product_id`,`locale`),
  FULLTEXT KEY `name` (`name`),
  CONSTRAINT `product_translations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `product_translations` WRITE;
/*!40000 ALTER TABLE `product_translations` DISABLE KEYS */;
INSERT INTO `product_translations` VALUES
(56,56,'en','Authentic Himalayan Steamed Chicken Momos (24 Pcs)','Hand-crafted authentic Himalayan steamed chicken momos stuffed with juicy minced chicken, mountain coriander, scallions, and traditional Nepali spices. Served with signature spicy Darjeeling red chili chutney and creamy garlic mayo dip.','Authentic Nepali & Darjeeling Steamed Chicken Momos with Chili Chutney.'),
(57,57,'en','Authentic Darjeeling Veg & Cheese Momos (24 Pcs)','Traditional Darjeeling style vegetable & melted cheese momos filled with finely shredded fresh cabbage, carrots, bell peppers, processed cheese, and aromatic Himalayan herbs. Steam or pan-fry in 5 minutes.','Melted cheese & fresh veg momos from Darjeeling hills.'),
(58,58,'en','Nepali Fiery Schezwan Fried Momos (20 Pcs)','Crispy fried authentic Nepali dumplings tossed in a fiery hot Schezwan chili garlic sauce. Frozen fresh, ready to deep-fry or air-fry in 4 minutes.','Crispy fried momos with spicy Schezwan glaze.'),
(59,59,'en','Crispy Peri Peri French Fries (1 Kg Jumbo Pack)','Golden extra crunchy frozen french fries dusted with tangy peri peri masala spice mix. Premium North Bengal potato cut fries, ready to fry in 3 minutes.','1 Kg Jumbo pack of extra crunchy Peri Peri Fries.'),
(60,60,'en','Classic Golden Salted French Fries (1 Kg Pack)','Crispy restaurant-grade cut french fries. Made from high-grade potatoes, lightly blanched and blast-frozen at -18°C for unbeatable crispness.','100% crispy golden salted fries for quick snacks.'),
(61,61,'en','Flaky Himalayan Malabar Paratha (10 Pcs Pack)','Multi-layered golden-brown flaky Malabar parathas. Heat on a tawa with butter for 2 minutes and enjoy restaurant-quality hot flaky parathas.','Flaky, buttery multi-layered tawa parathas.'),
(62,62,'en','Crispy Himalayan Veg Spring Rolls (12 Pcs Pack)','Crunchy golden vegetable spring rolls packed with seasoned Himalayan vegetables, shredded cabbage, mushrooms, and glass noodles. Served with sweet chili dipping sauce.','Golden crispy spring rolls with sweet chili dip.'),
(63,63,'en','Juicy Himalayan Chicken Seekh Kebabs (8 Skewers)','Tender minced chicken seasoned with mountain herbs, roasted cumin, and Himalayan spices, skewered and pre-grilled. Pan-sear or grill in 4 minutes.','Aromatic grilled chicken seekh kebabs on skewers.'),
(64,64,'en','Sweet Farm Green Peas (1 Kg Sub-Zero IQF)','Naturally sweet garden peas harvested at peak freshness and Individually Quick Frozen (IQF) at -18°C within 3 hours of harvest. 0% preservatives, 100% natural sweetness.','Farm-fresh vibrant green peas locked at sub-zero.'),
(65,65,'en','Crispy Golden Chicken Nuggets (500g Pack)','Bite-sized tender chicken breast pieces in a crunchy golden breadcrumb coating. Quick snack favorite for kids and parties.','Crunchy golden chicken nuggets ready in 3 minutes.'),
(66,66,'en','Siliguri Evening Chai-Snack Combo','The complete North Bengal evening tea combo: 15 Steamed Chicken Momos + 5 Veg Spring Rolls + 3 Flaky Malabar Parathas + Signature Dalle Chutney jars.','15 Chicken Momos + 5 Spring Rolls + 3 Malabar Parathas.'),
(67,67,'en','Mega Momo Party Platter (60 Pcs Assorted)','Massive party celebration platter: 20 Chicken Momos + 20 Veg Cheese Momos + 20 Schezwan Fried Momos + 3 Jars of Himalayan Chutneys.','60 Pcs Assorted Momos + 3 Jars of Himalayan Dips.'),
(68,68,'en','Mailee ₹10 VIP Club Membership Pass','Join the official Mailee ₹10 VIP Club! Pay just ₹10 once and unlock extreme wholesale discount prices (up to 70% OFF) on all authentic Himalayan frozen momos, parathas, fries, and finger foods delivered across North Bengal (Siliguri, Darjeeling, Jalpaiguri, Cooch Behar).','Pay ₹10 & Unlock Extreme Wholesale Discounts on All Orders!'),
(69,69,'en','Classic Chicken Momo (1 Kg Retail Pack)','<p>Traditional Darjeeling chicken momo crafted with tender chicken, hill onions, ginger, and authentic mountain herbs. 100% preservative-free, frozen at -18°C.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>','Traditional Darjeeling chicken momo crafted with tender chicken, hill onions, ginger, and authentic mountain herbs. 100% preservative-free, frozen at -18°C.'),
(70,70,'en','Mix Vegetables Momos (1 Kg Retail Pack)','<p>Crisp organic cabbage, mountain carrots, farm-fresh green peas, and shallots wrapped in paper-thin dough. Healthy and 100% vegetarian.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>','Crisp organic cabbage, mountain carrots, farm-fresh green peas, and shallots wrapped in paper-thin dough. Healthy and 100% vegetarian.'),
(71,71,'en','Mutton (Goat Meat) Momos (1 Kg Pack)','<p>Rich, juicy Himalayan goat meat filling spiced with hand-pounded mountain coriander, garlic, and wild herbs. The pride of Darjeeling.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>','Rich, juicy Himalayan goat meat filling spiced with hand-pounded mountain coriander, garlic, and wild herbs. The pride of Darjeeling.'),
(72,72,'en','Fresh Cottage Cheese Paneer Momos (1 Kg)','<p>Soft dairy paneer blended with farm-fresh garden cabbage, onion, and selected spices. Mild, creamy, and succulent in every bite.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>','Soft dairy paneer blended with farm-fresh garden cabbage, onion, and selected spices. Mild, creamy, and succulent in every bite.'),
(73,73,'en','Signature Palak Paneer Momos (1 Kg Pack)','<p>Vibrant natural spinach green pastry dough loaded with spiced cottage cheese and mountain greens. Steams beautifully in just 5 minutes.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>','Vibrant natural spinach green pastry dough loaded with spiced cottage cheese and mountain greens. Steams beautifully in just 5 minutes.'),
(74,74,'en','Gourmet Cheese Chicken Momo (1 Kg Pack)','<p>Melted molten cheese fused with finely minced spiced chicken. A crowd favorite across Siliguri and Kolkata food carts.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>','Melted molten cheese fused with finely minced spiced chicken. A crowd favorite across Siliguri and Kolkata food carts.'),
(75,75,'en','Fiery Tandoori Chicken Momo (1 Kg Pack)','<p>Smoky tandoori marinade blended into juicy chicken filling. Pan-fry, steam, or deep-fry for an authentic street food burst.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>','Smoky tandoori marinade blended into juicy chicken filling. Pan-fry, steam, or deep-fry for an authentic street food burst.'),
(76,76,'en','Traditional Chicken Rice Momo (1 Kg Pack)','<p>Heritage Tibetan dumpling recipe combining aromatic short-grain rice with spiced minced chicken.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>','Heritage Tibetan dumpling recipe combining aromatic short-grain rice with spiced minced chicken.'),
(77,77,'en','Sweet Corn Cheese Momo (1 Kg Pack)','<p>Juicy golden sweet corn kernels paired with gooey mozzarella cheese and green bell peppers.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>','Juicy golden sweet corn kernels paired with gooey mozzarella cheese and green bell peppers.'),
(78,78,'en','Jain Special Momos (Pure Veg - No Onion & Garlic)','<p>Specially curated for the Jain community: completely free of onion, garlic, or root vegetables. Made with cabbage, green peas, sweet corn, and bell peppers.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>','Specially curated for the Jain community: completely free of onion, garlic, or root vegetables. Made with cabbage, green peas, sweet corn, and bell peppers.'),
(79,79,'en','Artisanal Choco Lava Steamed Buns (Pack of 10)','<p>Soft, pillowy steamed dessert baozi bursting with rich molten chocolate lava. The ultimate Himalayan sweet ending.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>','Soft, pillowy steamed dessert baozi bursting with rich molten chocolate lava. The ultimate Himalayan sweet ending.'),
(80,80,'en','Himalayan Mutton Meat Balls (500g Pack)','<p>Tender minced mutton meatballs seasoned with whole Himalayan spices. Perfect for curries, skewers, and party starters.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>','Tender minced mutton meatballs seasoned with whole Himalayan spices. Perfect for curries, skewers, and party starters.'),
(81,81,'en','Stuffed Chicken Keema Paratha (Pack of 5)','<p>Layered golden parathas stuffed generously with spiced minced chicken. Preservative-free, ready in 3 minutes on the tawa.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>','Layered golden parathas stuffed generously with spiced minced chicken. Preservative-free, ready in 3 minutes on the tawa.'),
(82,82,'en','Flaky Himalayan Laccha Paratha (Pack of 10)','<p>Spiral layered multi-fold parathas made from pure ingredients. Crispy on the exterior and super-soft inside.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>','Spiral layered multi-fold parathas made from pure ingredients. Crispy on the exterior and super-soft inside.'),
(83,83,'en','Crispy Golden French Fries (1 Kg Pack)','<p>Golden potato fries flash-frozen at peak crispiness. Restaurant-grade quality ready in 3 minutes.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>','Golden potato fries flash-frozen at peak crispiness. Restaurant-grade quality ready in 3 minutes.'),
(84,84,'en','Crispy Golden Chicken Nuggets (1 Kg Pack)','<p>Bite-sized chicken nuggets breaded with golden crumb. Tender juicy center, crunchy golden coating.</p><p><strong>Storage Instructions:</strong> Store at or below -18°C. Do not refreeze once thawed. 100% Halal & FSSAI Certified.</p>','Bite-sized chicken nuggets breaded with golden crumb. Tender juicy center, crunchy golden coating.');
/*!40000 ALTER TABLE `product_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `product_variants`
--

DROP TABLE IF EXISTS `product_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(191) NOT NULL,
  `uids` text NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `price` decimal(18,4) unsigned DEFAULT NULL,
  `special_price` decimal(18,4) unsigned DEFAULT NULL,
  `special_price_type` varchar(191) DEFAULT NULL,
  `special_price_start` date DEFAULT NULL,
  `special_price_end` date DEFAULT NULL,
  `selling_price` decimal(18,4) unsigned DEFAULT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `manage_stock` tinyint(1) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `in_stock` tinyint(1) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_variants_product_id_foreign` (`product_id`),
  CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variants`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `product_variants` WRITE;
/*!40000 ALTER TABLE `product_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_variants` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `product_variations`
--

DROP TABLE IF EXISTS `product_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variations` (
  `product_id` int(10) unsigned NOT NULL,
  `variation_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`variation_id`),
  KEY `product_variations_variation_id_foreign` (`variation_id`),
  CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_variations_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `product_variations` WRITE;
/*!40000 ALTER TABLE `product_variations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_variations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand_id` int(10) unsigned DEFAULT NULL,
  `tax_class_id` int(10) unsigned DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `price` decimal(18,4) DEFAULT NULL,
  `special_price` decimal(18,4) unsigned DEFAULT NULL,
  `special_price_type` varchar(191) DEFAULT NULL,
  `special_price_start` date DEFAULT NULL,
  `special_price_end` date DEFAULT NULL,
  `selling_price` decimal(18,4) unsigned DEFAULT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `manage_stock` tinyint(1) NOT NULL DEFAULT 0,
  `qty` int(11) DEFAULT NULL,
  `in_stock` tinyint(1) NOT NULL DEFAULT 1,
  `viewed` int(10) unsigned NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL,
  `new_from` datetime DEFAULT NULL,
  `new_to` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_virtual` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_brand_id_foreign` (`brand_id`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES
(56,NULL,NULL,'authentic-himalayan-steamed-chicken-momos-24-pcs',299.0000,119.0000,'fixed','2026-09-11','2029-09-11',119.0000,'MOMO-CHK-24',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-10 20:08:33','2026-09-10 20:08:33',0),
(57,NULL,NULL,'authentic-darjeeling-veg-cheese-momos-24-pcs',249.0000,99.0000,'fixed','2026-09-11','2029-09-11',99.0000,'MOMO-VEG-24',0,5000,1,1,1,NULL,NULL,NULL,'2026-09-10 20:08:33','2026-09-10 20:08:33',0),
(58,NULL,NULL,'nepali-fiery-schezwan-fried-momos-20-pcs',279.0000,109.0000,'fixed','2026-09-11','2029-09-11',109.0000,'MOMO-SCH-20',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-10 20:08:33','2026-09-10 20:08:33',0),
(59,NULL,NULL,'crispy-peri-peri-french-fries-1-kg-jumbo-pack',220.0000,89.0000,'fixed','2026-09-11','2029-09-11',89.0000,'FRIES-PERI-1KG',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-10 20:08:33','2026-09-10 20:08:33',0),
(60,NULL,NULL,'classic-golden-salted-french-fries-1-kg-pack',199.0000,79.0000,'fixed','2026-09-11','2029-09-11',79.0000,'FRIES-CLS-1KG',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-10 20:08:33','2026-09-10 20:08:33',0),
(61,NULL,NULL,'flaky-himalayan-malabar-paratha-10-pcs-pack',250.0000,99.0000,'fixed','2026-09-11','2029-09-11',99.0000,'PARA-MALABAR-10',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-10 20:08:33','2026-09-10 20:08:33',0),
(62,NULL,NULL,'crispy-himalayan-veg-spring-rolls-12-pcs-pack',230.0000,89.0000,'fixed','2026-09-11','2029-09-11',89.0000,'ROLL-VEG-12',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-10 20:08:33','2026-09-10 20:08:33',0),
(63,NULL,NULL,'juicy-himalayan-chicken-seekh-kebabs-8-skewers',340.0000,149.0000,'fixed','2026-09-11','2029-09-11',149.0000,'KEBAB-CHK-8',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-10 20:08:33','2026-09-10 20:08:33',0),
(64,NULL,NULL,'sweet-farm-green-peas-1-kg-sub-zero-iqf',180.0000,79.0000,'fixed','2026-09-11','2029-09-11',79.0000,'PEAS-IQF-1KG',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-10 20:08:33','2026-09-10 20:08:33',0),
(65,NULL,NULL,'crispy-golden-chicken-nuggets-500g-pack',260.0000,109.0000,'fixed','2026-09-11','2029-09-11',109.0000,'NUGGET-CHK-500',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-10 20:08:33','2026-09-10 20:08:33',0),
(66,NULL,NULL,'siliguri-evening-chai-snack-combo',480.0000,349.0000,'fixed','2026-09-11','2029-09-11',349.0000,'COMBO-CHAI-01',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-10 20:08:33','2026-09-10 20:08:33',0),
(67,NULL,NULL,'mega-momo-party-platter-60-pcs-assorted',1150.0000,799.0000,'fixed','2026-09-11','2029-09-11',799.0000,'COMBO-PARTY-60',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-10 20:08:33','2026-09-10 20:08:33',0),
(68,NULL,NULL,'mailee-rs10-vip-club-membership-pass',10.0000,NULL,'fixed','2026-09-11','2029-09-11',10.0000,'MAILEE-VIP-PASS',0,5000,1,1,1,NULL,NULL,NULL,'2026-09-10 20:08:33','2026-09-10 20:08:33',0),
(69,NULL,NULL,'classic-chicken-momo-1kg',520.0000,364.0000,'fixed','2026-09-10','2029-09-11',364.0000,'ML-AC3C16',0,5000,1,2,1,NULL,NULL,NULL,'2026-09-11 05:45:23','2026-09-11 05:45:23',0),
(70,NULL,NULL,'mix-vegetables-momos-1kg',420.0000,294.0000,'fixed','2026-09-10','2029-09-11',294.0000,'ML-615EE9',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-11 05:45:23','2026-09-11 05:45:23',0),
(71,NULL,NULL,'mutton-goat-meat-momos-1kg',800.0000,560.0000,'fixed','2026-09-10','2029-09-11',560.0000,'ML-92EE8A',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-11 05:45:23','2026-09-11 05:45:23',0),
(72,NULL,NULL,'fresh-cottage-cheese-paneer-momos-1kg',560.0000,390.0000,'fixed','2026-09-10','2029-09-11',390.0000,'ML-06DD56',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-11 05:45:23','2026-09-11 05:45:23',0),
(73,NULL,NULL,'signature-palak-paneer-momos-1kg',560.0000,390.0000,'fixed','2026-09-10','2029-09-11',390.0000,'ML-DF5D03',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-11 05:45:23','2026-09-11 05:45:23',0),
(74,NULL,NULL,'gourmet-cheese-chicken-momo-1kg',560.0000,390.0000,'fixed','2026-09-10','2029-09-11',390.0000,'ML-5E513D',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-11 05:45:23','2026-09-11 05:45:23',0),
(75,NULL,NULL,'fiery-tandoori-chicken-momo-1kg',560.0000,390.0000,'fixed','2026-09-10','2029-09-11',390.0000,'ML-C0EC65',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-11 05:45:23','2026-09-11 05:45:23',0),
(76,NULL,NULL,'traditional-chicken-rice-momo-1kg',520.0000,364.0000,'fixed','2026-09-10','2029-09-11',364.0000,'ML-68C111',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-11 05:45:23','2026-09-11 05:45:23',0),
(77,NULL,NULL,'sweet-corn-cheese-momo-1kg',520.0000,364.0000,'fixed','2026-09-10','2029-09-11',364.0000,'ML-A30CE5',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-11 05:45:23','2026-09-11 05:45:23',0),
(78,NULL,NULL,'jain-special-momos-pure-veg',520.0000,364.0000,'fixed','2026-09-10','2029-09-11',364.0000,'ML-095DB2',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-11 05:45:23','2026-09-11 05:45:23',0),
(79,NULL,NULL,'artisanal-choco-lava-steamed-buns',500.0000,349.0000,'fixed','2026-09-10','2029-09-11',349.0000,'ML-7FBB69',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-11 05:45:23','2026-09-11 05:45:23',0),
(80,NULL,NULL,'himalayan-mutton-meat-balls-500g',400.0000,280.0000,'fixed','2026-09-10','2029-09-11',280.0000,'ML-46CDDD',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-11 05:45:23','2026-09-11 05:45:23',0),
(81,NULL,NULL,'stuffed-chicken-keema-paratha',350.0000,249.0000,'fixed','2026-09-10','2029-09-11',249.0000,'ML-2AEDEF',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-11 05:45:23','2026-09-11 05:45:23',0),
(82,NULL,NULL,'flaky-himalayan-laccha-paratha',250.0000,175.0000,'fixed','2026-09-10','2029-09-11',175.0000,'ML-896B6C',0,5000,1,1,1,NULL,NULL,NULL,'2026-09-11 05:45:23','2026-09-11 05:45:23',0),
(83,NULL,NULL,'crispy-golden-french-fries-1kg',350.0000,200.0000,'fixed','2026-09-10','2029-09-11',200.0000,'ML-FB2FD1',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-11 05:45:23','2026-09-11 05:45:23',0),
(84,NULL,NULL,'crispy-golden-chicken-nuggets-1kg',350.0000,200.0000,'fixed','2026-09-10','2029-09-11',200.0000,'ML-8AA153',0,5000,1,0,1,NULL,NULL,NULL,'2026-09-11 05:45:23','2026-09-11 05:45:23',0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `related_products`
--

DROP TABLE IF EXISTS `related_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `related_products` (
  `product_id` int(10) unsigned NOT NULL,
  `related_product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`,`related_product_id`),
  KEY `related_products_related_product_id_foreign` (`related_product_id`),
  CONSTRAINT `related_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `related_products_related_product_id_foreign` FOREIGN KEY (`related_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `related_products`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `related_products` WRITE;
/*!40000 ALTER TABLE `related_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `related_products` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `reminders`
--

DROP TABLE IF EXISTS `reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reminders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `code` varchar(191) NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reminders_user_id_foreign` (`user_id`),
  CONSTRAINT `reminders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminders`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `reminders` WRITE;
/*!40000 ALTER TABLE `reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminders` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reviewer_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `rating` int(11) NOT NULL,
  `reviewer_name` varchar(191) NOT NULL,
  `comment` text NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_reviewer_id_index` (`reviewer_id`),
  KEY `reviews_product_id_index` (`product_id`),
  CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `role_translations`
--

DROP TABLE IF EXISTS `role_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_translations_role_id_locale_unique` (`role_id`,`locale`),
  CONSTRAINT `role_translations_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `role_translations` WRITE;
/*!40000 ALTER TABLE `role_translations` DISABLE KEYS */;
INSERT INTO `role_translations` VALUES
(1,1,'en','Admin'),
(2,2,'en','Customer');
/*!40000 ALTER TABLE `role_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permissions` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,'{\"admin.users.index\":true,\"admin.users.create\":true,\"admin.users.edit\":true,\"admin.users.destroy\":true,\"admin.roles.index\":true,\"admin.roles.create\":true,\"admin.roles.edit\":true,\"admin.roles.destroy\":true,\"admin.products.index\":true,\"admin.products.create\":true,\"admin.products.edit\":true,\"admin.products.destroy\":true,\"admin.brands.index\":true,\"admin.brands.create\":true,\"admin.brands.edit\":true,\"admin.brands.destroy\":true,\"admin.attributes.index\":true,\"admin.attributes.create\":true,\"admin.attributes.edit\":true,\"admin.attributes.destroy\":true,\"admin.attribute_sets.index\":true,\"admin.attribute_sets.create\":true,\"admin.attribute_sets.edit\":true,\"admin.attribute_sets.destroy\":true,\"admin.variations.index\":true,\"admin.variations.create\":true,\"admin.variations.edit\":true,\"admin.variations.destroy\":true,\"admin.options.index\":true,\"admin.options.create\":true,\"admin.options.edit\":true,\"admin.options.destroy\":true,\"admin.filters.index\":true,\"admin.filters.create\":true,\"admin.filters.edit\":true,\"admin.filters.destroy\":true,\"admin.reviews.index\":true,\"admin.reviews.create\":true,\"admin.reviews.edit\":true,\"admin.reviews.destroy\":true,\"admin.categories.index\":true,\"admin.categories.create\":true,\"admin.categories.edit\":true,\"admin.categories.destroy\":true,\"admin.tags.index\":true,\"admin.tags.create\":true,\"admin.tags.edit\":true,\"admin.tags.destroy\":true,\"admin.orders.index\":true,\"admin.orders.show\":true,\"admin.orders.edit\":true,\"admin.flash_sales.index\":true,\"admin.flash_sales.create\":true,\"admin.flash_sales.edit\":true,\"admin.flash_sales.destroy\":true,\"admin.transactions.index\":true,\"admin.coupons.index\":true,\"admin.coupons.create\":true,\"admin.coupons.edit\":true,\"admin.coupons.destroy\":true,\"admin.menus.index\":true,\"admin.menus.create\":true,\"admin.menus.edit\":true,\"admin.menus.destroy\":true,\"admin.menu_items.index\":true,\"admin.menu_items.create\":true,\"admin.menu_items.edit\":true,\"admin.menu_items.destroy\":true,\"admin.blog_posts.index\":true,\"admin.blog_posts.create\":true,\"admin.blog_posts.edit\":true,\"admin.blog_posts.destroy\":true,\"admin.blog_categories.index\":true,\"admin.blog_categories.create\":true,\"admin.blog_categories.edit\":true,\"admin.blog_categories.destroy\":true,\"admin.blog_tags.index\":true,\"admin.blog_tags.create\":true,\"admin.blog_tags.edit\":true,\"admin.blog_tags.destroy\":true,\"admin.importer.import\":true,\"admin.media.index\":true,\"admin.media.create\":true,\"admin.media.destroy\":true,\"admin.pages.index\":true,\"admin.pages.create\":true,\"admin.pages.edit\":true,\"admin.pages.destroy\":true,\"admin.currency_rates.index\":true,\"admin.currency_rates.edit\":true,\"admin.taxes.index\":true,\"admin.taxes.create\":true,\"admin.taxes.edit\":true,\"admin.taxes.destroy\":true,\"admin.translations.index\":true,\"admin.translations.edit\":true,\"admin.sliders.index\":true,\"admin.sliders.create\":true,\"admin.sliders.edit\":true,\"admin.sliders.destroy\":true,\"admin.reports.index\":true,\"admin.settings.edit\":true,\"admin.storefront.edit\":true}','2026-08-22 01:57:48','2026-08-22 01:57:48'),
(2,NULL,'2026-08-22 01:57:50','2026-08-22 01:57:50');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `search_terms`
--

DROP TABLE IF EXISTS `search_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_terms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(191) NOT NULL,
  `results` int(10) unsigned NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `search_terms_term_unique` (`term`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_terms`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `search_terms` WRITE;
/*!40000 ALTER TABLE `search_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_terms` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `setting_translations`
--

DROP TABLE IF EXISTS `setting_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setting_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `value` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting_translations_setting_id_locale_unique` (`setting_id`,`locale`),
  CONSTRAINT `setting_translations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `setting_translations` WRITE;
/*!40000 ALTER TABLE `setting_translations` DISABLE KEYS */;
INSERT INTO `setting_translations` VALUES
(1,1,'en','s:39:\"Mailee - Authentic Himalayan Delicacies\";'),
(2,24,'en','s:4:\"auto\";'),
(3,25,'en','s:13:\"Free Shipping\";'),
(4,26,'en','s:12:\"Local Pickup\";'),
(5,27,'en','s:9:\"Flat Rate\";'),
(6,28,'en','s:6:\"PayPal\";'),
(7,29,'en','s:28:\"Pay via your PayPal account.\";'),
(8,30,'en','s:6:\"Stripe\";'),
(9,31,'en','s:29:\"Pay via credit or debit card.\";'),
(10,32,'en','s:5:\"Paytm\";'),
(11,33,'en','s:103:\"The best payment gateway provider in India for e-payment through credit card, debit card & net banking.\";'),
(12,34,'en','s:8:\"Razorpay\";'),
(13,35,'en','s:74:\"Pay securely by Credit or Debit card or Internet Banking through Razorpay.\";'),
(14,36,'en','s:9:\"Instamojo\";'),
(15,37,'en','s:16:\"CC/DB/NB/Wallets\";'),
(16,38,'en','s:13:\"Authorize.net\";'),
(17,39,'en','s:33:\"Accept payments anytime, anywhere\";'),
(18,40,'en','s:8:\"Paystack\";'),
(19,41,'en','s:45:\"Modern online and offline payments for Africa\";'),
(20,42,'en','s:12:\"Mercado Pago\";'),
(21,43,'en','s:36:\"From now on, do more with your money\";'),
(22,44,'en','s:11:\"Flutterwave\";'),
(23,45,'en','s:40:\"Endless possibilities for every business\";'),
(24,46,'en','s:6:\"Iyzico\";'),
(25,47,'en','s:33:\"Pay for your shopping with iyzico\";'),
(26,48,'en','s:7:\"Payfast\";'),
(27,49,'en','s:31:\"Online Payments In South Africa\";'),
(28,50,'en','s:5:\"bKash\";'),
(29,51,'en','s:27:\"Pay via your bKash account.\";'),
(30,52,'en','s:5:\"Nagad\";'),
(31,53,'en','s:27:\"Pay via your Nagad account.\";'),
(32,54,'en','s:10:\"SSLCommerz\";'),
(33,55,'en','s:32:\"Pay via your SSLCommerz account.\";'),
(34,56,'en','s:16:\"Cash On Delivery\";'),
(35,57,'en','s:28:\"Pay with cash upon delivery.\";'),
(36,58,'en','s:13:\"Bank Transfer\";'),
(37,59,'en','s:100:\"Make your payment directly into our bank account. Please use your Order ID as the payment reference.\";'),
(38,60,'en','s:19:\"Check / Money Order\";'),
(39,61,'en','s:33:\"Please send a check to our store.\";'),
(40,104,'en','s:47:\"Crafted in the Himalayas, Shared with the World\";'),
(41,111,'en','s:138:\"Mailee by Shambhala Food Products Pvt. Ltd. - India\'s first FSSAI approved blast-frozen momos and authentic Himalayan foods from Siliguri.\";'),
(42,112,'en','N;'),
(43,113,'en','N;'),
(44,234,'en','s:139:\"Direct from Himalayan Foothills, Siliguri | Free Cold-Chain Delivery ₹499+ | FSSAI Lic. 22817022000462 | Call / WhatsApp: +91 98008 64524\";'),
(45,62,'en','s:209:\"Copyright © 2026 Shambhala Food Products Pvt. Ltd. (Mailee - Momos on Wheels). All rights reserved. Central FSSAI Lic. No. 22817022000462. Sachitra Complex, ISKCON Mandir Road, Siliguri - 734001, West Bengal.\";'),
(46,243,'en','i:72;'),
(47,244,'en','i:72;'),
(48,242,'en','s:134:\"Shambhala Food Products Pvt. Ltd.\nSachitra Complex, ISKCON Mandir Road\nSiliguri - 734001, West Bengal, India\nFSSAI Lic: 22817022000462\";'),
(49,70,'en','s:27:\"First FSSAI Certified Momos\";'),
(50,71,'en','s:41:\"Lic. 22817022000462 • ISO 22000 & HACCP\";'),
(51,73,'en','s:29:\"Direct from Siliguri Facility\";'),
(52,74,'en','s:29:\"Unbroken -18°C Cryo-Freezing\";'),
(53,76,'en','s:28:\"Crafted by Mountain Artisans\";'),
(54,77,'en','s:35:\"Empowering North Bengal tea workers\";'),
(55,79,'en','s:25:\"0% Chemical Preservatives\";'),
(56,80,'en','s:30:\"100% Real Meats & Farm Veggies\";'),
(57,245,'en','i:67;'),
(58,246,'en','i:68;'),
(59,247,'en','i:70;'),
(60,248,'en','i:71;'),
(61,249,'en','i:69;'),
(62,250,'en','s:28:\"Explore Himalayan Categories\";'),
(63,251,'en','s:55:\"Direct from mountain farms and artisanal cloud kitchens\";'),
(64,88,'en','s:38:\"Authentic Himalayan Momos (1 Kg Packs)\";'),
(65,91,'en','s:36:\"Parathas, Buns & Crispy Finger Foods\";'),
(66,96,'en','s:31:\"Siliguri Production Bestsellers\";'),
(67,252,'en','s:33:\"Chef’s Mountain Recommendations\";'),
(68,99,'en','s:27:\"Crispy Fries & Finger Foods\";'),
(69,253,'en','s:23:\"Party Combos & Platters\";'),
(70,103,'en','s:35:\"Himalayan Food Chronicles & Recipes\";'),
(71,3,'en','s:15:\"+91 98008 64524\";'),
(72,2,'en','s:14:\"info@mailee.in\";');
/*!40000 ALTER TABLE `setting_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) NOT NULL,
  `is_translatable` tinyint(1) NOT NULL DEFAULT 0,
  `plain_value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES
(1,'store_name',1,NULL,'2026-08-22 01:57:49','2026-08-22 01:57:49'),
(2,'store_email',1,'s:14:\"info@mailee.in\";','2026-08-22 01:57:50','2026-09-11 06:04:29'),
(3,'store_phone',1,'s:15:\"+91 98008 64524\";','2026-08-22 01:57:50','2026-09-11 06:04:29'),
(4,'search_engine',0,'s:5:\"mysql\";','2026-08-22 01:57:50','2026-08-22 01:57:50'),
(5,'algolia_app_id',0,'N;','2026-08-22 01:57:50','2026-08-22 01:57:50'),
(6,'algolia_secret',0,'N;','2026-08-22 01:57:50','2026-08-22 01:57:50'),
(7,'meilisearch_host',0,'N;','2026-08-22 01:57:50','2026-08-22 01:57:50'),
(8,'meilisearch_key',0,'N;','2026-08-22 01:57:50','2026-08-22 01:57:50'),
(9,'supported_countries',0,'a:1:{i:0;s:2:\"IN\";}','2026-08-22 01:57:50','2026-09-10 20:08:34'),
(10,'default_country',0,'s:2:\"IN\";','2026-08-22 01:57:50','2026-09-10 20:08:34'),
(11,'supported_locales',0,'a:1:{i:0;s:2:\"en\";}','2026-08-22 01:57:50','2026-08-22 01:57:50'),
(12,'default_locale',0,'s:2:\"en\";','2026-08-22 01:57:50','2026-08-22 01:57:50'),
(13,'default_timezone',0,'s:10:\"Asia/Dhaka\";','2026-08-22 01:57:50','2026-08-22 01:57:50'),
(14,'customer_role',0,'s:1:\"2\";','2026-08-22 01:57:50','2026-08-22 08:39:22'),
(15,'reviews_enabled',0,'s:1:\"1\";','2026-08-22 01:57:50','2026-08-22 08:39:22'),
(16,'auto_approve_reviews',0,'s:1:\"1\";','2026-08-22 01:57:50','2026-08-22 08:39:22'),
(17,'cookie_bar_enabled',0,'s:1:\"1\";','2026-08-22 01:57:50','2026-08-22 08:39:22'),
(18,'supported_currencies',0,'a:1:{i:0;s:3:\"INR\";}','2026-08-22 01:57:50','2026-09-10 20:08:34'),
(19,'default_currency',0,'s:3:\"INR\";','2026-08-22 01:57:50','2026-09-10 20:08:34'),
(20,'send_order_invoice_email',0,'b:0;','2026-08-22 01:57:50','2026-08-22 01:57:50'),
(21,'newsletter_enabled',0,'s:1:\"0\";','2026-08-22 01:57:50','2026-08-22 08:39:23'),
(22,'local_pickup_cost',0,'s:1:\"0\";','2026-08-22 01:57:50','2026-08-22 08:39:23'),
(23,'flat_rate_cost',0,'s:1:\"0\";','2026-08-22 01:57:50','2026-08-22 08:39:23'),
(24,'pwa_direction',1,NULL,'2026-08-22 01:57:50','2026-08-22 01:57:50'),
(25,'free_shipping_label',1,NULL,'2026-08-22 01:57:50','2026-08-22 01:57:50'),
(26,'local_pickup_label',1,NULL,'2026-08-22 01:57:50','2026-08-22 01:57:50'),
(27,'flat_rate_label',1,NULL,'2026-08-22 01:57:50','2026-08-22 01:57:50'),
(28,'paypal_label',1,NULL,'2026-08-22 01:57:50','2026-08-22 01:57:50'),
(29,'paypal_description',1,NULL,'2026-08-22 01:57:50','2026-08-22 01:57:50'),
(30,'stripe_label',1,NULL,'2026-08-22 01:57:50','2026-08-22 01:57:50'),
(31,'stripe_description',1,NULL,'2026-08-22 01:57:50','2026-08-22 01:57:50'),
(32,'paytm_label',1,NULL,'2026-08-22 01:57:50','2026-08-22 01:57:50'),
(33,'paytm_description',1,NULL,'2026-08-22 01:57:50','2026-08-22 01:57:50'),
(34,'razorpay_label',1,NULL,'2026-08-22 01:57:50','2026-08-22 01:57:50'),
(35,'razorpay_description',1,NULL,'2026-08-22 01:57:50','2026-08-22 01:57:50'),
(36,'instamojo_label',1,NULL,'2026-08-22 01:57:50','2026-08-22 01:57:50'),
(37,'instamojo_description',1,NULL,'2026-08-22 01:57:50','2026-08-22 01:57:50'),
(38,'authorizenet_label',1,NULL,'2026-08-22 01:57:50','2026-08-22 01:57:50'),
(39,'authorizenet_description',1,NULL,'2026-08-22 01:57:50','2026-08-22 01:57:50'),
(40,'paystack_label',1,NULL,'2026-08-22 01:57:50','2026-08-22 01:57:50'),
(41,'paystack_description',1,NULL,'2026-08-22 01:57:51','2026-08-22 01:57:51'),
(42,'mercadopago_label',1,NULL,'2026-08-22 01:57:51','2026-08-22 01:57:51'),
(43,'mercadopago_description',1,NULL,'2026-08-22 01:57:51','2026-08-22 01:57:51'),
(44,'flutterwave_label',1,NULL,'2026-08-22 01:57:51','2026-08-22 01:57:51'),
(45,'flutterwave_description',1,NULL,'2026-08-22 01:57:51','2026-08-22 01:57:51'),
(46,'iyzico_label',1,NULL,'2026-08-22 01:57:51','2026-08-22 01:57:51'),
(47,'iyzico_description',1,NULL,'2026-08-22 01:57:51','2026-08-22 01:57:51'),
(48,'payfast_label',1,NULL,'2026-08-22 01:57:51','2026-08-22 01:57:51'),
(49,'payfast_description',1,NULL,'2026-08-22 01:57:51','2026-08-22 01:57:51'),
(50,'bkash_label',1,NULL,'2026-08-22 01:57:51','2026-08-22 01:57:51'),
(51,'bkash_description',1,NULL,'2026-08-22 01:57:51','2026-08-22 01:57:51'),
(52,'nagad_label',1,NULL,'2026-08-22 01:57:51','2026-08-22 01:57:51'),
(53,'nagad_description',1,NULL,'2026-08-22 01:57:51','2026-08-22 01:57:51'),
(54,'sslcommerz_label',1,NULL,'2026-08-22 01:57:51','2026-08-22 01:57:51'),
(55,'sslcommerz_description',1,NULL,'2026-08-22 01:57:51','2026-08-22 01:57:51'),
(56,'cod_label',1,NULL,'2026-08-22 01:57:51','2026-08-22 01:57:51'),
(57,'cod_description',1,NULL,'2026-08-22 01:57:51','2026-08-22 01:57:51'),
(58,'bank_transfer_label',1,NULL,'2026-08-22 01:57:51','2026-08-22 01:57:51'),
(59,'bank_transfer_description',1,NULL,'2026-08-22 01:57:51','2026-08-22 01:57:51'),
(60,'check_payment_label',1,NULL,'2026-08-22 01:57:51','2026-08-22 01:57:51'),
(61,'check_payment_description',1,NULL,'2026-08-22 01:57:51','2026-08-22 01:57:51'),
(62,'storefront_copyright_text',1,'s:49:\"Copyright © 2026 FleetCart. All rights reserved.\";','2026-08-22 01:57:51','2026-09-10 18:40:42'),
(63,'storefront_slider',0,'i:5;','2026-08-22 08:36:14','2026-09-10 20:08:34'),
(64,'storefront_primary_menu',0,'i:9;','2026-08-22 08:36:14','2026-09-10 20:08:34'),
(65,'storefront_footer_menu_one',0,'i:10;','2026-08-22 08:36:14','2026-09-10 20:08:59'),
(66,'storefront_footer_menu_two',0,'s:1:\"3\";','2026-08-22 08:36:14','2026-08-22 08:36:14'),
(67,'storefront_footer_menu_one_title',0,'s:11:\"Quick Links\";','2026-08-22 08:36:14','2026-08-22 08:36:14'),
(68,'storefront_footer_menu_two_title',0,'s:13:\"Customer Care\";','2026-08-22 08:36:14','2026-08-22 08:36:14'),
(69,'storefront_features_section_enabled',0,'i:0;','2026-08-22 08:36:14','2026-09-10 18:40:42'),
(70,'storefront_feature_1_title',1,'s:13:\"Free Delivery\";','2026-08-22 08:36:14','2026-09-10 20:08:33'),
(71,'storefront_feature_1_subtitle',1,'s:22:\"On all orders over $99\";','2026-08-22 08:36:14','2026-09-10 20:08:33'),
(72,'storefront_feature_1_icon',0,'s:16:\"las la-snowflake\";','2026-08-22 08:36:14','2026-09-10 20:08:34'),
(73,'storefront_feature_2_title',1,'s:14:\"30 Days Return\";','2026-08-22 08:36:14','2026-09-10 20:08:33'),
(74,'storefront_feature_2_subtitle',1,'s:22:\"Hassle-free money back\";','2026-08-22 08:36:14','2026-09-10 20:08:33'),
(75,'storefront_feature_2_icon',0,'s:10:\"las la-tag\";','2026-08-22 08:36:14','2026-09-10 20:08:34'),
(76,'storefront_feature_3_title',1,'s:12:\"24/7 Support\";','2026-08-22 08:36:14','2026-09-10 20:08:33'),
(77,'storefront_feature_3_subtitle',1,'s:24:\"Dedicated online service\";','2026-08-22 08:36:14','2026-09-10 20:08:33'),
(78,'storefront_feature_3_icon',0,'s:20:\"las la-shipping-fast\";','2026-08-22 08:36:14','2026-09-10 20:08:34'),
(79,'storefront_feature_4_title',1,'s:14:\"Secure Payment\";','2026-08-22 08:36:14','2026-09-10 20:08:33'),
(80,'storefront_feature_4_subtitle',1,'s:23:\"100% encrypted checkout\";','2026-08-22 08:36:14','2026-09-10 20:08:33'),
(81,'storefront_feature_4_icon',0,'s:17:\"las la-shield-alt\";','2026-08-22 08:36:14','2026-08-22 08:36:14'),
(82,'storefront_featured_categories_section_enabled',0,'i:0;','2026-08-22 08:36:14','2026-09-10 20:08:34'),
(83,'storefront_featured_categories_section_category_1_category_id',0,'i:41;','2026-08-22 08:36:14','2026-09-10 20:08:34'),
(84,'storefront_featured_categories_section_category_2_category_id',0,'i:42;','2026-08-22 08:36:14','2026-09-10 20:08:34'),
(85,'storefront_featured_categories_section_category_3_category_id',0,'i:43;','2026-08-22 08:36:14','2026-09-10 20:08:34'),
(86,'storefront_featured_categories_section_category_4_category_id',0,'i:44;','2026-08-22 08:36:14','2026-09-10 20:08:34'),
(87,'storefront_product_tabs_1_section_enabled',0,'i:1;','2026-08-22 08:36:14','2026-09-10 20:08:34'),
(88,'storefront_product_tabs_1_section_tab_1_title',1,'s:17:\"Featured Products\";','2026-08-22 08:36:14','2026-09-10 20:08:33'),
(89,'storefront_product_tabs_1_section_tab_1_product_type',0,'s:15:\"custom_products\";','2026-08-22 08:36:14','2026-08-22 08:36:14'),
(90,'storefront_product_tabs_1_section_tab_1_products',0,'a:10:{i:0;i:69;i:1;i:70;i:2;i:71;i:3;i:72;i:4;i:73;i:5;i:74;i:6;i:75;i:7;i:76;i:8;i:77;i:9;i:78;}','2026-08-22 08:36:14','2026-09-11 06:04:29'),
(91,'storefront_product_tabs_1_section_tab_2_title',1,'s:12:\"New Arrivals\";','2026-08-22 08:36:14','2026-09-10 20:08:33'),
(92,'storefront_product_tabs_1_section_tab_2_product_type',0,'s:15:\"custom_products\";','2026-08-22 08:36:14','2026-09-11 06:04:29'),
(93,'storefront_top_brands_section_enabled',0,'i:0;','2026-08-22 08:36:14','2026-09-10 20:08:34'),
(94,'storefront_top_brands_section_title',0,'s:10:\"Top Brands\";','2026-08-22 08:36:14','2026-08-22 08:36:14'),
(95,'storefront_product_grid_section_enabled',0,'i:0;','2026-08-22 08:36:14','2026-09-10 20:08:34'),
(96,'storefront_product_grid_section_tab_1_title',1,'s:12:\"Best Sellers\";','2026-08-22 08:36:14','2026-09-10 20:08:33'),
(97,'storefront_product_grid_section_tab_1_product_type',0,'s:15:\"custom_products\";','2026-08-22 08:36:14','2026-09-11 06:04:29'),
(98,'storefront_product_tabs_2_section_enabled',0,'i:0;','2026-08-22 08:36:14','2026-09-10 20:08:34'),
(99,'storefront_product_tabs_2_section_tab_1_title',1,'s:17:\"Recommended Deals\";','2026-08-22 08:36:14','2026-09-10 20:08:33'),
(100,'storefront_product_tabs_2_section_tab_1_product_type',0,'s:17:\"category_products\";','2026-08-22 08:36:14','2026-09-10 20:08:34'),
(101,'storefront_product_tabs_2_section_tab_1_products',0,'a:8:{i:0;i:5;i:1;i:6;i:2;i:7;i:3;i:8;i:4;i:9;i:5;i:10;i:6;i:11;i:7;i:12;}','2026-08-22 08:36:14','2026-08-22 08:36:14'),
(102,'storefront_blogs_section_enabled',0,'i:0;','2026-08-22 08:36:14','2026-09-10 20:08:34'),
(103,'storefront_blogs_section_title',1,'s:13:\"From Our Blog\";','2026-08-22 08:36:14','2026-09-10 20:08:33'),
(104,'store_tagline',1,'s:24:\"Next-Gen eCommerce Store\";','2026-08-22 08:36:14','2026-08-22 08:39:22'),
(105,'store_address_1',0,'s:29:\"100 Innovation Way, Suite 400\";','2026-08-22 08:36:14','2026-08-22 08:36:14'),
(106,'store_city',0,'s:9:\"Tech City\";','2026-08-22 08:36:14','2026-08-22 08:36:14'),
(107,'store_country',0,'s:2:\"US\";','2026-08-22 08:36:14','2026-08-22 08:36:14'),
(108,'store_state',0,'s:2:\"CA\";','2026-08-22 08:36:14','2026-08-22 08:36:14'),
(109,'store_zip',0,'s:5:\"94016\";','2026-08-22 08:36:14','2026-08-22 08:36:14'),
(110,'maintenance_mode',0,'s:1:\"0\";','2026-08-22 08:39:22','2026-08-22 08:39:22'),
(111,'store_description',1,NULL,'2026-08-22 08:39:22','2026-08-22 08:39:22'),
(112,'bank_transfer_instructions',1,NULL,'2026-08-22 08:39:22','2026-08-22 08:39:22'),
(113,'check_payment_instructions',1,NULL,'2026-08-22 08:39:22','2026-08-22 08:39:22'),
(114,'store_address_2',0,'N;','2026-08-22 08:39:22','2026-08-22 08:39:22'),
(115,'store_phone_hide',0,'s:1:\"0\";','2026-08-22 08:39:22','2026-08-22 08:39:22'),
(116,'store_email_hide',0,'s:1:\"0\";','2026-08-22 08:39:22','2026-08-22 08:39:22'),
(117,'pwa_enabled',0,'s:1:\"0\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(118,'pwa_theme_color',0,'s:7:\"#000000\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(119,'pwa_background_color',0,'s:7:\"#000000\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(120,'pwa_status_bar',0,'s:7:\"#000000\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(121,'pwa_display',0,'s:10:\"fullscreen\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(122,'pwa_orientation',0,'s:3:\"any\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(123,'currency_rate_exchange_service',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(124,'fixer_access_key',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(125,'forge_api_key',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(126,'currency_data_feed_api_key',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(127,'auto_refresh_currency_rates',0,'s:1:\"0\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(128,'auto_refresh_currency_rate_frequency',0,'s:5:\"daily\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(129,'sms_from',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(130,'sms_service',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(131,'vonage_key',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(132,'vonage_secret',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(133,'twilio_sid',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(134,'twilio_token',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(135,'welcome_sms',0,'s:1:\"0\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(136,'new_order_admin_sms',0,'s:1:\"0\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(137,'new_order_sms',0,'s:1:\"0\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(138,'mail_from_address',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(139,'mail_from_name',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(140,'mail_host',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(141,'mail_port',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(142,'mail_username',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(143,'mail_password',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(144,'mail_encryption',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(145,'welcome_email',0,'s:1:\"0\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(146,'admin_order_email',0,'s:1:\"0\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(147,'invoice_email',0,'s:1:\"0\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(148,'mailchimp_api_key',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(149,'mailchimp_list_id',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(150,'google_recaptcha_enabled',0,'s:1:\"0\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(151,'google_recaptcha_site_key',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(152,'google_recaptcha_secret_key',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(153,'custom_header_assets',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(154,'custom_footer_assets',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(155,'facebook_login_enabled',0,'s:1:\"0\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(156,'facebook_login_app_id',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(157,'facebook_login_app_secret',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(158,'google_login_enabled',0,'s:1:\"0\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(159,'google_login_client_id',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(160,'google_login_client_secret',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(161,'free_shipping_enabled',0,'s:1:\"1\";','2026-08-22 08:39:23','2026-08-22 08:41:56'),
(162,'free_shipping_min_amount',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(163,'local_pickup_enabled',0,'s:1:\"0\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(164,'flat_rate_enabled',0,'s:1:\"0\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(165,'paypal_enabled',0,'s:1:\"0\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(166,'paypal_test_mode',0,'s:1:\"0\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(167,'paypal_client_id',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(168,'paypal_secret',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(169,'stripe_enabled',0,'s:1:\"0\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(170,'stripe_publishable_key',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(171,'stripe_secret_key',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(172,'stripe_integration_type',0,'s:13:\"embedded_form\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(173,'paytm_enabled',0,'s:1:\"0\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(174,'paytm_test_mode',0,'s:1:\"0\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(175,'paytm_merchant_id',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(176,'paytm_merchant_key',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(177,'razorpay_enabled',0,'s:1:\"0\";','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(178,'razorpay_key_id',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(179,'razorpay_key_secret',0,'N;','2026-08-22 08:39:23','2026-08-22 08:39:23'),
(180,'instamojo_enabled',0,'s:1:\"0\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(181,'instamojo_test_mode',0,'s:1:\"0\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(182,'instamojo_api_key',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(183,'instamojo_auth_token',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(184,'paystack_enabled',0,'s:1:\"0\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(185,'paystack_test_mode',0,'s:1:\"0\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(186,'paystack_public_key',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(187,'paystack_secret_key',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(188,'authorizenet_enabled',0,'s:1:\"0\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(189,'authorizenet_test_mode',0,'s:1:\"0\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(190,'authorizenet_merchant_login_id',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(191,'authorizenet_merchant_transaction_key',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(192,'mercadopago_enabled',0,'s:1:\"0\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(193,'mercadopago_test_mode',0,'s:1:\"0\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(194,'mercadopago_supported_currency',0,'s:3:\"UYU\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(195,'mercadopago_public_key',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(196,'mercadopago_access_token',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(197,'flutterwave_enabled',0,'s:1:\"0\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(198,'flutterwave_test_mode',0,'s:1:\"0\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(199,'flutterwave_public_key',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(200,'flutterwave_secret_key',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(201,'flutterwave_encryption_key',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(202,'iyzico_enabled',0,'s:1:\"0\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(203,'iyzico_test_mode',0,'s:1:\"0\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(204,'iyzico_api_key',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(205,'iyzico_api_secret',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(206,'payfast_enabled',0,'s:1:\"0\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(207,'payfast_test_mode',0,'s:1:\"0\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(208,'payfast_merchant_id',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(209,'payfast_merchant_key',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(210,'payfast_passphrase',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(211,'bkash_enabled',0,'s:1:\"0\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(212,'bkash_test_mode',0,'s:1:\"0\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(213,'bkash_app_key',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(214,'bkash_app_secret',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(215,'bkash_username',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(216,'bkash_password',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(217,'nagad_enabled',0,'s:1:\"0\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(218,'nagad_test_mode',0,'s:1:\"0\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(219,'nagad_merchant_id',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(220,'nagad_merchant_number',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(221,'nagad_public_key',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(222,'nagad_private_key',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(223,'sslcommerz_enabled',0,'s:1:\"0\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(224,'sslcommerz_test_mode',0,'s:1:\"0\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(225,'sslcommerz_store_id',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(226,'sslcommerz_store_password',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(227,'sslcommerz_is_localhost',0,'s:1:\"0\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(228,'cod_enabled',0,'s:1:\"1\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(229,'bank_transfer_enabled',0,'s:1:\"0\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(230,'check_payment_enabled',0,'s:1:\"0\";','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(231,'sms_order_statuses',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(232,'email_order_statuses',0,'N;','2026-08-22 08:39:24','2026-08-22 08:39:24'),
(233,'tab',0,'s:13:\"free_shipping\";','2026-08-22 08:39:24','2026-08-22 08:41:58'),
(234,'storefront_welcome_text',1,NULL,'2026-09-10 18:40:42','2026-09-10 18:40:42'),
(235,'storefront_trust_section_enabled',0,'i:1;','2026-09-10 18:40:42','2026-09-10 18:40:42'),
(236,'storefront_flash_deal_banner_enabled',0,'i:0;','2026-09-10 18:40:42','2026-09-10 18:40:42'),
(237,'storefront_farm_to_freezer_enabled',0,'i:0;','2026-09-10 18:40:42','2026-09-10 18:40:42'),
(238,'storefront_combos_section_enabled',0,'i:1;','2026-09-10 18:40:42','2026-09-10 18:40:42'),
(239,'storefront_comparison_section_enabled',0,'i:1;','2026-09-10 18:40:42','2026-09-10 18:40:42'),
(240,'storefront_testimonials_section_enabled',0,'i:1;','2026-09-10 18:40:42','2026-09-10 18:40:42'),
(241,'storefront_social_community_enabled',0,'i:1;','2026-09-10 18:40:42','2026-09-10 18:40:42'),
(242,'storefront_address',1,'s:127:\"Mailee Frozen Foods Hub\nSevoke Road, Siliguri, West Bengal 734001\nDelivery Zones: Siliguri, Darjeeling, Jalpaiguri, Cooch Behar\";','2026-09-10 18:40:42','2026-09-10 20:08:33'),
(243,'storefront_header_logo',1,'i:57;','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(244,'storefront_mail_logo',1,'i:57;','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(245,'storefront_slider_banner_1_file_id',1,'i:67;','2026-09-10 20:08:33','2026-09-10 20:08:34'),
(246,'storefront_slider_banner_2_file_id',1,'i:68;','2026-09-10 20:08:33','2026-09-10 20:08:34'),
(247,'storefront_two_column_banners_1_file_id',1,'i:70;','2026-09-10 20:08:33','2026-09-10 20:08:34'),
(248,'storefront_two_column_banners_2_file_id',1,'i:71;','2026-09-10 20:08:33','2026-09-10 20:08:34'),
(249,'storefront_one_column_banner_file_id',1,'i:69;','2026-09-10 20:08:33','2026-09-10 20:08:34'),
(250,'storefront_featured_categories_section_title',1,NULL,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(251,'storefront_featured_categories_section_subtitle',1,NULL,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(252,'storefront_product_tabs_2_section_title',1,NULL,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(253,'storefront_product_tabs_2_section_tab_2_title',1,NULL,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(254,'storefront_favicon',0,'i:57;','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(255,'storefront_theme_color',0,'s:12:\"custom_color\";','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(256,'storefront_custom_theme_color',0,'s:7:\"#1b4d3e\";','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(257,'storefront_mail_theme_color',0,'s:12:\"custom_color\";','2026-09-10 20:08:33','2026-09-10 20:08:33'),
(258,'storefront_custom_mail_theme_color',0,'s:7:\"#1b4d3e\";','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(259,'storefront_category_menu',0,'i:8;','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(260,'storefront_slider_banner_1_call_to_action_url',0,'s:41:\"/products/mailee-vip-club-membership-pass\";','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(261,'storefront_slider_banner_1_open_in_new_window',0,'i:0;','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(262,'storefront_slider_banner_2_call_to_action_url',0,'s:58:\"/products/authentic-himalayan-steamed-chicken-momos-24-pcs\";','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(263,'storefront_slider_banner_2_open_in_new_window',0,'i:0;','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(264,'storefront_featured_categories',0,'a:7:{i:0;i:41;i:1;i:42;i:2;i:43;i:3;i:44;i:4;i:45;i:5;i:46;i:6;i:47;}','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(265,'storefront_product_tabs_1_section_tab_2_category_id',0,'i:41;','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(266,'storefront_product_tabs_1_section_tab_2_products_limit',0,'i:10;','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(267,'storefront_two_column_banners_enabled',0,'i:0;','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(268,'storefront_two_column_banners_1_call_to_action_url',0,'s:53:\"/products/flaky-himalayan-malabar-paratha-10-pcs-pack\";','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(269,'storefront_two_column_banners_1_open_in_new_window',0,'i:0;','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(270,'storefront_two_column_banners_2_call_to_action_url',0,'s:55:\"/products/crispy-peri-peri-french-fries-1-kg-jumbo-pack\";','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(271,'storefront_two_column_banners_2_open_in_new_window',0,'i:0;','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(272,'storefront_product_grid_section_tab_1_products_limit',0,'i:10;','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(273,'storefront_product_tabs_2_section_tab_1_category_id',0,'i:43;','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(274,'storefront_product_tabs_2_section_tab_1_products_limit',0,'i:10;','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(275,'storefront_product_tabs_2_section_tab_2_product_type',0,'s:17:\"category_products\";','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(276,'storefront_product_tabs_2_section_tab_2_category_id',0,'i:46;','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(277,'storefront_product_tabs_2_section_tab_2_products_limit',0,'i:10;','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(278,'storefront_one_column_banner_enabled',0,'i:0;','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(279,'storefront_one_column_banner_call_to_action_url',0,'s:41:\"/products/mailee-vip-club-membership-pass\";','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(280,'storefront_one_column_banner_open_in_new_window',0,'i:0;','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(281,'storefront_flash_sale_and_vertical_products_section_enabled',0,'i:0;','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(282,'storefront_three_column_banners_section_enabled',0,'i:0;','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(283,'storefront_three_column_full_width_banners_enabled',0,'i:0;','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(284,'storefront_featured_categories_section_category_1_product_type',0,'s:17:\"category_products\";','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(285,'storefront_featured_categories_section_category_2_product_type',0,'s:17:\"category_products\";','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(286,'storefront_featured_categories_section_category_3_product_type',0,'s:17:\"category_products\";','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(287,'storefront_featured_categories_section_category_4_product_type',0,'s:17:\"category_products\";','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(288,'storefront_featured_categories_section_category_5_product_type',0,'s:17:\"category_products\";','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(289,'storefront_featured_categories_section_category_5_category_id',0,'i:45;','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(290,'storefront_featured_categories_section_category_6_product_type',0,'s:17:\"category_products\";','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(291,'storefront_featured_categories_section_category_6_category_id',0,'i:46;','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(292,'storefront_featured_categories_section_category_7_product_type',0,'s:17:\"category_products\";','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(293,'storefront_featured_categories_section_category_7_category_id',0,'i:47;','2026-09-10 20:08:34','2026-09-10 20:08:34'),
(294,'storefront_product_tabs_1_section_tab_2_products',0,'a:6:{i:0;i:79;i:1;i:80;i:2;i:81;i:3;i:82;i:4;i:83;i:5;i:84;}','2026-09-11 06:04:29','2026-09-11 06:04:29'),
(295,'storefront_product_grid_section_tab_1_products',0,'a:16:{i:0;i:69;i:1;i:70;i:2;i:71;i:3;i:72;i:4;i:73;i:5;i:74;i:6;i:75;i:7;i:76;i:8;i:77;i:9;i:78;i:10;i:79;i:11;i:80;i:12;i:81;i:13;i:82;i:14;i:83;i:15;i:84;}','2026-09-11 06:04:29','2026-09-11 06:04:29');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `slider_slide_translations`
--

DROP TABLE IF EXISTS `slider_slide_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `slider_slide_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slider_slide_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `file_id` int(10) unsigned DEFAULT NULL,
  `caption_1` varchar(191) DEFAULT NULL,
  `caption_2` varchar(191) DEFAULT NULL,
  `call_to_action_text` varchar(191) DEFAULT NULL,
  `direction` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slider_slide_translations_slider_slide_id_locale_unique` (`slider_slide_id`,`locale`),
  CONSTRAINT `slider_slide_translations_slider_slide_id_foreign` FOREIGN KEY (`slider_slide_id`) REFERENCES `slider_slides` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slider_slide_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `slider_slide_translations` WRITE;
/*!40000 ALTER TABLE `slider_slide_translations` DISABLE KEYS */;
INSERT INTO `slider_slide_translations` VALUES
(8,8,'en',58,'','','','left'),
(9,9,'en',103,'Himalayan Street Feast','Authentic Momos, Parathas & Kebabs • Flat 30% Off','Shop All Deals','left');
/*!40000 ALTER TABLE `slider_slide_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `slider_slides`
--

DROP TABLE IF EXISTS `slider_slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `slider_slides` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slider_id` int(10) unsigned NOT NULL,
  `options` text DEFAULT NULL,
  `call_to_action_url` varchar(191) DEFAULT NULL,
  `open_in_new_window` tinyint(1) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slider_slides_slider_id_foreign` (`slider_id`),
  CONSTRAINT `slider_slides_slider_id_foreign` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slider_slides`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `slider_slides` WRITE;
/*!40000 ALTER TABLE `slider_slides` DISABLE KEYS */;
INSERT INTO `slider_slides` VALUES
(8,5,NULL,'/products',0,1,'2026-09-10 20:08:33','2026-09-10 20:08:33'),
(9,5,NULL,'/products/mailee-vip-club-membership-pass',0,2,'2026-09-10 20:08:33','2026-09-10 20:08:33');
/*!40000 ALTER TABLE `slider_slides` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `slider_translations`
--

DROP TABLE IF EXISTS `slider_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `slider_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slider_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slider_translations_slider_id_locale_unique` (`slider_id`,`locale`),
  CONSTRAINT `slider_translations_slider_id_foreign` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slider_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `slider_translations` WRITE;
/*!40000 ALTER TABLE `slider_translations` DISABLE KEYS */;
INSERT INTO `slider_translations` VALUES
(1,1,'en','Main Home Slider'),
(2,2,'en','Mailee Home Hero Banner'),
(3,3,'en','Mailee Home Hero Banner'),
(4,4,'en','Mailee Home Hero Banner'),
(5,5,'en','Mailee Home Hero Banner');
/*!40000 ALTER TABLE `slider_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sliders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `speed` int(11) DEFAULT NULL,
  `autoplay` tinyint(1) DEFAULT NULL,
  `autoplay_speed` int(11) DEFAULT NULL,
  `fade` tinyint(1) NOT NULL DEFAULT 0,
  `dots` tinyint(1) DEFAULT NULL,
  `arrows` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` VALUES
(5,5000,1,4000,1,1,1,'2026-09-10 20:08:33','2026-09-10 20:08:33');
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `tag_translations`
--

DROP TABLE IF EXISTS `tag_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_translations_tag_id_locale_unique` (`tag_id`,`locale`),
  CONSTRAINT `tag_translations_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `tag_translations` WRITE;
/*!40000 ALTER TABLE `tag_translations` DISABLE KEYS */;
INSERT INTO `tag_translations` VALUES
(1,1,'en','Featured'),
(2,2,'en','Best Seller'),
(3,3,'en','New Arrival'),
(4,4,'en','Trending'),
(5,5,'en','Top Rated'),
(6,6,'en','Wireless'),
(7,7,'en','Smart'),
(8,8,'en','Premium');
/*!40000 ALTER TABLE `tag_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES
(1,'featured','2026-08-22 08:36:12','2026-08-22 08:36:12'),
(2,'best-seller','2026-08-22 08:36:12','2026-08-22 08:36:12'),
(3,'new-arrival','2026-08-22 08:36:12','2026-08-22 08:36:12'),
(4,'trending','2026-08-22 08:36:12','2026-08-22 08:36:12'),
(5,'top-rated','2026-08-22 08:36:12','2026-08-22 08:36:12'),
(6,'wireless','2026-08-22 08:36:12','2026-08-22 08:36:12'),
(7,'smart','2026-08-22 08:36:12','2026-08-22 08:36:12'),
(8,'premium','2026-08-22 08:36:12','2026-08-22 08:36:12');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `tax_class_translations`
--

DROP TABLE IF EXISTS `tax_class_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_class_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `label` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_class_translations_tax_class_id_locale_unique` (`tax_class_id`,`locale`),
  CONSTRAINT `tax_class_translations_tax_class_id_foreign` FOREIGN KEY (`tax_class_id`) REFERENCES `tax_classes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_class_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `tax_class_translations` WRITE;
/*!40000 ALTER TABLE `tax_class_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_class_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `tax_classes`
--

DROP TABLE IF EXISTS `tax_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `based_on` varchar(191) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_classes`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `tax_classes` WRITE;
/*!40000 ALTER TABLE `tax_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_classes` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `tax_rate_translations`
--

DROP TABLE IF EXISTS `tax_rate_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_rate_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax_rate_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_rate_translations_tax_rate_id_locale_unique` (`tax_rate_id`,`locale`),
  CONSTRAINT `tax_rate_translations_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rate_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `tax_rate_translations` WRITE;
/*!40000 ALTER TABLE `tax_rate_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_rate_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(10) unsigned NOT NULL,
  `country` varchar(191) NOT NULL,
  `state` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `zip` varchar(191) NOT NULL,
  `rate` decimal(8,4) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tax_rates_tax_class_id_index` (`tax_class_id`),
  CONSTRAINT `tax_rates_tax_class_id_foreign` FOREIGN KEY (`tax_class_id`) REFERENCES `tax_classes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rates`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `throttle`
--

DROP TABLE IF EXISTS `throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `ip` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `throttle_user_id_foreign` (`user_id`),
  CONSTRAINT `throttle_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `throttle`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `throttle` WRITE;
/*!40000 ALTER TABLE `throttle` DISABLE KEYS */;
/*!40000 ALTER TABLE `throttle` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `transaction_id` varchar(191) NOT NULL,
  `payment_method` varchar(191) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transactions_order_id_unique` (`order_id`),
  CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `translation_translations`
--

DROP TABLE IF EXISTS `translation_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `translation_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `translation_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translation_translations_translation_id_locale_unique` (`translation_id`,`locale`),
  CONSTRAINT `translation_translations_translation_id_foreign` FOREIGN KEY (`translation_id`) REFERENCES `translations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translation_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `translation_translations` WRITE;
/*!40000 ALTER TABLE `translation_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translation_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `translations_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `up_sell_products`
--

DROP TABLE IF EXISTS `up_sell_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_sell_products` (
  `product_id` int(10) unsigned NOT NULL,
  `up_sell_product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`,`up_sell_product_id`),
  KEY `up_sell_products_up_sell_product_id_foreign` (`up_sell_product_id`),
  CONSTRAINT `up_sell_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `up_sell_products_up_sell_product_id_foreign` FOREIGN KEY (`up_sell_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_sell_products`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `up_sell_products` WRITE;
/*!40000 ALTER TABLE `up_sell_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `up_sell_products` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `updater_scripts`
--

DROP TABLE IF EXISTS `updater_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `updater_scripts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `script` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updater_scripts`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `updater_scripts` WRITE;
/*!40000 ALTER TABLE `updater_scripts` DISABLE KEYS */;
INSERT INTO `updater_scripts` VALUES
(1,'V2_0_0');
/*!40000 ALTER TABLE `updater_scripts` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_role_id_foreign` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES
(1,1,'2026-08-22 01:57:49','2026-08-22 01:57:49');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `permissions` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Ramanuj','Dey','rds2197@gmail.com','8250622813','$2y$10$nQBHLSdKL3Jm1x9z908pzur5mTi1QdArW4ihVjs7icrN8QmG747Ve',NULL,'2026-08-22 13:28:35','2026-08-22 01:57:46','2026-08-22 07:58:35');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `variation_translations`
--

DROP TABLE IF EXISTS `variation_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `variation_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `variation_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `variation_translations_variation_id_locale_unique` (`variation_id`,`locale`),
  CONSTRAINT `variation_translations_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variation_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `variation_translations` WRITE;
/*!40000 ALTER TABLE `variation_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `variation_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `variation_value_translations`
--

DROP TABLE IF EXISTS `variation_value_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `variation_value_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `variation_value_id` int(10) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `label` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `variation_value_translations_variation_value_id_locale_unique` (`variation_value_id`,`locale`),
  CONSTRAINT `variation_value_translations_variation_value_id_foreign` FOREIGN KEY (`variation_value_id`) REFERENCES `variation_values` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variation_value_translations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `variation_value_translations` WRITE;
/*!40000 ALTER TABLE `variation_value_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `variation_value_translations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `variation_values`
--

DROP TABLE IF EXISTS `variation_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `variation_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(191) NOT NULL,
  `variation_id` int(10) unsigned NOT NULL,
  `value` varchar(191) DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `variation_values_uid_unique` (`uid`),
  KEY `variation_values_variation_id_index` (`variation_id`),
  CONSTRAINT `variation_values_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variation_values`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `variation_values` WRITE;
/*!40000 ALTER TABLE `variation_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `variation_values` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `variations`
--

DROP TABLE IF EXISTS `variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `variations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `is_global` tinyint(1) NOT NULL DEFAULT 1,
  `position` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `variations_uid_unique` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `variations` WRITE;
/*!40000 ALTER TABLE `variations` DISABLE KEYS */;
/*!40000 ALTER TABLE `variations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `wish_lists`
--

DROP TABLE IF EXISTS `wish_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wish_lists` (
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`product_id`),
  KEY `wish_lists_product_id_foreign` (`product_id`),
  CONSTRAINT `wish_lists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wish_lists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wish_lists`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `wish_lists` WRITE;
/*!40000 ALTER TABLE `wish_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `wish_lists` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-09-13  1:54:34
