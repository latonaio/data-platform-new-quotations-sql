CREATE TABLE `data_platform_quotations_item_pricing_element_data`
(
  `Quotation`                   int(16) NOT NULL,
  `QuotationItem`               int(6) NOT NULL,
  `SupplyChainRelationshipID`   int(16) NOT NULL,
  `Buyer`                       int(12) NOT NULL,
  `Seller`                      int(12) NOT NULL,
  `PricingProcedureCounter`     int(3) NOT NULL,
  `ConditionRecord`             int(12) DEFAULT NULL,
  `ConditionSequentialNumber`   int(3) DEFAULT NULL,
  `ConditionType`               varchar(4) DEFAULT NULL,
  `PricingDate`                 date DEFAULT NULL,
  `ConditionRateValue`          float(13) DEFAULT NULL,
  `ConditionCurrency`           varchar(5) DEFAULT NULL,
  `ConditionQuantity`           float(6) DEFAULT NULL,
  `ConditionQuantityUnit`       varchar(3) DEFAULT NULL,
  `TaxCode`                     varchar(1) DEFAULT NULL,
  `ConditionAmount`             float(13) DEFAULT NULL,
  `TransactionCurrency`         varchar(5) DEFAULT NULL,
  `ConditionIsManuallyChanged`  tinyint(1) DEFAULT NULL,
  
  PRIMARY KEY (`Quotation`, `QuotationItem`, `SupplyChainRelationshipID`, `Buyer`, `Seller`, `PricingProcedureCounter`),
    
  CONSTRAINT `DataPlatformQuotationsItemPricingElementData_fk` FOREIGN KEY (`Quotation`, `QuotationItem`) REFERENCES `data_platform_quotations_item_data` (`Quotation`, `QuotationItem`),
  CONSTRAINT `DataPlatformQuotationsItemPricingElementDataSupplyChainRelationshipID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `Buyer`, `Seller`) REFERENCES `data_platform_supply_chain_relationship_general_data` (`SupplyChainRelationshipID`, `Buyer`, `Seller`)
  
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
