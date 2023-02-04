CREATE TABLE `data_platform_quotations_header_data`
(
  `Quotation`                        int(16) NOT NULL,
  `QuotationDate`                    date NOT NULL,
  `QuoationType`                     varchar(3) NOT NULL,
  `QuoationStatus`                   varchar(2) NOT NULL,  
  `SupplyChainRelationshipID`        int(16) NOT NULL,
  `SupplyChainRelationshipBillingID` int(4) DEFAULT NULL,
  `SupplyChainRelationshipPaymentID` int(2) DEFAULT NULL,
  `Buyer`                            int(12) NOT NULL,
  `Seller`                           int(12) NOT NULL,
  `BillToParty`                      int(12) DEFAULT NULL,
  `BillFromParty`                    int(12) DEFAULT NULL,
  `BillToCountry`                    varchar(3) DEFAULT NULL,
  `BillFromCountry`                  varchar(3) DEFAULT NULL,
  `Payer`                            int(12) DEFAULT NULL,
  `Payee`                            int(12) DEFAULT NULL,
  `CreationDate`                     date NOT NULL,
  `LastChangeDate`                   date NOT NULL,
  `ContractType`                     varchar(4) DEFAULT NULL,
  `BindingPeriodValidityStartDate`   date DEFAULT NULL,
  `BindingPeriodValidityEndDate`     date DEFAULT NULL,
  `OrderValidityStartDate`           date DEFAULT NULL,
  `OrderValidityEndDate`             date DEFAULT NULL,
  `InvoicePeriodStartDate`           date DEFAULT NULL,
  `InvoicePeriodEndDate`             date DEFAULT NULL,
  `TotalNetAmount`                   float(13) NOT NULL,
  `TotalTaxAmount`                   float(13) NOT NULL,
  `TotalGrossAmount`                 float(13) NOT NULL,
  `TransactionCurrency`              varchar(5) NOT NULL,
  `PricingDate`                      date NOT NULL,
  `PriceDetnExchangeRate`            float(8) DEFAULT NULL,
  `RequestedDeliveryDate`            date NOT NULL,
  `OrderProbabilityInPercent`        float(6) DEFAULT NULL,
  `ExpectedOrderNetAmount`           float(13) DEFAULT NULL,
  `Incoterms`                        varchar(4) DEFAULT NULL,
  `PaymentTerms`                     varchar(4) NOT NULL,
  `PaymentMethod`                    varchar(1) NOT NULL,
  `ReferenceDocument`                int(16) DEFAULT NULL,
  `ReferenceDocumentItem`            int(6) DEFAULT NULL,
  `AccountAssignmentGroup`           varchar(2) NOT NULL,
  `AccountingExchangeRate`           float(8) DEFAULT NULL,
  `InvoiceDocumentDate`              date NOT NULL,
  `IsExportImport`                   tinyint(1) DEFAULT NULL,
  `HeaderText`                       varchar(200) DEFAULT NULL,
  `HeaderBlockStatus`                tinyint(1) DEFAULT NULL,
  `IsCancelled`                      tinyint(1) DEFAULT NULL,
  `IsMarkedForDeletion`              tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`Quotation`),
    
    CONSTRAINT `DataPlatformQuoationsHeaderSupplyChainRelationshipID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `Buyer`, `Seller`) REFERENCES `data_platform_supply_chain_relationship_general_data` (`SupplyChainRelationshipID`, `Buyer`, `Seller`),
    CONSTRAINT `DataPlatformQuoationsHeaderSupplyChainRelationshipBillingID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipBillingID`, `Buyer`, `Seller`, `BillToParty`, `BillFromParty`) REFERENCES `data_platform_supply_chain_relationship_billing_relation_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipBillingID`, `Buyer`, `Seller`, `BillToParty`, `BillFromParty`),
    CONSTRAINT `DataPlatformQuoationsHeaderSupplyChainRelationshipPaymentID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipBillingID`, `SupplyChainRelationshipPaymentID`, `Buyer`, `Seller`, `BillToParty`, `BillFromParty`, `Payer`, `Payee`) REFERENCES `data_platform_supply_chain_relationship_payment_relation_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipBillingID`, `SupplyChainRelationshipPaymentID`, `Buyer`, `Seller`, `BillToParty`, `BillFromParty`, `Payer`, `Payee`),
    CONSTRAINT `DataPlatformQuoationsHeaderBillToCountry_fk` FOREIGN KEY (`BillToCountry`) REFERENCES `data_platform_country_country_data` (`Country`),
    CONSTRAINT `DataPlatformQuoationsHeaderBillFromCountry_fk` FOREIGN KEY (`BillFromCountry`) REFERENCES `data_platform_country_country_data` (`Country`),
    CONSTRAINT `DataPlatformQuoationsHeaderTransactionCurrency_fk` FOREIGN KEY (`TransactionCurrency`) REFERENCES `data_platform_currency_currency_data` (`Currency`),
    CONSTRAINT `DataPlatformQuoationsHeaderIncoterms_fk` FOREIGN KEY (`Incoterms`) REFERENCES `data_platform_incoterms_incoterms_data` (`Incoterms`),
    CONSTRAINT `DataPlatformQuoationsHeaderPaymentTerms_fk` FOREIGN KEY (`PaymentTerms`) REFERENCES `data_platform_payment_terms_payment_terms_data` (`PaymentTerms`),
    CONSTRAINT `DataPlatformQuoationsHeaderPaymentMethod_fk` FOREIGN KEY (`PaymentMethod`) REFERENCES `data_platform_payment_method_payment_method_data` (`PaymentMethod`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
