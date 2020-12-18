-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: 192.168.10.15    Database: toll_management
-- ------------------------------------------------------
-- Server version	5.5.5-10.3.13-MariaDB-1:10.3.13+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `established_in` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trade_license` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Prochito ITS','+88 01752364189','admin@admin.com','Dhaka, Bangladesh',NULL,NULL,NULL,NULL,1,'2019-06-25 06:41:36','2019-06-25 07:22:24'),(4,'Green Line Paribahan','01752457896','ewrui@kjdhsf.com','Dhaka,BD',NULL,NULL,NULL,NULL,1,'2019-06-25 10:25:13','2019-06-27 08:14:09'),(7,'Hanif Paribahan','01623457854','hanif@gmail.com','Gabtoli, Dhaka',NULL,NULL,NULL,NULL,1,'2019-06-27 10:49:16','2019-06-27 10:49:16'),(8,'Eagle Paribahan','01745669988','eagle.paribahan@gmail.com','Dhaka',NULL,NULL,NULL,NULL,1,'2019-07-01 05:54:52','2019-07-01 05:54:52');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deposit_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `deposit_type` tinyint(4) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicle_id` (`vehicle_id`),
  CONSTRAINT `deposits_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposits`
--

LOCK TABLES `deposits` WRITE;
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
INSERT INTO `deposits` VALUES (1,'90AR',2,1,1,900,'2019-06-25 11:41:50','2019-06-26 12:13:02'),(2,'40ATR',4,1,0,500,'2019-06-25 11:56:32','2019-06-25 11:56:32'),(3,'90AR90',4,1,1,1000,'2019-06-25 12:10:07','2019-06-25 12:10:07'),(5,'908AS',2,1,1,800,'2019-06-27 05:25:38','2019-06-27 05:25:38'),(6,'dsfsdf',8,1,0,500,'2019-06-27 08:17:20','2019-06-27 08:17:50'),(8,'as',2,1,0,300,'2019-06-27 08:33:30','2019-06-27 11:03:47'),(9,'908AS56',8,1,1,600,'2019-07-02 07:29:53','2019-07-02 07:29:53');
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_06_25_045547_create_companies_table',2),(4,'2019_06_25_075659_create_vehicles_table',3),(5,'2019_06_25_110621_create_deposits_table',4),(6,'2019_06_26_043057_create_vehicle_types_table',5),(7,'2019_06_26_071858_create_toll__plazas_table',6),(8,'2019_06_26_080018_create_toll_type_table',7),(9,'2019_06_26_121439_create_tolls_table',8),(10,'2016_06_01_000001_create_oauth_auth_codes_table',9),(11,'2016_06_01_000002_create_oauth_access_tokens_table',9),(12,'2016_06_01_000003_create_oauth_refresh_tokens_table',9),(13,'2016_06_01_000004_create_oauth_clients_table',9),(14,'2016_06_01_000005_create_oauth_personal_access_clients_table',9);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('01f116ab198e33cc01ebf1e03dc3b26d2cb38ad5080a2bb751613c153d0310f3116d8680b9096f4e',1,2,NULL,'[]',0,'2019-07-01 08:18:53','2019-07-01 08:18:53','2020-07-01 08:18:53'),('0422395b85abf433ea6c28b847e5cc0dae51c79d1acf4aff00c57e5fad25180ed523c76f99efc465',1,2,NULL,'[]',0,'2019-07-01 10:26:07','2019-07-01 10:26:07','2020-07-01 10:26:07'),('1a134d5167e7dd6b615f6e125ef314826b2581f64351c0406ff050eb776e21cfe6acdc3ca682d056',1,2,NULL,'[]',0,'2019-07-01 08:26:48','2019-07-01 08:26:48','2020-07-01 08:26:48'),('234de6e3c8bbfe9f304bc80571c34c768abf2b1f2ba450d56133fecebc463ae0feedb9573e83ab0b',1,2,NULL,'[]',0,'2019-07-01 08:20:36','2019-07-01 08:20:36','2020-07-01 08:20:36'),('2732bbb22651c8bdc74e2a7fa668d0f1b29a7fd449ded1af5e50381fd08d0c36d62ff2ac166fccce',1,2,NULL,'[]',0,'2019-07-01 10:05:15','2019-07-01 10:05:15','2020-07-01 10:05:15'),('28f8d68209fe0d0bd2318979c56e3de9dd8aa4a455d9ce7e93df5bff112f608cf975141f12c7b8f1',1,2,NULL,'[]',0,'2019-07-04 05:14:09','2019-07-04 05:14:09','2020-07-04 05:14:09'),('293cb2ee1c1e4c922acd63bd787fc9e483c9401852d2bcf371fac2cc958822e5df1c0ef7ec228052',1,2,NULL,'[]',0,'2019-07-01 08:20:52','2019-07-01 08:20:52','2020-07-01 08:20:52'),('2ff169b9a194a633f7b3591b651c986b17232f621a03e3d763c8f6e4abcb1318905fd9a5cdd35f55',1,2,NULL,'[]',0,'2019-07-04 05:13:14','2019-07-04 05:13:14','2020-07-04 05:13:14'),('352298e01d012e2ba7c2d4a827c76b8f0fdce8df36840d3fb0c921239d63e8226bf0f95fe08f51ee',1,2,NULL,'[]',0,'2019-07-07 07:19:57','2019-07-07 07:19:57','2020-07-07 07:19:57'),('3631878770b58034e81a37c2ad74d01342896137895f69ced2047f6a70c319e222d24c7712c4f9aa',1,2,NULL,'[]',0,'2019-07-01 10:07:16','2019-07-01 10:07:16','2020-07-01 10:07:16'),('36b04e0263e21fc364b86c614f0f8c68c55d60d192dfeed66e286e95a7d873e00ac0a101df4b31e3',1,2,NULL,'[]',0,'2019-07-01 08:26:48','2019-07-01 08:26:48','2020-07-01 08:26:48'),('3c8bea40a9a7335fd1b321353244f91e3b14cd728151a68308c05bd8a5669bb5648a6d270d38ec4d',1,1,'MyApp','[]',0,'2019-07-01 06:58:16','2019-07-01 06:58:16','2020-07-01 06:58:16'),('3e14012b708d287b9531a4e6cc2063870cfdc667e79091eb100581df43132f5978ea9ee1c7120679',1,2,NULL,'[]',0,'2019-07-01 08:18:46','2019-07-01 08:18:46','2020-07-01 08:18:46'),('4040606b10b922ecb5791bb3334df8dcc29be239f69c0fd98ec2090590e6205a647ec1d02313e519',1,2,NULL,'[]',0,'2019-07-01 10:07:27','2019-07-01 10:07:27','2020-07-01 10:07:27'),('42a0be6752d3222bb26a1dcb2cf8036cf405bcc3b5ecc30d8276e7007d75e32c937c9e2b8abdc52b',1,2,NULL,'[]',0,'2019-07-01 10:13:54','2019-07-01 10:13:54','2020-07-01 10:13:54'),('489bce2cdf875169ed18a08d71334f4acd26cdae0f5b2e3d08e1f5ab6a6da92ef8dbdce9251ca9ed',1,2,NULL,'[]',0,'2019-07-01 10:25:07','2019-07-01 10:25:07','2020-07-01 10:25:07'),('5072caddbee74374e1fd3d6d7158b5122bd358660b9459af9885929a90ab6cc75b868a34eda9061d',1,2,NULL,'[]',0,'2019-07-01 10:31:56','2019-07-01 10:31:56','2020-07-01 10:31:56'),('5ba1041d8ac63c587b7a46a27efdd7711d4bc22ba530d0dbf06ab0574b5cd7ce3b80ba1234e78396',1,2,NULL,'[]',0,'2019-07-01 08:26:48','2019-07-01 08:26:48','2020-07-01 08:26:48'),('5e159c26f765afaec2ce5b7b16e7c9278ecd70c32cbb756992f8a82bc147bb6aff3c3c14ff165ab7',1,2,NULL,'[]',0,'2019-07-01 08:18:33','2019-07-01 08:18:33','2020-07-01 08:18:33'),('5f2db839182520ef941d96ce8d88fcf9d52e2c77e3efbdc336bea9c70f521e0d0225c73abc093567',1,2,NULL,'[]',0,'2019-07-01 11:48:29','2019-07-01 11:48:29','2020-07-01 11:48:29'),('6616d87852a80f939a9160ca0616755e38ac79d29f27d2d0cea247fe4c44d4f2bc4e505716edcc9d',1,2,NULL,'[]',0,'2019-07-04 04:36:07','2019-07-04 04:36:07','2020-07-04 04:36:07'),('6d694eeb220e5bf70d629d2c0df454e2b797ba4ab65b01c3bdb423c3334a41b40ede451932a33505',1,2,NULL,'[]',0,'2019-07-01 10:30:10','2019-07-01 10:30:10','2020-07-01 10:30:10'),('6d7ed827349d1ccf74d388013278f953dece6e50c382e0172db66a43af0e8a4ee89e77105a8c703b',1,2,NULL,'[]',0,'2019-07-01 10:31:01','2019-07-01 10:31:01','2020-07-01 10:31:01'),('6d8de27251db430bf178c205cd75e604ed1cef21a4fb5096a6928b0f3072eb8c425c5edb4504c5b4',1,2,NULL,'[]',0,'2019-07-01 10:08:12','2019-07-01 10:08:12','2020-07-01 10:08:12'),('6da1e52505955f8119568256f7fc1be230a8be6a13f27efb1e5abb0cb5164b5043d57974484187fc',1,2,NULL,'[]',0,'2019-07-01 10:13:03','2019-07-01 10:13:03','2020-07-01 10:13:03'),('6f33fbbf2cbf47b4f028b839d090290891c1096918e6eb2e4464f6ee1035286401d06ed0a9a135bd',1,2,NULL,'[]',0,'2019-07-01 10:26:30','2019-07-01 10:26:30','2020-07-01 10:26:30'),('70514be6f6e0196e3a64a95d51b0959c25aa2a1f8d18f525190cb77b940fbefcf115e1b029d42a15',1,2,NULL,'[]',0,'2019-07-01 10:56:33','2019-07-01 10:56:33','2020-07-01 10:56:33'),('71e4f6c59eff9282f05020fef7e6098ff8ec012795fa69a0cafe950b2aa23818255f7d57eb306f41',1,2,NULL,'[]',0,'2019-07-01 08:17:47','2019-07-01 08:17:47','2020-07-01 08:17:47'),('73e2fffc2923aa55f5a48b87d562d05b29fd8869811421adf1cbc421e69cc0fa70a9199c5e378206',1,2,NULL,'[]',0,'2019-07-01 10:15:18','2019-07-01 10:15:18','2020-07-01 10:15:18'),('851095bf570d08531c80b74d58208a5f690fd5dc0043b2843cb00e0a3a2897a1a419256233779e59',2,2,NULL,'[]',0,'2019-07-01 10:58:21','2019-07-01 10:58:21','2020-07-01 10:58:21'),('87f2f9bc2818514321c112377beb4e333a116c7c3244cd894b8cc4c694275cb386944e930e27998b',1,2,NULL,'[]',0,'2019-07-01 08:37:47','2019-07-01 08:37:47','2020-07-01 08:37:47'),('8a981cd2e2fe685ecab30e169e1c52bf555e00c5a0e8a4e8f2cbf4c8ec676efcdfaa1a6b8b1f2ace',1,2,NULL,'[]',0,'2019-07-01 08:26:48','2019-07-01 08:26:48','2020-07-01 08:26:48'),('8d27c0d5e3b0af4c08798c0b52c460fea7de39f25d4d491d6af292c2a86060efa8fdb1ddc5b8657b',1,2,NULL,'[]',0,'2019-07-01 10:30:32','2019-07-01 10:30:32','2020-07-01 10:30:32'),('8f8d6916b03893a09124bc480788144715a4d7ab8b6e20105a5efd9f61c9390ecb7bd9ba462195ea',1,2,NULL,'[]',0,'2019-07-01 08:22:32','2019-07-01 08:22:32','2020-07-01 08:22:32'),('9190e19235d6df373e57ef2e7350b049c711c67e2ac1a044d695d21272cb33b56b79d92cca3e2016',1,2,NULL,'[]',0,'2019-07-01 10:16:09','2019-07-01 10:16:09','2020-07-01 10:16:09'),('92828a5903b891fddc6de605bfd5990016a1f13c44f381c8397c820dbe3163e18746ea05f12afe90',1,2,NULL,'[]',0,'2019-07-02 11:25:43','2019-07-02 11:25:43','2020-07-02 11:25:43'),('93acbd5518ee21cc2cbfee87cbc7c087e5f3f0982f75b3a5305966d0584dd1559d9aaf9b3626670f',1,2,NULL,'[]',0,'2019-07-01 10:24:29','2019-07-01 10:24:29','2020-07-01 10:24:29'),('9758bc6beac6c3e303f5289c78456a3c4efa4a7c73ecb38f058726504692717af16cc9c545bf2f6d',1,2,NULL,'[]',0,'2019-07-01 10:08:56','2019-07-01 10:08:56','2020-07-01 10:08:56'),('a60bdc24938fd575483a5c59e0ec35423040917e5fd95f9168b897c87dc0203953fe1cbc91eca9e3',1,2,NULL,'[]',0,'2019-07-01 08:18:11','2019-07-01 08:18:11','2020-07-01 08:18:11'),('a763e461837eb9d8ec0f83ed706099bb3b16cbeaa8a7f9293ac3edd2ac4b49dd81bb0f2536f22474',1,2,NULL,'[]',0,'2019-07-01 10:30:23','2019-07-01 10:30:23','2020-07-01 10:30:23'),('b1f9e302fb0e4304da725f593a79ae7055af7457a9151258bc626db76be133dd569ceeea04f7cd6e',1,2,NULL,'[]',0,'2019-07-01 08:20:47','2019-07-01 08:20:47','2020-07-01 08:20:47'),('b660129b7add237edfc203e50f8d7e7e44457ee9fffee15cc66fb3c7ef6ce97ee35ddeb204366367',1,2,NULL,'[]',0,'2019-07-01 11:49:12','2019-07-01 11:49:12','2020-07-01 11:49:12'),('bacc6c560f469a60f2c654c50e1714c1bc535c426843780e12df1c57d6cc103eaf90579fd292baa4',1,2,NULL,'[]',0,'2019-07-01 08:37:37','2019-07-01 08:37:37','2020-07-01 08:37:37'),('bb93e2311e063158fd9d4959e8706583f8229e0f675194665c42d2372fc49b00c82348c83f267e73',1,2,NULL,'[]',0,'2019-07-01 08:24:13','2019-07-01 08:24:13','2020-07-01 08:24:13'),('bc1a63fbf587bd5c0d13d02089188c642ae1a5fd7f16458c534f6b7e116e64d8c00d22664ac8f6be',1,2,NULL,'[]',0,'2019-07-02 06:33:24','2019-07-02 06:33:24','2020-07-02 06:33:24'),('bffa18d3c1e7d0068488ab0acd5f913ce191654d6dadc1d7059785b6761183b1fe9cc87a1a0558b3',1,2,NULL,'[]',0,'2019-07-01 10:05:17','2019-07-01 10:05:17','2020-07-01 10:05:17'),('c308c8f4b3812937d72a4c56db378f79fb620ec0e94bed7c5f3cb1cba7b8468bbdb5a903be92c22b',1,2,NULL,'[]',0,'2019-07-04 05:13:17','2019-07-04 05:13:17','2020-07-04 05:13:17'),('c5f008a885baac5d171507c4de1c56cb62506e3a1fe61a6b9243ad97c4735b1bb1df9a1102afe63d',1,2,NULL,'[]',0,'2019-07-04 05:11:36','2019-07-04 05:11:36','2020-07-04 05:11:36'),('c60b3c8b8514a44af7b486b33eefa3cba72670d22254d08c84550142bd3742c53d5da50a36f79091',1,2,NULL,'[]',0,'2019-07-01 07:36:07','2019-07-01 07:36:07','2020-07-01 07:36:07'),('c73e5f8a2b763519eb84a358fdd5fb85edbae1fc81c7baa974d058d386b0a28d9549035f70c207a7',1,2,NULL,'[]',0,'2019-07-01 08:20:19','2019-07-01 08:20:19','2020-07-01 08:20:19'),('cbb148ff0205b1d9392c8dc447977031dc32b4c00114086d46af361f323a77c7befcbd49ece38c50',1,2,NULL,'[]',0,'2019-07-04 05:14:06','2019-07-04 05:14:06','2020-07-04 05:14:06'),('cdd316c79568e38f6af3538d8ed764968c0b94d47843543aba38b1fd33298bddfcfc53b9c29bca7e',1,2,NULL,'[]',0,'2019-07-03 04:31:33','2019-07-03 04:31:33','2020-07-03 04:31:33'),('d3117e520af41fa1dbf18f64508640d818042caf37497566457b08cf8a37cffbb1f76c0f3f2f584f',1,2,NULL,'[]',0,'2019-07-01 10:14:45','2019-07-01 10:14:45','2020-07-01 10:14:45'),('d364fbfbc89091a52c23292922bd6e40c5d31fa4f3d2d740bdf561e7d57f293d2d0935b8aec209a5',1,2,NULL,'[]',0,'2019-07-01 10:18:38','2019-07-01 10:18:38','2020-07-01 10:18:38'),('dbe1ed65ee48ef0dfc2f1efc4c649bd3ee385ac6647bd437efd8cb929058ed20e0d772c9303cc606',1,2,NULL,'[]',0,'2019-07-01 08:20:27','2019-07-01 08:20:27','2020-07-01 08:20:27'),('ddee24d1c8174fe27f615ad8068988dc79da210c4216eae265b36aabb752e42bf64e7cbc83fd8a46',1,2,NULL,'[]',0,'2019-07-02 07:26:23','2019-07-02 07:26:23','2020-07-02 07:26:23'),('e2dd71f8d2255fb7dc80e6959911f0f7056ab72ea75aadd0c2917284ad9f5b06e9ba9023aefc68ff',1,2,NULL,'[]',0,'2019-07-01 08:16:35','2019-07-01 08:16:35','2020-07-01 08:16:35'),('e9c11cbdf030db7b9cb48c1559ab4c5feb49d6697bbd44e14d6a7399d24b87f883db63d59fad8575',1,2,NULL,'[]',0,'2019-07-02 05:12:52','2019-07-02 05:12:52','2020-07-02 05:12:52'),('e9f28d9b35795fe9fe019a542012cad09b00283e65a88a8610c1c2075095a8b0ad78df8cd590630c',1,2,NULL,'[]',0,'2019-07-01 08:18:26','2019-07-01 08:18:26','2020-07-01 08:18:26'),('f2798f696212c2897707b0a3724e99546e1969f427222615771057780ff62d7ec31541ac3405ec7d',2,2,NULL,'[]',0,'2019-07-01 10:57:58','2019-07-01 10:57:58','2020-07-01 10:57:58'),('f28b0838609384a3fc1c51140064ba011de45df08309dd78d902e6604015a1a2666550efb8342ef2',1,2,NULL,'[]',0,'2019-07-01 10:07:22','2019-07-01 10:07:22','2020-07-01 10:07:22'),('f4f5bb72c0c03a12d2a7deeb9f63101f037935a0044676748a5cbfd9d8ac5abdb9f1249c7fceb233',1,2,NULL,'[]',0,'2019-07-04 05:15:50','2019-07-04 05:15:50','2020-07-04 05:15:50'),('f51b2c285eabd9af0547be99ed0190bc64e8515f3b82208c664848474574800459aaf5c662a5c623',1,2,NULL,'[]',0,'2019-07-01 08:18:21','2019-07-01 08:18:21','2020-07-01 08:18:21'),('f9de85875169218acdbcd581f3b9288731e110a678b5ea56ce5e182dff5b1aba83b303e5853d8dd4',1,2,NULL,'[]',0,'2019-07-04 05:15:16','2019-07-04 05:15:16','2020-07-04 05:15:16'),('fab36cc0cbe6c9bdd1e4b8983f1171cfd37c216eadb5233816b0f24ae470383b08d876a1e6d5b02e',1,2,NULL,'[]',0,'2019-07-01 10:05:17','2019-07-01 10:05:17','2020-07-01 10:05:17'),('fb415fb28107b0c4c45cf4ba99675e536b405271e8f459f676f5ff811d52bbb30682e0c050cd3836',1,2,NULL,'[]',0,'2019-07-01 10:13:20','2019-07-01 10:13:20','2020-07-01 10:13:20');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','S77V7Ztfssb8gzQmBwWYrQ56rIPy97kxKbptUR6w','http://localhost',1,0,0,'2019-07-01 06:05:35','2019-07-01 06:05:35'),(2,NULL,'Laravel Password Grant Client','HWM8reeG7o3AXJHXueLdybfJnsM41aYsuZdtydtS','http://localhost',0,1,0,'2019-07-01 06:05:35','2019-07-01 06:05:35');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2019-07-01 06:05:35','2019-07-01 06:05:35');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth_refresh_tokens` VALUES ('005225b0c7b741c27957c44049e6a72a997f6cc50066a4280d7ac2066658ea326d0148a4c42ac15a','bc1a63fbf587bd5c0d13d02089188c642ae1a5fd7f16458c534f6b7e116e64d8c00d22664ac8f6be',0,'2020-07-02 06:33:24'),('11c3f38b5506639531dfeba8a1637b6918cfb256f38b86fa3082dabd5143877b7b0023393a6d8cb9','b660129b7add237edfc203e50f8d7e7e44457ee9fffee15cc66fb3c7ef6ce97ee35ddeb204366367',0,'2020-07-01 11:49:12'),('15ea4436b92576511b289ff1ee6c6c57b7a1faef4d98a326ae970acbfeca927e7ee98cfab002a753','3631878770b58034e81a37c2ad74d01342896137895f69ced2047f6a70c319e222d24c7712c4f9aa',0,'2020-07-01 10:07:16'),('160ff1275f69ee2deec2cda7cf08854089478460f6525294ee62f08afbeea1545a89fb1ac2425980','36b04e0263e21fc364b86c614f0f8c68c55d60d192dfeed66e286e95a7d873e00ac0a101df4b31e3',0,'2020-07-01 08:26:48'),('1637eb0d6c2662344ae4d4c95eedc73823a1d0ba6125e7ac9969e846c2d672d4ca80d21ab878648c','87f2f9bc2818514321c112377beb4e333a116c7c3244cd894b8cc4c694275cb386944e930e27998b',0,'2020-07-01 08:37:47'),('198c29f209b054d5c67cbd1eb8607065e0eae9f73fa72a9fa4c95664ccdfc0fbdde334b6673ccfa1','8f8d6916b03893a09124bc480788144715a4d7ab8b6e20105a5efd9f61c9390ecb7bd9ba462195ea',0,'2020-07-01 08:22:32'),('19ed224a0e80b9ea2e01ac9cabfebd6cf0d54151468ded0c8803217159a6bde2b83287a38e29c057','5f2db839182520ef941d96ce8d88fcf9d52e2c77e3efbdc336bea9c70f521e0d0225c73abc093567',0,'2020-07-01 11:48:29'),('1b18e5c899da0da53f71afc0597a4e57f6a8485fe253a1ffffa8d454958c76d6f5da562bd8e54ad4','a763e461837eb9d8ec0f83ed706099bb3b16cbeaa8a7f9293ac3edd2ac4b49dd81bb0f2536f22474',0,'2020-07-01 10:30:23'),('1b840e6ba7ec4511c36ea5e8f6aef8327a86a92e7d5f1f2c67023121d8512fdbef901dad7a92c5f2','6d7ed827349d1ccf74d388013278f953dece6e50c382e0172db66a43af0e8a4ee89e77105a8c703b',0,'2020-07-01 10:31:01'),('20750b454da13e5930f77ebb5082236215f2c239b50a13534c4ccfe44feea6814be077e33764be2e','e9c11cbdf030db7b9cb48c1559ab4c5feb49d6697bbd44e14d6a7399d24b87f883db63d59fad8575',0,'2020-07-02 05:12:52'),('2ae8bd6f4a7713f89d8c767c51737f5d42f0875af6c30206c2496d07c87a05ac845d6624d1bb4e11','71e4f6c59eff9282f05020fef7e6098ff8ec012795fa69a0cafe950b2aa23818255f7d57eb306f41',0,'2020-07-01 08:17:47'),('2f8d1547e7b83f9e343817dd7d54913b5e7c21e25c67949dd06ed9b9a94c77e58e903caf48554639','6616d87852a80f939a9160ca0616755e38ac79d29f27d2d0cea247fe4c44d4f2bc4e505716edcc9d',0,'2020-07-04 04:36:07'),('332c7a49d3885c858fcdd58ab60eabfe44524519cbf09060919eb7bce292a5d8c1f726e168a71b1d','d3117e520af41fa1dbf18f64508640d818042caf37497566457b08cf8a37cffbb1f76c0f3f2f584f',0,'2020-07-01 10:14:45'),('376a1292a7e90839fc9722a77c6dd130a65948f667c4722f69329f652a72b754956b83b8b2c296f6','42a0be6752d3222bb26a1dcb2cf8036cf405bcc3b5ecc30d8276e7007d75e32c937c9e2b8abdc52b',0,'2020-07-01 10:13:54'),('38ccfcad3e43f88c19c5eb891b7f849d6b4598a455d9320517a22eca1a421e1ebb8ffc68bca90a77','93acbd5518ee21cc2cbfee87cbc7c087e5f3f0982f75b3a5305966d0584dd1559d9aaf9b3626670f',0,'2020-07-01 10:24:29'),('3c5de7c7812f32bcb274fca8eea88b9d48e2310bc5e902e1f73ae1d959ba742d064a505f417a069e','5e159c26f765afaec2ce5b7b16e7c9278ecd70c32cbb756992f8a82bc147bb6aff3c3c14ff165ab7',0,'2020-07-01 08:18:33'),('3d060269db4019f3a43f28502f90d7d80b6537e3501fbbddd8e92ac44d758266a41e045f0591bdbc','2ff169b9a194a633f7b3591b651c986b17232f621a03e3d763c8f6e4abcb1318905fd9a5cdd35f55',0,'2020-07-04 05:13:14'),('40b251c23369c858a9c9551ca6be158e380c2f7d50fc137f1ebc2c32bd51841b276cce1390fda24c','d364fbfbc89091a52c23292922bd6e40c5d31fa4f3d2d740bdf561e7d57f293d2d0935b8aec209a5',0,'2020-07-01 10:18:38'),('42e8ca827e54c96a6afc3abae0a26c370a3e4f923cb4710e628fbac1c7e91ac5a6112114c406a9d5','a60bdc24938fd575483a5c59e0ec35423040917e5fd95f9168b897c87dc0203953fe1cbc91eca9e3',0,'2020-07-01 08:18:11'),('50b23bf1d0fad89696c5e52004086de9f4f8e563de9e2f5b7af31fddac01ec9a0653c161cff7fa46','73e2fffc2923aa55f5a48b87d562d05b29fd8869811421adf1cbc421e69cc0fa70a9199c5e378206',0,'2020-07-01 10:15:18'),('5629e1abb256bfb7a10f15af4ab46c43429269f52dd7d13c2d81458abb0b2ad0e4a752a51d633fcf','1a134d5167e7dd6b615f6e125ef314826b2581f64351c0406ff050eb776e21cfe6acdc3ca682d056',0,'2020-07-01 08:26:48'),('59cb246c47424559d7dd22fbd46b8b9f489bcf33bdfb92cdace932e496109bf664347fd9e8e166a1','e2dd71f8d2255fb7dc80e6959911f0f7056ab72ea75aadd0c2917284ad9f5b06e9ba9023aefc68ff',0,'2020-07-01 08:16:35'),('5ad3c93436ee29eb97c8cb645879747cb93ac23249e155f59903bf6a441f2431b9834ca3432efda1','293cb2ee1c1e4c922acd63bd787fc9e483c9401852d2bcf371fac2cc958822e5df1c0ef7ec228052',0,'2020-07-01 08:20:52'),('602e41a2ef9dcdfe0ecff804368071e80bcb70accbd55d8f14ca362d00696dd391ca096375e0e75c','851095bf570d08531c80b74d58208a5f690fd5dc0043b2843cb00e0a3a2897a1a419256233779e59',0,'2020-07-01 10:58:21'),('61d6ea12d7ab6887a87925cd972c1df9c2de8c15a9d261ddfc7d3aa52f0c7f7d9374d786da5301f6','f2798f696212c2897707b0a3724e99546e1969f427222615771057780ff62d7ec31541ac3405ec7d',0,'2020-07-01 10:57:58'),('68b0ef0cd274d5a6e836017f5aebd35b80e64b352c278afaca0484f54ea330f94606664c86f155d8','234de6e3c8bbfe9f304bc80571c34c768abf2b1f2ba450d56133fecebc463ae0feedb9573e83ab0b',0,'2020-07-01 08:20:36'),('69a41d3fe1a9381e7613bf0a5edf8dac4c6fc86467ccb5073086d3d93329eb7aa1ba88e05d1ba1f9','c308c8f4b3812937d72a4c56db378f79fb620ec0e94bed7c5f3cb1cba7b8468bbdb5a903be92c22b',0,'2020-07-04 05:13:17'),('6ff83abf6bdfe9e70960e152869603b29fffdbc60de508c5227bad25806736ebacda9a99c0ebe8c3','92828a5903b891fddc6de605bfd5990016a1f13c44f381c8397c820dbe3163e18746ea05f12afe90',0,'2020-07-02 11:25:43'),('751ffa33f48edd0b1a6e6eb7382202684d0e7a58081f72b51b941b576282fd81f6b6115d10e5d432','0422395b85abf433ea6c28b847e5cc0dae51c79d1acf4aff00c57e5fad25180ed523c76f99efc465',0,'2020-07-01 10:26:07'),('7bf8d1f47cd3974c7b2199d25f7967bbd341f4b6fb1adf654e38746468ab4a82ff9e29c98fa40b94','bb93e2311e063158fd9d4959e8706583f8229e0f675194665c42d2372fc49b00c82348c83f267e73',0,'2020-07-01 08:24:13'),('7ed9d8211f9a40e0c1a3c9924bdd568103bc4c25155c99f30f7a400c34a1c2c8f386141ecc3b58f5','c60b3c8b8514a44af7b486b33eefa3cba72670d22254d08c84550142bd3742c53d5da50a36f79091',0,'2020-07-01 07:36:07'),('86d54c79f547a5a4b8ca046ef3650cdde0895f30bc962d447f578fa876950680c4c4d508dfdf2ea5','bffa18d3c1e7d0068488ab0acd5f913ce191654d6dadc1d7059785b6761183b1fe9cc87a1a0558b3',0,'2020-07-01 10:05:17'),('87e936ee65ec7c81aef668796f271a77b7cf05f7e92447d93697209010bae9485eef5c09d0b297ee','01f116ab198e33cc01ebf1e03dc3b26d2cb38ad5080a2bb751613c153d0310f3116d8680b9096f4e',0,'2020-07-01 08:18:53'),('889d99b77b9153b597b8019c2174b17bb8b16953a6bd2169d9a440f89ca5db6ef4f35c03ba4a64ed','3e14012b708d287b9531a4e6cc2063870cfdc667e79091eb100581df43132f5978ea9ee1c7120679',0,'2020-07-01 08:18:46'),('8a94bf9395b0c43fa0bae39ec260a79ce70f89ad20f4ac2bfaf2dc226c5a85c69275d3135f164407','489bce2cdf875169ed18a08d71334f4acd26cdae0f5b2e3d08e1f5ab6a6da92ef8dbdce9251ca9ed',0,'2020-07-01 10:25:07'),('8cd3e9182c6ce1bfc6e5f91682fc99f90ae33f6e4e2d67ace712730b03e92c9b5b9d5a4f5d55da6d','6da1e52505955f8119568256f7fc1be230a8be6a13f27efb1e5abb0cb5164b5043d57974484187fc',0,'2020-07-01 10:13:03'),('94616ebef83879c867914dddb4531f47255861b47fa79b50943384133c4655fbb9507082fa7d7e94','cdd316c79568e38f6af3538d8ed764968c0b94d47843543aba38b1fd33298bddfcfc53b9c29bca7e',0,'2020-07-03 04:31:33'),('96d1d68877f43d1d82f8ec577223bc62c66c31704af157cef8280e05849913a704dae1a6f1ba63c9','dbe1ed65ee48ef0dfc2f1efc4c649bd3ee385ac6647bd437efd8cb929058ed20e0d772c9303cc606',0,'2020-07-01 08:20:27'),('96f38d8e374ffac0084e7b5af8e661251b39ba2e9dc6f72eba75664f0bbfde7e46e2852fdf34e9fc','9758bc6beac6c3e303f5289c78456a3c4efa4a7c73ecb38f058726504692717af16cc9c545bf2f6d',0,'2020-07-01 10:08:56'),('a0944f724f9a37101aabf154f16f30af2e9d2a68c8a6cc337e3fba0e77e0890ebfafb79dd341b6ce','5ba1041d8ac63c587b7a46a27efdd7711d4bc22ba530d0dbf06ab0574b5cd7ce3b80ba1234e78396',0,'2020-07-01 08:26:48'),('a2d2ffc5ddd7f60a3a01e67350483ce0e5a4dde831a5ba792f89db56d73d415ce3f0bc886e87ff9f','f51b2c285eabd9af0547be99ed0190bc64e8515f3b82208c664848474574800459aaf5c662a5c623',0,'2020-07-01 08:18:21'),('a350091c0680fcb9e8f74e50aa8214ca6055410a40b02be4802fce16ef853836c101138f2efaa1f8','c5f008a885baac5d171507c4de1c56cb62506e3a1fe61a6b9243ad97c4735b1bb1df9a1102afe63d',0,'2020-07-04 05:11:36'),('a7633eb1caadb4d1d64bc3bf8f8f964ddd8748884e2ac33ee1eb4990381a3fc1cd595dd7b382a512','fab36cc0cbe6c9bdd1e4b8983f1171cfd37c216eadb5233816b0f24ae470383b08d876a1e6d5b02e',0,'2020-07-01 10:05:17'),('b3cd5218206534ebd3b57a90fcab051772d7d42438f46993789eaea85052a35d7d8864b0528c4f6d','28f8d68209fe0d0bd2318979c56e3de9dd8aa4a455d9ce7e93df5bff112f608cf975141f12c7b8f1',0,'2020-07-04 05:14:09'),('b6fa245ef6aa9a471acfb3ff016bc93be62f919cc00e4e99726fc9ec744e47e197dd610418e9b800','fb415fb28107b0c4c45cf4ba99675e536b405271e8f459f676f5ff811d52bbb30682e0c050cd3836',0,'2020-07-01 10:13:20'),('b81d0c536d96a3dff17c371ad78b7690e900477be01bb1e9ec6d74a64b63c4c25a8084ca57ae63c8','b1f9e302fb0e4304da725f593a79ae7055af7457a9151258bc626db76be133dd569ceeea04f7cd6e',0,'2020-07-01 08:20:47'),('c6d4989b2160f06ea9fb57ca1f13a1d84098bdae35098bbb4f94f51b13a159ddb1481f5c2f224579','f4f5bb72c0c03a12d2a7deeb9f63101f037935a0044676748a5cbfd9d8ac5abdb9f1249c7fceb233',0,'2020-07-04 05:15:50'),('c71a6324bb78a5547310e12133bb212d6bbffc65a103e9ee0d636c95dda32d8f7da637752e5a52a5','c73e5f8a2b763519eb84a358fdd5fb85edbae1fc81c7baa974d058d386b0a28d9549035f70c207a7',0,'2020-07-01 08:20:19'),('c886ce73d29dd65862c3874dd7fd703732f3112cbab16e5dd0ca75d748917af9fab2a6f7b91f532d','70514be6f6e0196e3a64a95d51b0959c25aa2a1f8d18f525190cb77b940fbefcf115e1b029d42a15',0,'2020-07-01 10:56:33'),('cdfee1e8ca2d95c9d3fbccc07bb06ec691f22e1a499ae1b19c714f11e73b49be9f25430ff1dc77b6','6d694eeb220e5bf70d629d2c0df454e2b797ba4ab65b01c3bdb423c3334a41b40ede451932a33505',0,'2020-07-01 10:30:10'),('cf6352be4dedd9cfbd2b68470683159f9659943d1d656157db3277fe1284ee1e93ad243fb6d6fd8e','6d8de27251db430bf178c205cd75e604ed1cef21a4fb5096a6928b0f3072eb8c425c5edb4504c5b4',0,'2020-07-01 10:08:12'),('d3b15d97fa22f154675b0ef51afb3609fb5814d2ac84b20afa50313e751e008b9e7e096f1f97efb0','ddee24d1c8174fe27f615ad8068988dc79da210c4216eae265b36aabb752e42bf64e7cbc83fd8a46',0,'2020-07-02 07:26:23'),('d75a0fed417571649e003d01b829e8338c057cd4a471a0859977455c8731addab018c151edea99c4','5072caddbee74374e1fd3d6d7158b5122bd358660b9459af9885929a90ab6cc75b868a34eda9061d',0,'2020-07-01 10:31:56'),('d8d4e75de4db16a37abcdf3f0c73d79efbb09776b78a83a7f48706159b02a7cf3fd94b65727d2fd2','f9de85875169218acdbcd581f3b9288731e110a678b5ea56ce5e182dff5b1aba83b303e5853d8dd4',0,'2020-07-04 05:15:16'),('ddc9053ca6fab4b86411daccb03c3cdfd00bc1a523d0033c8ac8bdddaf0380ca8cd6ffb3b1159eef','2732bbb22651c8bdc74e2a7fa668d0f1b29a7fd449ded1af5e50381fd08d0c36d62ff2ac166fccce',0,'2020-07-01 10:05:15'),('e210d6d67ccb8c2d0e162b1489976821b72d7419527aa13b5c4dbda42f071cce7bf92dc5866de841','352298e01d012e2ba7c2d4a827c76b8f0fdce8df36840d3fb0c921239d63e8226bf0f95fe08f51ee',0,'2020-07-07 07:19:57'),('e58d1a9f8a9848315dec46aa79aabb24e77388fc477737b9da93a08634188d35d8ec33ce5c64e9a1','6f33fbbf2cbf47b4f028b839d090290891c1096918e6eb2e4464f6ee1035286401d06ed0a9a135bd',0,'2020-07-01 10:26:30'),('e9210cfc480c00e39370394fdb98b9fa41e10907d71f74983b541f504dba1a9148f5c86a8b4579cc','bacc6c560f469a60f2c654c50e1714c1bc535c426843780e12df1c57d6cc103eaf90579fd292baa4',0,'2020-07-01 08:37:37'),('ebc7debc19a642355b93504e6c79c10cfee2977e16d7e2fdfe6b36143dab00c9876ea5859636478c','4040606b10b922ecb5791bb3334df8dcc29be239f69c0fd98ec2090590e6205a647ec1d02313e519',0,'2020-07-01 10:07:27'),('ed5ee002fe13928258a42690a6d6be5320aeef8ed31688bb56db184b65e9fa79f3aa42516c8f88cc','cbb148ff0205b1d9392c8dc447977031dc32b4c00114086d46af361f323a77c7befcbd49ece38c50',0,'2020-07-04 05:14:06'),('efe1baaf7230c0faf41a273f29b930d8f0f4145e2ed8e630d351e286d11d0294bd034b4ad22f7ad7','8d27c0d5e3b0af4c08798c0b52c460fea7de39f25d4d491d6af292c2a86060efa8fdb1ddc5b8657b',0,'2020-07-01 10:30:32'),('f4e917d1e7dfe1525e352cb898b95073b0820934fab0eea296d0428789f4c000974d4270940ae982','9190e19235d6df373e57ef2e7350b049c711c67e2ac1a044d695d21272cb33b56b79d92cca3e2016',0,'2020-07-01 10:16:09'),('f58ca2f3efa5851b755e3f83066a01c513f1353842ef5065dd2072a85f1478857931f888c467dc8c','e9f28d9b35795fe9fe019a542012cad09b00283e65a88a8610c1c2075095a8b0ad78df8cd590630c',0,'2020-07-01 08:18:26'),('fdeaa0c05ba4ccd110f39b2bf1dbcb93d0b2af055c643538dbdcac9836bee5fd9bbdbeb75a809edd','8a981cd2e2fe685ecab30e169e1c52bf555e00c5a0e8a4e8f2cbf4c8ec676efcdfaa1a6b8b1f2ace',0,'2020-07-01 08:26:48'),('ff2ed9a9826f040736fb6b8cd99cf0d54a8ef01ce20702643aaf98deb10e41d4990f0de16b6cc7a8','f28b0838609384a3fc1c51140064ba011de45df08309dd78d902e6604015a1a2666550efb8342ef2',0,'2020-07-01 10:07:22');
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toll__plazas`
--

DROP TABLE IF EXISTS `toll__plazas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `toll__plazas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `toll_type` tinyint(4) NOT NULL,
  `imei` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `toll_amount` decimal(5,2) DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toll__plazas`
--

LOCK TABLES `toll__plazas` WRITE;
/*!40000 ALTER TABLE `toll__plazas` DISABLE KEYS */;
INSERT INTO `toll__plazas` VALUES (1,'Banani Toll Plaza','Banani','Dhaka',NULL,1,'12A',100.00,'01745221166','Khan','2019-06-26 07:47:57','2019-06-26 11:45:35'),(3,'Jamuna Bridge','Tangail','Tangail',NULL,1,'12B',79.00,'01745662244','kalam','2019-06-27 05:41:18','2019-06-27 05:41:18'),(4,'Mohakhali Bridge','banani','Dhaka',NULL,1,'12C',5.00,'01752364189','Khan','2019-06-27 05:42:35','2019-07-01 05:52:30'),(5,'Prochito ITS','banani','dhaka',NULL,2,'12D',96.50,'0928492384902','Mizan','2019-06-27 05:43:28','2019-07-01 05:53:19'),(6,'Ring Road','gfhgfh','gfhgf',NULL,3,'23',10.00,'453654654','Bacchu','2019-06-27 08:19:53','2019-07-01 05:53:09'),(7,'New Town Bridge','Tangail','Tangail',NULL,1,'782RT2',34.00,'3423','Tuhin','2019-06-27 08:59:33','2019-07-01 05:54:06');
/*!40000 ALTER TABLE `toll__plazas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toll_type`
--

DROP TABLE IF EXISTS `toll_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `toll_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toll_type`
--

LOCK TABLES `toll_type` WRITE;
/*!40000 ALTER TABLE `toll_type` DISABLE KEYS */;
INSERT INTO `toll_type` VALUES (1,'Bridge',NULL,NULL),(2,'Flyover',NULL,NULL),(3,'By Pass',NULL,NULL);
/*!40000 ALTER TABLE `toll_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tolls`
--

DROP TABLE IF EXISTS `tolls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tolls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `toll_plaza_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `toll_amount` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tolls`
--

LOCK TABLES `tolls` WRITE;
/*!40000 ALTER TABLE `tolls` DISABLE KEYS */;
INSERT INTO `tolls` VALUES (1,3,2,79.00,'2019-06-26 07:47:57','2019-06-26 11:45:35'),(2,1,5,100.00,'2019-06-27 07:00:25','2019-06-27 07:00:25'),(3,3,6,79.00,'2019-06-27 07:01:38','2019-06-27 07:01:38'),(4,4,6,5.00,'2019-06-27 08:01:04','2019-06-27 08:01:04'),(5,5,5,96.50,'2019-06-27 08:23:34','2019-06-27 08:23:34'),(6,5,2,96.50,'2019-06-27 11:06:42','2019-06-27 11:06:42'),(7,5,2,96.50,'2019-06-27 11:39:36','2019-06-27 11:39:36'),(8,5,2,96.50,'2019-06-27 11:40:20','2019-06-27 11:40:20'),(9,7,2,34.00,'2019-06-27 11:41:34','2019-06-27 11:41:34'),(10,5,4,96.50,'2019-07-02 09:00:45','2019-07-02 09:00:45'),(11,5,4,96.50,'2019-07-02 09:01:45','2019-07-02 09:01:45'),(12,5,4,96.50,'2019-07-02 09:15:26','2019-07-02 09:15:26'),(13,1,4,100.00,'2019-07-02 09:15:34','2019-07-02 09:15:34'),(14,5,4,96.50,'2019-07-02 11:25:31','2019-07-02 11:25:31');
/*!40000 ALTER TABLE `tolls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Mahady','pial.coder@gmail.com',NULL,'$2y$10$PWoSad8qR43Sov2.sTSiKeZSpE3wZ1opZVuTEQbW81lNat4iSMTBO','3LN1vxy7IVh1s7FZnMmPulo9Yzy175dCTfmHPGKA7vpGiWQ1BaO8TxQR7bfw','2019-06-24 07:16:29','2019-06-24 07:16:29'),(2,'Pial','i@i.com',NULL,'$2y$10$DMz6fbb5Ef95vDd0brMcVOD9M2j2KW6W2ZyoBWHg5Wg0MkCaY8KZe','WuSwV6t9XmFg7WRd9LVU2APPxnKH6Jq5sWfO91xJtDSUATFBfDmIIjMXiZ6b','2019-06-25 12:18:24','2019-06-25 12:18:24');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_types`
--

DROP TABLE IF EXISTS `vehicle_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vehicle_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_types`
--

LOCK TABLES `vehicle_types` WRITE;
/*!40000 ALTER TABLE `vehicle_types` DISABLE KEYS */;
INSERT INTO `vehicle_types` VALUES (1,'Small Bus',NULL,NULL),(2,'Large Bus',NULL,NULL),(3,'Motor Bike',NULL,NULL),(4,'Truck',NULL,NULL),(5,'Semi Truck',NULL,NULL);
/*!40000 ALTER TABLE `vehicle_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vehicle_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL,
  `licence_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `engin_cc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `engin_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_type` tinyint(4) NOT NULL,
  `qr_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_permitted` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (2,'BR-9034',1,'Dhaka Metro | LA-8574','2500','78A4ED',1,'654564654564654654654321324968798235434234234234',1,NULL,'2019-06-25 09:35:23','2019-06-25 09:35:23'),(4,'KJDHSF',4,'78-90TH','2500','ASD',2,'10087564625456498879899311010423423423423454235423423423',1,NULL,'2019-06-25 10:49:20','2019-06-26 11:16:27'),(5,'VO-98-KL',1,'78-90UT','150','68D67T',3,'10360852925943893995299285685192758731744941961429287516975941963227417598133',1,NULL,'2019-06-26 06:03:02','2019-06-26 06:03:02'),(6,'NW-9087',4,'kjasdh','34','dsf',4,'858998411845372679644561579518255494146202',1,NULL,'2019-06-26 10:18:23','2019-06-27 05:20:22'),(8,'ABC',1,'dsfdsf','dsds','dfdsfds',5,'377409372299577125428402782915842035202548',1,NULL,'2019-06-27 08:15:27','2019-06-27 08:16:01'),(9,'90IU2W',7,'78-60TH','1500','1500DFG',2,'508553535752166425331255537535780462530636',1,NULL,'2019-07-01 05:55:28','2019-07-01 05:55:28');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-06  5:55:15
