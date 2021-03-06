/*
MySQL Backup
Source Server Version: 5.6.41
Source Database: arvis_erp_base
Date: 06/06/2020 18:24:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `ac_tenants_access`
-- ----------------------------
DROP TABLE IF EXISTS `ac_tenants_access`;
CREATE TABLE `ac_tenants_access` (
  `ta_id` int(11) NOT NULL AUTO_INCREMENT,
  `ta_entry_time` datetime DEFAULT NULL,
  `ta_end_time` datetime DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `last_update` int(11) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `tenants_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ta_id`),
  KEY `tenants_id_tenants` (`tenants_id`),
  CONSTRAINT `tenants_id_tenants` FOREIGN KEY (`tenants_id`) REFERENCES `erp_rh_tenants` (`tenants_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `ac_visit_type`
-- ----------------------------
DROP TABLE IF EXISTS `ac_visit_type`;
CREATE TABLE `ac_visit_type` (
  `tv_id` int(11) NOT NULL AUTO_INCREMENT,
  `tv_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`tv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `ac_visitors`
-- ----------------------------
DROP TABLE IF EXISTS `ac_visitors`;
CREATE TABLE `ac_visitors` (
  `ac_id` int(11) NOT NULL AUTO_INCREMENT,
  `ac_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ac_father_surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ac_mother_surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ac_self-plate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ac_entry_time` datetime DEFAULT NULL,
  `ac_end_time` datetime DEFAULT NULL,
  `tenantsid` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `typevisits_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ac_id`),
  KEY `tenants_ac` (`tenantsid`),
  KEY `visit` (`typevisits_id`),
  CONSTRAINT `tenants_ac` FOREIGN KEY (`tenantsid`) REFERENCES `erp_rh_tenants` (`tenants_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `visit` FOREIGN KEY (`typevisits_id`) REFERENCES `ac_visit_type` (`tv_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_admin_condominiums`
-- ----------------------------
DROP TABLE IF EXISTS `erp_admin_condominiums`;
CREATE TABLE `erp_admin_condominiums` (
  `condominums_id` int(10) NOT NULL AUTO_INCREMENT,
  `condominums_description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `condominums_status` bit(1) DEFAULT NULL,
  `create_by` int(10) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_update_by` int(10) DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL,
  `legals_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`condominums_id`),
  KEY `condo` (`legals_id`),
  CONSTRAINT `condo` FOREIGN KEY (`legals_id`) REFERENCES `erp_master_inventarys` (`condominums_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `legals` FOREIGN KEY (`legals_id`) REFERENCES `erp_admin_legals` (`legasl_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_admin_legals`
-- ----------------------------
DROP TABLE IF EXISTS `erp_admin_legals`;
CREATE TABLE `erp_admin_legals` (
  `legasl_id` int(10) NOT NULL AUTO_INCREMENT,
  `legals_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `legals_address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `legals_description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `legals_status` bit(1) NOT NULL,
  `legals_rfc` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `create_by` int(10) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_update_by` int(10) DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`legasl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_admin_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `erp_admin_permissions`;
CREATE TABLE `erp_admin_permissions` (
  `permissions_id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_id` int(11) NOT NULL,
  `permissions_description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `permissions_compras` bit(1) DEFAULT NULL,
  `permissions_cxp` bit(1) DEFAULT NULL,
  `permissions_nomina` bit(1) DEFAULT NULL,
  `permissions_tesoreria` bit(1) DEFAULT NULL,
  `permissions_contabilidad` bit(1) DEFAULT NULL,
  `permissions_cxc` bit(1) DEFAULT NULL,
  `permissions_inventario` bit(1) DEFAULT NULL,
  `permissions_rh` bit(1) DEFAULT NULL,
  `permissions_admin` bit(1) DEFAULT NULL,
  `permissions_status` bit(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `permissions_consult` bit(1) DEFAULT NULL,
  `permissions_create` bit(1) DEFAULT NULL,
  `permissions_update` bit(1) DEFAULT NULL,
  `permissions_delete` bit(1) DEFAULT NULL,
  PRIMARY KEY (`permissions_id`),
  KEY `rols` (`rol_id`),
  CONSTRAINT `rols` FOREIGN KEY (`rol_id`) REFERENCES `erp_admin_rol` (`rol_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_admin_rol`
-- ----------------------------
DROP TABLE IF EXISTS `erp_admin_rol`;
CREATE TABLE `erp_admin_rol` (
  `rol_id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `rol_status` bit(1) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `erp_admin_user`;
CREATE TABLE `erp_admin_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_id` int(11) NOT NULL,
  `user_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_type` int(11) NOT NULL,
  `tenants_id` int(11) DEFAULT NULL,
  `user_status` bit(1) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `condominums_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `rol_user` (`rol_id`),
  KEY `tenains` (`tenants_id`),
  KEY `condominus` (`condominums_id`),
  CONSTRAINT `condominus` FOREIGN KEY (`condominums_id`) REFERENCES `erp_admin_condominiums` (`condominums_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rol_user` FOREIGN KEY (`rol_id`) REFERENCES `erp_admin_rol` (`rol_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tenains` FOREIGN KEY (`tenants_id`) REFERENCES `erp_rh_tenants` (`tenants_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `erp_ap_billtopay`
-- ----------------------------
DROP TABLE IF EXISTS `erp_ap_billtopay`;
CREATE TABLE `erp_ap_billtopay` (
  `billtopay_id` int(11) NOT NULL AUTO_INCREMENT,
  `creditor_id` int(11) DEFAULT NULL,
  `billtopay_invoice_folio` int(11) DEFAULT NULL,
  `billtopay_invoice_date` date DEFAULT NULL,
  `billtopay_scheduled_payment_date` date DEFAULT NULL,
  `billtopay_amount` int(11) DEFAULT NULL,
  `billtopay_service_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_updated_by` int(255) DEFAULT NULL,
  `last_updated_date` date DEFAULT NULL,
  `billtopay_status` bit(1) DEFAULT NULL,
  `condominums_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`billtopay_id`),
  KEY `condominios` (`condominums_id`),
  KEY `creditor` (`creditor_id`),
  CONSTRAINT `condominios` FOREIGN KEY (`condominums_id`) REFERENCES `erp_admin_condominiums` (`condominums_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `creditor` FOREIGN KEY (`creditor_id`) REFERENCES `erp_ap_creditor` (`creditor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_ap_creditor`
-- ----------------------------
DROP TABLE IF EXISTS `erp_ap_creditor`;
CREATE TABLE `erp_ap_creditor` (
  `creditor_id` int(11) NOT NULL AUTO_INCREMENT,
  `creditor_business_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creditor_addres` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creditor_turn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creditor_status` bit(1) DEFAULT NULL,
  `created_by` int(255) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` date DEFAULT NULL,
  PRIMARY KEY (`creditor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_ap_payment_record`
-- ----------------------------
DROP TABLE IF EXISTS `erp_ap_payment_record`;
CREATE TABLE `erp_ap_payment_record` (
  `creditor_id` int(11) DEFAULT NULL,
  `payment_record_payment_date` date DEFAULT NULL,
  `payment_record_amount` int(11) DEFAULT NULL,
  `payment_method` text COLLATE utf8_unicode_ci,
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` date DEFAULT NULL,
  `payment_status` bit(1) DEFAULT NULL,
  `condominums_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `creditorpayment` (`creditor_id`),
  KEY `condomipayment` (`condominums_id`),
  CONSTRAINT `condomipayment` FOREIGN KEY (`condominums_id`) REFERENCES `erp_admin_condominiums` (`condominums_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `creditorpayment` FOREIGN KEY (`creditor_id`) REFERENCES `erp_ap_creditor` (`creditor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_ar_collection`
-- ----------------------------
DROP TABLE IF EXISTS `erp_ar_collection`;
CREATE TABLE `erp_ar_collection` (
  `collection_id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_transaction_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `collection_name_resident` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `collection_payment_term` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `collection_collection_concept` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `collection_amount` decimal(10,2) NOT NULL,
  `collection_referral_address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `collection_status` bit(1) NOT NULL,
  `condominums_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `customer_customer_id` int(11) NOT NULL,
  `payment_terms_id` int(11) NOT NULL,
  `referral_address_id` int(11) DEFAULT NULL,
  `transaction_types_id` int(11) DEFAULT NULL,
  `payments_id` int(11) DEFAULT NULL,
  `purcharse_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`collection_id`),
  KEY `customer` (`customer_customer_id`),
  KEY `payment_terms` (`payment_terms_id`),
  KEY `referral_address` (`referral_address_id`),
  KEY `transaction_types` (`transaction_types_id`),
  KEY `payments` (`payments_id`),
  KEY `purcharse_id_cobro` (`purcharse_id`),
  CONSTRAINT `customer` FOREIGN KEY (`customer_customer_id`) REFERENCES `erp_ar_customer` (`customer_customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `payment_terms` FOREIGN KEY (`payment_terms_id`) REFERENCES `erp_ar_payment_terms` (`payment_terms_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `payments` FOREIGN KEY (`payments_id`) REFERENCES `erp_ar_payments` (`payments_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `purcharse_id_cobro` FOREIGN KEY (`purcharse_id`) REFERENCES `erp_po_purcharse_order` (`purcharse_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `referral_address` FOREIGN KEY (`referral_address_id`) REFERENCES `erp_ar_referral_address` (`referral_address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `transaction_types` FOREIGN KEY (`transaction_types_id`) REFERENCES `erp_ar_transaction_types` (`transaction_types_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_ar_collection_concepts`
-- ----------------------------
DROP TABLE IF EXISTS `erp_ar_collection_concepts`;
CREATE TABLE `erp_ar_collection_concepts` (
  `collection_concepts_id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_concepts_concept_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `collection_concepts_description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `collection_concepts_unit_measurement` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `collection_concepts_price` decimal(10,2) NOT NULL,
  `collection_concepts_accounting_income_account` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `collection_concepts_status` bit(1) NOT NULL,
  `condominums_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `sku` int(11) DEFAULT NULL,
  `accounting_accounts_id` int(11) DEFAULT NULL,
  `purcharse_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`collection_concepts_id`),
  KEY `collection` (`collection_id`),
  KEY `sku_concept` (`sku`),
  KEY `accounting_accounts_id` (`accounting_accounts_id`),
  KEY `purcharse_id` (`purcharse_id`),
  CONSTRAINT `accounting_accounts_id` FOREIGN KEY (`accounting_accounts_id`) REFERENCES `erp_gl_accounting_accounts` (`accounting_accounts_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `collection` FOREIGN KEY (`collection_id`) REFERENCES `erp_ar_collection` (`collection_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `purcharse_id` FOREIGN KEY (`purcharse_id`) REFERENCES `erp_po_purcharse_order` (`purcharse_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sku_concept` FOREIGN KEY (`sku`) REFERENCES `erp_inv_creates_transactions_entrys` (`sku`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_ar_customer`
-- ----------------------------
DROP TABLE IF EXISTS `erp_ar_customer`;
CREATE TABLE `erp_ar_customer` (
  `customer_customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_customer_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `customer_customer_rfc` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `customer_customer_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `customer_address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `customer_phone` int(11) NOT NULL,
  `customer_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `customer_status` bit(1) NOT NULL,
  `condominums_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_ar_deposit_account`
-- ----------------------------
DROP TABLE IF EXISTS `erp_ar_deposit_account`;
CREATE TABLE `erp_ar_deposit_account` (
  `deposit_account_id` int(11) NOT NULL AUTO_INCREMENT,
  `deposit_account_name_deposit_account` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `deposit_account_description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `deposit_account_bank` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `deposit_account_branch_office` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `deposit_account_bill` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `deposit_account_card` int(11) NOT NULL,
  `deposit_account_key` int(11) NOT NULL,
  `deposit_account_status` bit(1) NOT NULL,
  `condominums_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `collection_concepts_id` int(11) NOT NULL,
  PRIMARY KEY (`deposit_account_id`),
  KEY `collection_concepts` (`collection_concepts_id`),
  CONSTRAINT `collection_concepts` FOREIGN KEY (`collection_concepts_id`) REFERENCES `erp_ar_collection_concepts` (`collection_concepts_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_ar_payment_terms`
-- ----------------------------
DROP TABLE IF EXISTS `erp_ar_payment_terms`;
CREATE TABLE `erp_ar_payment_terms` (
  `payment_terms_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_terms_name_payment_term` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `payment_terms_description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `payment_terms_days_pay` int(11) NOT NULL,
  `payment_terms_status` bit(1) NOT NULL,
  `condominums_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`payment_terms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_ar_payments`
-- ----------------------------
DROP TABLE IF EXISTS `erp_ar_payments`;
CREATE TABLE `erp_ar_payments` (
  `payments_id` int(11) NOT NULL AUTO_INCREMENT,
  `payments_transaction_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `payments_name_resident` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `payments_deposit_account` int(11) NOT NULL,
  `payments_amount_payable` decimal(10,2) NOT NULL,
  `payments_status` bit(1) NOT NULL,
  `condominums_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `transaction_types_id` int(11) NOT NULL,
  `customer_customer_id` int(11) NOT NULL,
  PRIMARY KEY (`payments_id`),
  KEY `transaction_types_pay` (`transaction_types_id`),
  KEY `customer_pay` (`customer_customer_id`),
  CONSTRAINT `customer_pay` FOREIGN KEY (`customer_customer_id`) REFERENCES `erp_ar_customer` (`customer_customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `transaction_types_pay` FOREIGN KEY (`transaction_types_id`) REFERENCES `erp_ar_transaction_types` (`transaction_types_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_ar_referral_address`
-- ----------------------------
DROP TABLE IF EXISTS `erp_ar_referral_address`;
CREATE TABLE `erp_ar_referral_address` (
  `referral_address_id` int(11) NOT NULL AUTO_INCREMENT,
  `referral_address_country` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `referral_address_direction` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `referral_address_postal_code` int(11) NOT NULL,
  `referral_address_cologne` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `referral_address_state` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `referral_address_status` bit(1) NOT NULL,
  `condominums_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `customer_customer_id` int(11) NOT NULL,
  PRIMARY KEY (`referral_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_ar_transaction_types`
-- ----------------------------
DROP TABLE IF EXISTS `erp_ar_transaction_types`;
CREATE TABLE `erp_ar_transaction_types` (
  `transaction_types_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_types_name_type_transaction` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_types_description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_types_class_transaction` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_types_accounting_distribution` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_types_status` bit(1) NOT NULL,
  `condominums_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`transaction_types_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_gl_accounting_accounts`
-- ----------------------------
DROP TABLE IF EXISTS `erp_gl_accounting_accounts`;
CREATE TABLE `erp_gl_accounting_accounts` (
  `accounting_accounts_id` int(11) NOT NULL,
  `accounting_accounts_company_code` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accounting_accounts_company_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accounting_accounts_currency_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accounting_accounts_fiscal_year` int(4) DEFAULT NULL,
  `accounting_accounts_description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by: int` int(11) DEFAULT NULL,
  `create_date: date` datetime DEFAULT NULL,
  `last_updated_by: int` int(11) DEFAULT NULL,
  `last_updated_date: date` datetime DEFAULT NULL,
  `accounting_accounts_status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`accounting_accounts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_gl_accounting_accounts_lines`
-- ----------------------------
DROP TABLE IF EXISTS `erp_gl_accounting_accounts_lines`;
CREATE TABLE `erp_gl_accounting_accounts_lines` (
  `accounting_accounts_lines_id` int(11) NOT NULL,
  `accounting_accounts_lines_parent_1` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accounting_accounts_lines_parent_2` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accounting_accounts_lines_parent_3` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accounting_accounts_lines_children` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accounting_accounts_lines_description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accounting_accounts_types_id` int(11) DEFAULT NULL,
  `accounting_accounts_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `accounting_accounts_lines_status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`accounting_accounts_lines_id`),
  KEY `fk_accounting_accounts_id` (`accounting_accounts_id`),
  KEY `fk_accounting_accounts_types_id` (`accounting_accounts_types_id`),
  CONSTRAINT `fk_accounting_accounts_id` FOREIGN KEY (`accounting_accounts_id`) REFERENCES `erp_gl_accounting_accounts` (`accounting_accounts_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_accounting_accounts_types_id` FOREIGN KEY (`accounting_accounts_types_id`) REFERENCES `erp_gl_accounting_accounts_types` (`accounting_accounts_types_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_gl_accounting_accounts_types`
-- ----------------------------
DROP TABLE IF EXISTS `erp_gl_accounting_accounts_types`;
CREATE TABLE `erp_gl_accounting_accounts_types` (
  `accounting_accounts_types_id` int(11) NOT NULL,
  `accounting_accounts_types_number` int(11) DEFAULT NULL,
  `accounting_accounts_types_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accounting_accounts_types_description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `accounting_accounts_types_status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`accounting_accounts_types_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_gl_journals`
-- ----------------------------
DROP TABLE IF EXISTS `erp_gl_journals`;
CREATE TABLE `erp_gl_journals` (
  `journals_id` int(11) NOT NULL,
  `journals_batch_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `journals_number` int(11) DEFAULT NULL,
  `journals_date` datetime DEFAULT NULL,
  `journals_currency_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `journals_description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `journals_haber` decimal(10,0) DEFAULT NULL,
  `journals_deber` decimal(10,0) DEFAULT NULL,
  `condominiums_id` int(11) DEFAULT NULL,
  `accounting_accounts_id_haber` int(11) DEFAULT NULL,
  `accounting_accounts_id_deber` int(11) DEFAULT NULL,
  `periods_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `journals_status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`journals_id`),
  KEY `fk_journals_condominiums_id` (`condominiums_id`),
  KEY `fk_journals_accounting_accounts_id_haber` (`accounting_accounts_id_haber`),
  KEY `fk_journals_accounting_accounts_id_debe` (`accounting_accounts_id_deber`),
  KEY `fk_journals_periods_id` (`periods_id`),
  CONSTRAINT `fk_journals_accounting_accounts_id_debe` FOREIGN KEY (`accounting_accounts_id_deber`) REFERENCES `erp_gl_accounting_accounts` (`accounting_accounts_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_journals_accounting_accounts_id_haber` FOREIGN KEY (`accounting_accounts_id_haber`) REFERENCES `erp_gl_accounting_accounts` (`accounting_accounts_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_journals_condominiums_id` FOREIGN KEY (`condominiums_id`) REFERENCES `erp_admin_condominiums` (`condominums_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_journals_periods_id` FOREIGN KEY (`periods_id`) REFERENCES `erp_gl_periods` (`periods_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_gl_periods`
-- ----------------------------
DROP TABLE IF EXISTS `erp_gl_periods`;
CREATE TABLE `erp_gl_periods` (
  `periods_id` int(11) NOT NULL AUTO_INCREMENT,
  `periods_number` int(11) DEFAULT NULL,
  `periods_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `periods_year` int(4) DEFAULT NULL,
  `periods_start_date` datetime DEFAULT NULL,
  `periods_end_date` datetime DEFAULT NULL,
  `periods_current_status` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `periods_status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`periods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_inv_articles`
-- ----------------------------
DROP TABLE IF EXISTS `erp_inv_articles`;
CREATE TABLE `erp_inv_articles` (
  `sku` int(100) NOT NULL,
  `name_article` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fractionation` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `condominium` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `ast_update_by` int(10) DEFAULT NULL,
  `last_update_date` int(10) DEFAULT NULL,
  `fractionations_id` int(10) DEFAULT NULL,
  `unit_of_measuares_id` int(10) DEFAULT NULL,
  `sub_categories_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`sku`),
  KEY `measures` (`unit_of_measuares_id`),
  KEY `entrys` (`fractionations_id`),
  KEY `sub_categories` (`sub_categories_id`),
  CONSTRAINT `entrys` FOREIGN KEY (`fractionations_id`) REFERENCES `erp_inv_creates_transactions_entrys` (`sku`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `measures` FOREIGN KEY (`unit_of_measuares_id`) REFERENCES `erp_inv_unit_of_measures` (`of_measuares_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sub_categories` FOREIGN KEY (`sub_categories_id`) REFERENCES `erp_inv_sub_categories` (`sub_categories_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_inv_categories`
-- ----------------------------
DROP TABLE IF EXISTS `erp_inv_categories`;
CREATE TABLE `erp_inv_categories` (
  `inv_categories_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `create_by` int(10) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_update_by` int(10) DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`inv_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_inv_creates_transactions_entrys`
-- ----------------------------
DROP TABLE IF EXISTS `erp_inv_creates_transactions_entrys`;
CREATE TABLE `erp_inv_creates_transactions_entrys` (
  `sku` int(10) NOT NULL,
  `name_article` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fractionation` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `condominium` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `create_by` int(10) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_update_by` datetime DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL,
  `concept_entry` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transactions_entrys_cost` decimal(10,2) DEFAULT NULL,
  `sub_inventarys_id` int(10) DEFAULT NULL,
  `purcharse_id` int(10) DEFAULT NULL,
  `collection_concepts_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`sku`),
  KEY `entry` (`sub_inventarys_id`),
  KEY `purcharse` (`purcharse_id`),
  KEY `coll` (`collection_concepts_id`),
  CONSTRAINT `coll` FOREIGN KEY (`collection_concepts_id`) REFERENCES `erp_ar_collection_concepts` (`collection_concepts_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `entry` FOREIGN KEY (`sub_inventarys_id`) REFERENCES `erp_inv_sub_inventarys` (`sub_inventarys_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `purcharse` FOREIGN KEY (`purcharse_id`) REFERENCES `erp_po_purcharse_order` (`purcharse_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_inv_sub_categories`
-- ----------------------------
DROP TABLE IF EXISTS `erp_inv_sub_categories`;
CREATE TABLE `erp_inv_sub_categories` (
  `sub_categories_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `create_by` int(10) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_update_by` int(10) DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL,
  `inv_categories_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`sub_categories_id`),
  KEY `categories` (`inv_categories_id`),
  CONSTRAINT `categories` FOREIGN KEY (`inv_categories_id`) REFERENCES `erp_inv_categories` (`inv_categories_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_inv_sub_inventarys`
-- ----------------------------
DROP TABLE IF EXISTS `erp_inv_sub_inventarys`;
CREATE TABLE `erp_inv_sub_inventarys` (
  `sub_inventarys_id` int(10) NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `create_by` int(10) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_update_by` int(10) DEFAULT NULL,
  `last_update_date` int(10) DEFAULT NULL,
  `master_inventarys_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`sub_inventarys_id`),
  KEY `inventary` (`master_inventarys_id`),
  CONSTRAINT `inventary` FOREIGN KEY (`master_inventarys_id`) REFERENCES `erp_master_inventarys` (`master_inventarys_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_inv_unit_of_measures`
-- ----------------------------
DROP TABLE IF EXISTS `erp_inv_unit_of_measures`;
CREATE TABLE `erp_inv_unit_of_measures` (
  `of_measuares_id` int(10) NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_by` int(100) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_update_by` int(10) DEFAULT NULL,
  `last_update_date` int(10) DEFAULT NULL,
  PRIMARY KEY (`of_measuares_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_master_inventarys`
-- ----------------------------
DROP TABLE IF EXISTS `erp_master_inventarys`;
CREATE TABLE `erp_master_inventarys` (
  `master_inventarys_id` int(10) NOT NULL,
  `name_inventary` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identifier` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assigned_company` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `condominums_id` int(100) DEFAULT NULL,
  PRIMARY KEY (`master_inventarys_id`),
  KEY `condominums_id` (`condominums_id`),
  CONSTRAINT `master` FOREIGN KEY (`master_inventarys_id`) REFERENCES `erp_master_inventarys` (`condominums_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_na_biweekly_payments`
-- ----------------------------
DROP TABLE IF EXISTS `erp_na_biweekly_payments`;
CREATE TABLE `erp_na_biweekly_payments` (
  `biweekly_payments_Lower_limit` int(255) DEFAULT NULL,
  `biweekly_payments_Upper_limit` int(255) DEFAULT NULL,
  `payroll_Fixed_fee` int(255) DEFAULT NULL,
  `biweekly_payments_lower_limit_surplus` int(255) DEFAULT NULL,
  `biweekly_payments_status` bit(1) DEFAULT NULL,
  `created_by` int(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_na_concept`
-- ----------------------------
DROP TABLE IF EXISTS `erp_na_concept`;
CREATE TABLE `erp_na_concept` (
  `concept_Product_service_Cve` int(255) NOT NULL AUTO_INCREMENT,
  `payroll_Unit_alue` int(255) DEFAULT NULL,
  `concept_Social_Security_Amount_from_ISR` int(255) DEFAULT NULL,
  `concept_status` bit(1) DEFAULT NULL,
  `created_by` int(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`concept_Product_service_Cve`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_na_deductions`
-- ----------------------------
DROP TABLE IF EXISTS `erp_na_deductions`;
CREATE TABLE `erp_na_deductions` (
  `deductions_deduction_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deductions_key` int(255) DEFAULT NULL,
  `deductions_concept` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deductions_import_IMSSdivRet. ISR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deductions_total_deductions` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deductions_Total_taxes_withheld` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deductions_status` bit(1) DEFAULT NULL,
  `created_by` int(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_na_monthly_payments`
-- ----------------------------
DROP TABLE IF EXISTS `erp_na_monthly_payments`;
CREATE TABLE `erp_na_monthly_payments` (
  `monthly_payments_Lower_limit` int(255) DEFAULT NULL,
  `monthly_payments_Upper_limit` int(255) DEFAULT NULL,
  `payroll_Fixed_fee` int(255) DEFAULT NULL,
  `monthly_payments_lower_limit_surplus` int(255) DEFAULT NULL,
  `monthly_payments_status` bit(1) DEFAULT NULL,
  `created_by` int(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_na_operations`
-- ----------------------------
DROP TABLE IF EXISTS `erp_na_operations`;
CREATE TABLE `erp_na_operations` (
  `payroll_daily_salary` int(11) DEFAULT NULL,
  `operations_Lower_limit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operations_Surplus_LI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operations_%apply_on_LI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operations_Marginal_tax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operations_Fixed_fee` int(255) DEFAULT NULL,
  `operations_Determined_ISR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operations_Subsidy` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operations_employment_allowance` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operations_ISR_withhold` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operations_status` bit(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` date DEFAULT NULL,
  KEY `SalarioDiario` (`payroll_daily_salary`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_na_payroll`
-- ----------------------------
DROP TABLE IF EXISTS `erp_na_payroll`;
CREATE TABLE `erp_na_payroll` (
  `id_payroll` int(11) NOT NULL AUTO_INCREMENT,
  `payroll_date_admission` date DEFAULT NULL,
  `payroll_antiquity` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payroll_days_paid` int(11) DEFAULT NULL,
  `payroll_daily_salary` int(11) DEFAULT NULL,
  `payroll_S.D.I` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payroll_biweekly_payment` int(11) DEFAULT NULL,
  `payroll_bonus` int(11) DEFAULT NULL,
  `payroll_holidays` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payroll_vacation_bonus` int(11) DEFAULT NULL,
  `payroll_credit_infonavit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payroll_I.M.S.S` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payroll_RET I.S.R.` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payroll_employment_allowance` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payroll_Total_pay` int(11) DEFAULT NULL,
  `payroll_contracting_regime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payroll_Use_Cfdi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payroll_monthly_payment` int(11) DEFAULT NULL,
  `payroll_payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payroll_number_days_paid` int(11) DEFAULT NULL,
  `payroll_Type_payroll` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payroll_social_Security` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payroll_base_salary` int(10) DEFAULT NULL,
  `payroll_Receipt_creation_date` date DEFAULT NULL,
  `payroll_Initial_Payment_Date` date DEFAULT NULL,
  `payroll_Final_payment_date` date DEFAULT NULL,
  `payroll_status` bit(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` date DEFAULT NULL,
  `id_bill` int(11) DEFAULT NULL,
  `bank_accounts` int(11) DEFAULT NULL,
  `id_employees` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_payroll`),
  KEY `factura` (`id_bill`),
  KEY `Num_cuenta` (`bank_accounts`),
  KEY `Empleado` (`id_employees`),
  KEY `payroll_daily_salary` (`payroll_daily_salary`),
  CONSTRAINT `Empleado` FOREIGN KEY (`id_employees`) REFERENCES `erp_rh_employees` (`employees_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Num_cuenta` FOREIGN KEY (`bank_accounts`) REFERENCES `erp_ts_bank_accounts` (`bank_accounts_bank_account_number`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `factura` FOREIGN KEY (`id_bill`) REFERENCES `erp_ap_billtopay` (`billtopay_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_na_taxes`
-- ----------------------------
DROP TABLE IF EXISTS `erp_na_taxes`;
CREATE TABLE `erp_na_taxes` (
  `taxes_id_tax: int` int(11) DEFAULT NULL,
  `taxes_For_Income_From` int(255) DEFAULT NULL,
  `taxes_Up_Income_From` int(255) DEFAULT NULL,
  `taxes_employment_allowance` int(255) DEFAULT NULL,
  `taxes_status` bit(1) DEFAULT NULL,
  `created_by` int(255) DEFAULT NULL,
  `created_date: date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_po_payment_terms_catalogo`
-- ----------------------------
DROP TABLE IF EXISTS `erp_po_payment_terms_catalogo`;
CREATE TABLE `erp_po_payment_terms_catalogo` (
  `payment_termns_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` bit(1) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_updaate_date` datetime DEFAULT NULL,
  PRIMARY KEY (`payment_termns_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_po_purcharse_order`
-- ----------------------------
DROP TABLE IF EXISTS `erp_po_purcharse_order`;
CREATE TABLE `erp_po_purcharse_order` (
  `purcharse_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `purcharse_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_term_id` int(11) DEFAULT NULL,
  `purcharse_request_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purcharse_date_of_purcharse` datetime DEFAULT NULL,
  `purcharse_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purcharse_quantity_items` double(6,0) DEFAULT NULL,
  `sku` int(100) DEFAULT NULL,
  `articles_prices` float(5,0) DEFAULT NULL,
  `purcharse_order_total` float(6,0) DEFAULT NULL,
  `purcharse_status` bit(1) DEFAULT NULL,
  `purcharse_order_creation_date` datetime DEFAULT NULL,
  `create_by` int(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL,
  `admin_condominiuns_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`purcharse_id`),
  KEY `admin_condominiuns_id` (`admin_condominiuns_id`),
  KEY `payterm_id` (`payment_term_id`) USING BTREE,
  KEY `supplier_id` (`supplier_id`),
  KEY `sku` (`sku`),
  CONSTRAINT `admin_condominiuns_id` FOREIGN KEY (`admin_condominiuns_id`) REFERENCES `erp_admin_condominiums` (`condominums_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `payterms_id` FOREIGN KEY (`payment_term_id`) REFERENCES `erp_po_payment_terms_catalogo` (`payment_termns_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sku` FOREIGN KEY (`sku`) REFERENCES `erp_inv_articles` (`sku`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `erp_po_supplier` (`supplier_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_po_supplier`
-- ----------------------------
DROP TABLE IF EXISTS `erp_po_supplier`;
CREATE TABLE `erp_po_supplier` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier_rfc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_terms_id` int(11) DEFAULT NULL,
  `supplier_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_phone` decimal(20,0) DEFAULT NULL,
  `supplier_turn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier_status` bit(1) DEFAULT NULL,
  `create_by` int(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL,
  `admin_condominums_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`),
  KEY `admin_condominums_id` (`admin_condominums_id`),
  KEY `id_term` (`payment_terms_id`),
  CONSTRAINT `admin_condominums_id` FOREIGN KEY (`admin_condominums_id`) REFERENCES `erp_admin_condominiums` (`condominums_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_term` FOREIGN KEY (`payment_terms_id`) REFERENCES `erp_po_payment_terms_catalogo` (`payment_termns_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_rh_agreements`
-- ----------------------------
DROP TABLE IF EXISTS `erp_rh_agreements`;
CREATE TABLE `erp_rh_agreements` (
  `agreements_id` int(11) NOT NULL AUTO_INCREMENT,
  `agreements_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agreements_father_surname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agreements_mother_surname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agreements_residential_number` int(11) DEFAULT NULL,
  `agreements_deposit` decimal(10,2) DEFAULT NULL,
  `agreements_start_date` date DEFAULT NULL,
  `agreements_end_date` date DEFAULT NULL,
  `agreements_status` bit(1) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`agreements_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_rh_departments`
-- ----------------------------
DROP TABLE IF EXISTS `erp_rh_departments`;
CREATE TABLE `erp_rh_departments` (
  `departments_id` int(11) NOT NULL AUTO_INCREMENT,
  `departments_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `departments_status` int(1) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`departments_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_rh_employees`
-- ----------------------------
DROP TABLE IF EXISTS `erp_rh_employees`;
CREATE TABLE `erp_rh_employees` (
  `employees_id` int(11) NOT NULL AUTO_INCREMENT,
  `employees_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employees_father_surname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employees_mother_surname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employees_address` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employees_cv` text COLLATE utf8_unicode_ci,
  `employees_contract` text COLLATE utf8_unicode_ci,
  `employees_status` bit(1) DEFAULT NULL,
  `employee_nss` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_rfc` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_curp` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_sindicalizado` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `condominums_id` int(11) DEFAULT NULL,
  `departments_id` int(11) DEFAULT NULL,
  `workplaces_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`employees_id`),
  KEY `departement` (`departments_id`),
  KEY `workplaces` (`workplaces_id`),
  CONSTRAINT `departement` FOREIGN KEY (`departments_id`) REFERENCES `erp_rh_departments` (`departments_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `workplaces` FOREIGN KEY (`workplaces_id`) REFERENCES `erp_rh_workplaces` (`workplaces_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_rh_reservations`
-- ----------------------------
DROP TABLE IF EXISTS `erp_rh_reservations`;
CREATE TABLE `erp_rh_reservations` (
  `reservations_id` int(11) NOT NULL AUTO_INCREMENT,
  `reservations_location` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reservations_date` date DEFAULT NULL,
  `reservations_start_time` time DEFAULT NULL,
  `reservations_end_time` time DEFAULT NULL,
  `reservations_status` bit(1) DEFAULT NULL,
  `tenants_id` int(11) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`reservations_id`),
  KEY `tenants` (`tenants_id`),
  CONSTRAINT `tenants` FOREIGN KEY (`tenants_id`) REFERENCES `erp_rh_tenants` (`tenants_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_rh_tenants`
-- ----------------------------
DROP TABLE IF EXISTS `erp_rh_tenants`;
CREATE TABLE `erp_rh_tenants` (
  `tenants_id` int(11) NOT NULL AUTO_INCREMENT,
  `tenants_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenants_father_surname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenants_mother_surname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenants_delivery_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenants_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenants_residential_number` int(11) DEFAULT NULL,
  `tenants_number_inhabitants` int(11) DEFAULT NULL,
  `tenants_parking` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenants_type_finish` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenants_status` bit(1) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `last_update_by` int(11) DEFAULT NULL,
  `agreement_id` int(11) DEFAULT NULL,
  `condominums_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tenants_id`),
  KEY `agreements` (`agreement_id`),
  KEY `condominums` (`condominums_id`),
  CONSTRAINT `agreements` FOREIGN KEY (`agreement_id`) REFERENCES `erp_rh_agreements` (`agreements_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `condominums` FOREIGN KEY (`condominums_id`) REFERENCES `erp_admin_condominiums` (`condominums_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_rh_workplaces`
-- ----------------------------
DROP TABLE IF EXISTS `erp_rh_workplaces`;
CREATE TABLE `erp_rh_workplaces` (
  `workplaces_id` int(11) NOT NULL AUTO_INCREMENT,
  `workplaces_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workplace_status` bit(1) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  `create_by` int(11) NOT NULL,
  `last_update_by` int(11) NOT NULL,
  PRIMARY KEY (`workplaces_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_ts_account_statements_header`
-- ----------------------------
DROP TABLE IF EXISTS `erp_ts_account_statements_header`;
CREATE TABLE `erp_ts_account_statements_header` (
  `account_statements_header_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_statements_header_bank_account` int(11) NOT NULL,
  `account_statements_header_statement_date` datetime NOT NULL,
  `account_statements_header_name_statement` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `account_statements_header_initial_balance` decimal(10,2) NOT NULL,
  `account_statements_header_final_balance` decimal(10,2) NOT NULL,
  `account_statements_header_status` bit(1) NOT NULL,
  `condominums_id` int(11) DEFAULT NULL,
  `bank_accounts_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `purcharse_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_statements_header_id`),
  KEY `statements_header` (`bank_accounts_id`),
  KEY `purcharse_id` (`purcharse_id`),
  CONSTRAINT `collection_head` FOREIGN KEY (`purcharse_id`) REFERENCES `erp_ar_collection` (`collection_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `statements_header` FOREIGN KEY (`bank_accounts_id`) REFERENCES `erp_ts_bank_accounts` (`bank_accounts_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_ts_account_statements_lines`
-- ----------------------------
DROP TABLE IF EXISTS `erp_ts_account_statements_lines`;
CREATE TABLE `erp_ts_account_statements_lines` (
  `account_statements_lines_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_statements_lines_transaction_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `account_statements_lines_type_movement` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `account_statements_lines_amount` decimal(10,2) NOT NULL,
  `account_statements_lines_status` bit(1) NOT NULL,
  `condominums_id` int(11) DEFAULT NULL,
  `account_statements_header_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`account_statements_lines_id`),
  KEY `account_statements_lines` (`account_statements_header_id`),
  CONSTRAINT `account_statements_lines` FOREIGN KEY (`account_statements_header_id`) REFERENCES `erp_ts_account_statements_header` (`account_statements_header_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_ts_bank_accounts`
-- ----------------------------
DROP TABLE IF EXISTS `erp_ts_bank_accounts`;
CREATE TABLE `erp_ts_bank_accounts` (
  `bank_accounts_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_accounts_bank_account_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `bank_accounts_bank_account_number` int(11) NOT NULL,
  `bank_accounts_currency` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `bank_accounts_bank` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `bank_accounts_use_account` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `bank_accounts_accounting_combination_cash` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_accounts_compensation_combination` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_accounts_payment_documents` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_accounts_status` bit(1) DEFAULT NULL,
  `manage_banks_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `condominums_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bank_accounts_id`),
  KEY `bank_accounts` (`manage_banks_id`),
  KEY `bank_accounts_bank_account_number` (`bank_accounts_bank_account_number`),
  CONSTRAINT `bank_accounts` FOREIGN KEY (`manage_banks_id`) REFERENCES `erp_ts_manage_banks` (`manage_banks_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_ts_bank_codes`
-- ----------------------------
DROP TABLE IF EXISTS `erp_ts_bank_codes`;
CREATE TABLE `erp_ts_bank_codes` (
  `bank_codes_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_codes_bank_code` int(11) NOT NULL,
  `bank_codes_description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `bank_codes_type_displacement` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `bank_codes_status` bit(1) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `condominums_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bank_codes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_ts_manage_banks`
-- ----------------------------
DROP TABLE IF EXISTS `erp_ts_manage_banks`;
CREATE TABLE `erp_ts_manage_banks` (
  `manage_banks_id` int(11) NOT NULL AUTO_INCREMENT,
  `manage_banks_bank_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `manage_banks_bank_code` int(11) NOT NULL,
  `manage_banks_country` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `manage_banks_alternative_bank_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `manage_banks_status` bit(1) NOT NULL,
  `bank_codes_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `condominums_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`manage_banks_id`),
  CONSTRAINT `bank_codes` FOREIGN KEY (`manage_banks_id`) REFERENCES `erp_ts_bank_codes` (`bank_codes_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_ts_payment_documents`
-- ----------------------------
DROP TABLE IF EXISTS `erp_ts_payment_documents`;
CREATE TABLE `erp_ts_payment_documents` (
  `payment_documents_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_documents_name_payment_document` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `payment_documents_payment_format` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `payment_documents_status_state` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `payment_documents_payment_document_category` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `payment_documents_checkbook_data` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `payment_documents_status` bit(1) NOT NULL,
  `bank_accounts_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  `condominums_id` int(11) NOT NULL,
  PRIMARY KEY (`payment_documents_id`),
  KEY `payment_documents` (`bank_accounts_id`),
  CONSTRAINT `payment_documents` FOREIGN KEY (`bank_accounts_id`) REFERENCES `erp_ts_bank_accounts` (`bank_accounts_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `erp_ts_transfers`
-- ----------------------------
DROP TABLE IF EXISTS `erp_ts_transfers`;
CREATE TABLE `erp_ts_transfers` (
  `transfers_id` int(11) NOT NULL AUTO_INCREMENT,
  `transfers_payment_document_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `transfers_payment_format` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `transfers_status_state` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `transfers_category_shit_document` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `transfers_number_first_available_document` int(11) NOT NULL,
  `transfers_status` bit(1) NOT NULL,
  `payment_documents_id` int(11) DEFAULT NULL,
  `condominums_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `last_updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`transfers_id`),
  KEY `transfers` (`payment_documents_id`),
  CONSTRAINT `transfers` FOREIGN KEY (`payment_documents_id`) REFERENCES `erp_ts_payment_documents` (`payment_documents_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

