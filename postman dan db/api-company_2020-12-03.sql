# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.26)
# Database: api-company
# Generation Time: 2020-12-03 10:24:39 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table companies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `companies`;

CREATE TABLE `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;

INSERT INTO `companies` (`id`, `name`, `email`, `website`, `logo`, `created_at`, `updated_at`)
VALUES
	(3,'PT KERJA SAMA','kerjasama@gmail.com',NULL,'public/images/companies/9HEWDYszHGTL7IakIvIAlyitOBGgFZVBCLpo5riN.jpeg','2020-12-03 04:24:19','2020-12-03 04:24:19'),
	(4,'PT KERJA SAMA 2','kerjasama@gmail.com',NULL,'public/images/companies/7gwOrIt7clGg2uuy9WOW0pLFkjPdxluPl0K94vqn.jpeg','2020-12-03 04:36:01','2020-12-03 04:36:01'),
	(5,'PT KERJA SAMA 23','kerjasama2@gmail.com',NULL,'public/images/companies/0oxgJgAB2XRqq3Is7IIq3LzBz59FrBuRQZzKVEZM.jpeg','2020-12-03 04:41:26','2020-12-03 04:41:26');

/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table employees
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_company` int(10) unsigned NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_id_company_foreign` (`id_company`),
  CONSTRAINT `employees_id_company_foreign` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;

INSERT INTO `employees` (`id`, `first_name`, `last_name`, `id_company`, `email`, `phone`, `created_at`, `updated_at`)
VALUES
	(2,'seli','susanti',3,'susantiseli03@gmail.com','0877267367267','2020-12-03 10:21:25','2020-12-03 10:21:25');

/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),
	(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),
	(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),
	(6,'2016_06_01_000004_create_oauth_clients_table',1),
	(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),
	(8,'2020_12_03_020450_create_companies_table',2),
	(10,'2020_12_03_023548_create_employees_table',3),
	(11,'2020_12_03_023827_add_foreign_id_company_table',3),
	(12,'2020_12_03_073022_create_jobs_table',4),
	(13,'2020_12_03_075930_create_failed_jobs_table',5);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`)
VALUES
	('045073b35ee8e254992da43729a3ed3492823ddc90fcee22c9a1f96ced187f7fddcc33c23ea13454',31,1,'nApp','[]',0,'2020-12-03 09:46:39','2020-12-03 09:46:39','2021-12-03 09:46:39'),
	('096b50b8d73f882a6d0430a082abf0d11091d9a4ae57f58e5c0d5f4f2b9013c2787d2f9b4c0936ec',17,1,'nApp','[]',0,'2020-12-03 08:14:17','2020-12-03 08:14:17','2021-12-03 08:14:17'),
	('170ba071291a6c35e696bb713350a6ed81e92c5dc5684002dddd434c8120134dc02f8c26202f4d39',21,1,'nApp','[]',0,'2020-12-03 08:53:24','2020-12-03 08:53:24','2021-12-03 08:53:24'),
	('37ba668df384240bfbb7ce3ac9ee5fafac507c50ae0d9a70ef0cff82c80ce9778a7bc09427af899c',24,1,'nApp','[]',0,'2020-12-03 08:54:30','2020-12-03 08:54:30','2021-12-03 08:54:30'),
	('3a9d9e15c9266a717f061b9c31184e2751c7fa4404fce7614aef214acddba1575cf0e03fb9beadf7',19,1,'nApp','[]',0,'2020-12-03 08:17:09','2020-12-03 08:17:09','2021-12-03 08:17:09'),
	('3b8225fec8fccef9284f3c9aff6cd9b50069fc0e3e8d0e7c3318729b71e2fd2348c26b6849ebc37d',1,1,'nApp','[]',0,'2020-11-23 03:50:32','2020-11-23 03:50:32','2021-11-23 03:50:32'),
	('481d42f97041e8cee8852561cfe750a6502f9b162d1bec8652ac3db181f67f87554a062b1f73d85f',4,1,'nApp','[]',0,'2020-12-03 06:40:19','2020-12-03 06:40:19','2021-12-03 06:40:19'),
	('52aecd41ca82f0e3bbea788ded7a856594435c7c728adc54aebfe57d28bccdf62816054e26599029',12,1,'nApp','[]',0,'2020-12-03 07:56:00','2020-12-03 07:56:00','2021-12-03 07:56:00'),
	('548a002cfc911723f3c5821efd7336593ca2663ea3a90029d92501c038a2485948116704ba5d8ed8',3,1,'nApp','[]',0,'2020-12-03 05:28:38','2020-12-03 05:28:38','2021-12-03 05:28:38'),
	('571d30ebc85137cc95d6c62fe997bc9af620347c840bc80b50cd793dd86eb8c0840fba368fcf9b2b',6,1,'nApp','[]',0,'2020-12-03 06:43:26','2020-12-03 06:43:26','2021-12-03 06:43:26'),
	('5f33064d6a4af60143dfd83ce78115f4be9028c59b59705591130090cfed6800d769283914e4c9be',20,1,'nApp','[]',0,'2020-12-03 08:34:57','2020-12-03 08:34:57','2021-12-03 08:34:57'),
	('60443b225a27270659ae4e563afc6f7826b63162e31d54b82947bddbb322fff83824b410e9f0d938',29,1,'nApp','[]',0,'2020-12-03 09:24:07','2020-12-03 09:24:07','2021-12-03 09:24:07'),
	('65b97f3e124e8bc577d8f58d0f311b79d577490fa52133a40c4b478cabfd6afd2badfdae2f3b1204',30,1,'nApp','[]',0,'2020-12-03 09:42:13','2020-12-03 09:42:13','2021-12-03 09:42:13'),
	('67b1de71d292d0fe55faeadfd8333da1c0cec5879d0e4df2d199bee94b9e2b7eb4fd2d96bde32b47',26,1,'nApp','[]',0,'2020-12-03 09:01:17','2020-12-03 09:01:17','2021-12-03 09:01:17'),
	('6a9c6a48e96a93653d8b9bf93cc46d928ec95352b8342217640fbc222c9d00e09c5b616be27306b9',27,1,'nApp','[]',0,'2020-12-03 09:19:00','2020-12-03 09:19:00','2021-12-03 09:19:00'),
	('70799c0ce2e16b6ad1db3a94bc0f677b2a94c518c70b51b405ec5ae7b88af44312863476243db69d',8,1,'nApp','[]',0,'2020-12-03 07:40:26','2020-12-03 07:40:26','2021-12-03 07:40:26'),
	('7a5f6b12bb862f7d122bdb72f93706e877657b1267548e07e30813a70d0148fe9c26c834e0d0be69',10,1,'nApp','[]',0,'2020-12-03 07:55:31','2020-12-03 07:55:31','2021-12-03 07:55:31'),
	('7ae1e97206c0fa5c974d9745c092ed5a84710784d652195cbcb49708877509337ca12ab244d747ea',14,1,'nApp','[]',0,'2020-12-03 08:00:50','2020-12-03 08:00:50','2021-12-03 08:00:50'),
	('7ec09e87dbb470ca8fb68951a405206f813724f18025e79e8476b541b9988dfd7ae907fea97eafbb',13,1,'nApp','[]',0,'2020-12-03 07:57:26','2020-12-03 07:57:26','2021-12-03 07:57:26'),
	('877171137b4091cdc65214c0cc4d66d381e4eac5bb30db80654e0b74a76aea130bbaf905fcb6339a',15,1,'nApp','[]',0,'2020-12-03 08:08:51','2020-12-03 08:08:51','2021-12-03 08:08:51'),
	('8850d1a4c72f8bebd033e3a1021b48e8d1e5103a224b677b7d29eef5677ad5029ae5a5f36e93ef4d',32,1,'nApp','[]',0,'2020-12-03 09:57:49','2020-12-03 09:57:49','2021-12-03 09:57:49'),
	('95cc4910499c5586824d7d5e3c86dfdeed8f1995a81988ca19de1374513149e16be3c2870fa81d51',7,1,'nApp','[]',0,'2020-12-03 07:14:29','2020-12-03 07:14:29','2021-12-03 07:14:29'),
	('b1f295272984200d52901c7d5f6c551d0286e3d8d5c5ffeb3c9c6aec0ef226bfea3e25385d0517cc',1,1,'nApp','[]',0,'2020-11-23 03:52:01','2020-11-23 03:52:01','2021-11-23 03:52:01'),
	('b383c29a519dc297e636506e9ee4bbfc57210dcc1cc0b2ebe674a6f82cecc0011b50cb6a803ed233',25,1,'nApp','[]',0,'2020-12-03 08:57:21','2020-12-03 08:57:21','2021-12-03 08:57:21'),
	('c02e3b628352e0a64152a8cfb73e7a46ddab22c3f8fa146d7cecd360f52b19e4e3ef87bb1c336a61',28,1,'nApp','[]',1,'2020-12-03 09:23:02','2020-12-03 09:23:02','2021-12-03 09:23:02'),
	('d3302ccbb924b3c30b3de63abb7ff2c3aef6bbaacf52e2168e2406bbe9d7e285d768b9ee11f73c44',2,1,'nApp','[]',1,'2020-12-03 02:54:55','2020-12-03 02:54:55','2021-12-03 02:54:55'),
	('d8721fc626e8e30ea8a310fb2f2418a4bc492b05eae9c5ec6804377cd3211ee27b336b158e275451',22,1,'nApp','[]',0,'2020-12-03 08:54:03','2020-12-03 08:54:03','2021-12-03 08:54:03'),
	('e3cebdc7528a73aadcec359432ae26c751632788f468cdb589c63e2ea940c062c57da957fb142dd5',2,1,'nApp','[]',0,'2020-12-03 02:49:19','2020-12-03 02:49:19','2021-12-03 02:49:19'),
	('e5d09317393fd6cf368432ba78ac33aa26a77d46c0e30afe541a1672b8a7d7506ebdfa91a1f5c73c',2,1,'nApp','[]',0,'2020-12-03 05:53:43','2020-12-03 05:53:43','2021-12-03 05:53:43');

/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_auth_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table oauth_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'Laravel Personal Access Client','TU3wX2fWJTemAwgWdKuEgfjKNHxiPMfrIicjrYwJ','http://localhost',1,0,0,'2020-11-23 03:46:41','2020-11-23 03:46:41'),
	(2,NULL,'Laravel Password Grant Client','0BvwoZBrlEkGTDIkaIAbKp65IrIRluSvIBLLHbdZ','http://localhost',0,1,0,'2020-11-23 03:46:41','2020-11-23 03:46:41');

/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_personal_access_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`)
VALUES
	(1,1,'2020-11-23 03:46:41','2020-11-23 03:46:41');

/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_refresh_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(32,'seli','susantiseli03@gmail.com','2020-12-03 09:53:28','$2y$10$5YP9tgQxaAmjGeBmZSZJ..mTe3FrLFBaG3KgI2DKeilJMsx0JVJ7G',NULL,'2020-12-03 09:53:28','2020-12-03 09:53:28');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
