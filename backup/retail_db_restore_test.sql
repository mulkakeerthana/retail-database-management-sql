CREATE DATABASE  IF NOT EXISTS `retail_db_restore_test` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `retail_db_restore_test`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: retail_db_restore_test
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name_UNIQUE` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Electronics','Electronic accessories and devices'),(2,'Home & Living','Home-use products'),(3,'Clothing','Apparel and fashion items'),(4,'Books','Technical and general books'),(5,'Grocery','Food and beverage items'),(6,'Personal Care','Personal hygiene products');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Aarav Sharma','aarav.sharma@example.com','9876500001','Hyderabad','2026-10-01 09:00:00'),(2,'Diya Reddy','diya.reddy@example.com','9876500002','Warangal','2026-10-01 09:15:00'),(3,'Rahul Kumar','rahul.kumar@example.com','9876500003','Karimnagar','2026-10-01 09:30:00'),(4,'Ananya Singh','ananya.singh@example.com','9876500004','Vijayawada','2026-10-01 09:45:00'),(5,'Vikram Patel','vikram.patel@example.com','9876500005','Bengaluru','2026-10-01 10:00:00'),(6,'Sneha Gupta','sneha.gupta@example.com','9876500006','Chennai','2026-10-01 10:15:00'),(7,'Kiran Rao','kiran.rao@example.com','9876500007','Hyderabad','2026-10-01 10:30:00'),(8,'Meera Iyer','meera.iyer@example.com','9876500008','Pune','2026-10-01 10:45:00'),(9,'Arjun Verma','arjun.verma@example.com','9876500009','Mumbai','2026-10-01 11:00:00'),(10,'Priya Nair','priya.nair@example.com','9876500010','Kochi','2026-10-01 11:15:00');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `fk_order_items_products_idx` (`product_id`),
  CONSTRAINT `fk_order_items_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `chk_order_items_quantity` CHECK ((`quantity` > 0)),
  CONSTRAINT `chk_order_items_unit_price` CHECK ((`unit_price` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,1,599.99),(2,1,4,1,299.00),(3,2,2,1,1499.99),(4,3,3,1,1999.99),(5,4,7,2,499.00),(6,5,8,1,1499.00),(7,6,9,1,799.00),(8,6,10,1,999.00),(9,7,11,2,399.00),(10,7,12,1,249.00),(11,8,13,1,299.00),(12,8,14,1,349.00),(13,9,5,1,899.00),(14,9,6,1,349.00),(15,10,15,1,1199.00),(16,10,1,1,599.99);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_date` datetime NOT NULL,
  `order_status` varchar(45) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_orders_customers_idx` (`customer_id`),
  KEY `idx_orders_order_date` (`order_date`),
  KEY `idx_orders_status_date` (`order_status`,`order_date`),
  CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `chk_orders_total_amount` CHECK ((`total_amount` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2026-10-02 10:00:00','Completed',898.99),(2,2,'2026-10-02 11:00:00','Completed',1499.99),(3,3,'2026-10-03 12:00:00','Pending',1999.99),(4,4,'2026-10-03 14:00:00','Completed',998.00),(5,5,'2026-10-04 10:30:00','Completed',1499.00),(6,6,'2026-10-04 15:00:00','Completed',1798.00),(7,7,'2026-10-05 09:30:00','Completed',1047.00),(8,8,'2026-10-05 13:00:00','Completed',648.00),(9,9,'2026-10-06 11:30:00','Completed',1248.00),(10,10,'2026-10-06 16:00:00','Completed',1798.99);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `payment_date` datetime NOT NULL,
  `payment_method` varchar(30) NOT NULL,
  `payment_status` varchar(30) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `fk_payments_orders_idx` (`order_id`),
  KEY `idx_payments_payment_status` (`payment_status`),
  CONSTRAINT `fk_payments_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `chk_payments_amount` CHECK ((`amount` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'2026-10-02 10:05:00','UPI','Paid',898.99),(2,2,'2026-10-02 11:05:00','Card','Paid',1499.99),(3,3,'2026-10-03 12:05:00','Card','Pending',1999.99),(4,4,'2026-10-03 14:05:00','Cash','Paid',998.00),(5,5,'2026-10-04 10:35:00','UPI','Paid',1499.00),(6,6,'2026-10-04 15:05:00','Card','Paid',1798.00),(7,7,'2026-10-05 09:35:00','UPI','Paid',1047.00),(8,8,'2026-10-05 13:05:00','Cash','Paid',648.00),(9,9,'2026-10-06 11:35:00','Card','Paid',1248.00),(10,10,'2026-10-06 16:05:00','UPI','Paid',1798.99);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `stock_quantity` int NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `sku_UNIQUE` (`sku`),
  KEY `fk_products_categories_idx` (`category_id`),
  KEY `idx_products_product_name` (`product_name`),
  CONSTRAINT `fk_products_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  CONSTRAINT `chk_products_stock_quantity` CHECK ((`stock_quantity` >= 0)),
  CONSTRAINT `chk_products_unit_price` CHECK ((`unit_price` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'Wireless Mouse','ELEC-001',599.99,50),(2,1,'Mechanical Keyboard','ELEC-002',1499.99,30),(3,1,'Bluetooth Headphones','ELEC-003',1999.99,25),(4,1,'USB-C Cable','ELEC-004',299.00,100),(5,2,'LED Desk Lamp','HOME-001',899.00,40),(6,2,'Steel Water Bottle','HOME-002',349.00,60),(7,3,'Cotton T-Shirt','CLOT-001',499.00,80),(8,3,'Denim Jeans','CLOT-002',1499.00,45),(9,4,'SQL Basics Book','BOOK-001',799.00,35),(10,4,'Clean Code Book','BOOK-002',999.00,30),(11,5,'Coffee Pack','GROC-001',399.00,70),(12,5,'Green Tea Pack','GROC-002',249.00,65),(13,6,'Face Wash','CARE-001',299.00,55),(14,6,'Shampoo','CARE-002',349.00,50),(15,1,'Laptop Stand','ELEC-005',1199.00,20);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_customer_spending`
--

DROP TABLE IF EXISTS `vw_customer_spending`;
/*!50001 DROP VIEW IF EXISTS `vw_customer_spending`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_customer_spending` AS SELECT 
 1 AS `customer_id`,
 1 AS `full_name`,
 1 AS `total_orders`,
 1 AS `total_spent`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_product_sales`
--

DROP TABLE IF EXISTS `vw_product_sales`;
/*!50001 DROP VIEW IF EXISTS `vw_product_sales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_product_sales` AS SELECT 
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `category_name`,
 1 AS `total_quantity_sold`,
 1 AS `total_revenue`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_sales_summary`
--

DROP TABLE IF EXISTS `vw_sales_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_sales_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_sales_summary` AS SELECT 
 1 AS `order_id`,
 1 AS `order_date`,
 1 AS `customer_name`,
 1 AS `order_status`,
 1 AS `total_amount`,
 1 AS `payment_method`,
 1 AS `payment_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_customer_spending`
--

/*!50001 DROP VIEW IF EXISTS `vw_customer_spending`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_customer_spending` AS select `c`.`customer_id` AS `customer_id`,`c`.`full_name` AS `full_name`,count(`o`.`order_id`) AS `total_orders`,coalesce(sum((case when (`o`.`order_status` = 'Completed') then `o`.`total_amount` else 0 end)),0) AS `total_spent` from (`customers` `c` left join `orders` `o` on((`c`.`customer_id` = `o`.`customer_id`))) group by `c`.`customer_id`,`c`.`full_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_product_sales`
--

/*!50001 DROP VIEW IF EXISTS `vw_product_sales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_product_sales` AS select `p`.`product_id` AS `product_id`,`p`.`product_name` AS `product_name`,`c`.`category_name` AS `category_name`,coalesce(sum((case when (`o`.`order_status` = 'Completed') then `oi`.`quantity` else 0 end)),0) AS `total_quantity_sold`,coalesce(sum((case when (`o`.`order_status` = 'Completed') then (`oi`.`quantity` * `oi`.`unit_price`) else 0 end)),0) AS `total_revenue` from (((`products` `p` join `categories` `c` on((`p`.`category_id` = `c`.`category_id`))) left join `order_items` `oi` on((`p`.`product_id` = `oi`.`product_id`))) left join `orders` `o` on((`oi`.`order_id` = `o`.`order_id`))) group by `p`.`product_id`,`p`.`product_name`,`c`.`category_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_sales_summary`
--

/*!50001 DROP VIEW IF EXISTS `vw_sales_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_sales_summary` AS select `o`.`order_id` AS `order_id`,`o`.`order_date` AS `order_date`,`c`.`full_name` AS `customer_name`,`o`.`order_status` AS `order_status`,`o`.`total_amount` AS `total_amount`,`p`.`payment_method` AS `payment_method`,`p`.`payment_status` AS `payment_status` from ((`orders` `o` join `customers` `c` on((`o`.`customer_id` = `c`.`customer_id`))) left join `payments` `p` on((`o`.`order_id` = `p`.`order_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-02 13:17:25
