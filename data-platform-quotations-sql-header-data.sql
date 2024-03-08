CREATE TABLE `data_platform_quotations_header_data`
(
  `Quotation`                        int(16) NOT NULL,
  `QuotationDate`                    date NOT NULL,
  `QuotationType`                    varchar(3) NOT NULL,
  `QuotationStatus`                  varchar(2) NOT NULL,  
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
  `HeaderOrderIsDefined`             tinyint(1) DEFAULT NULL,
  `TransactionCurrency`              varchar(5) NOT NULL,
  `PricingDate`                      date NOT NULL,
  `PriceDetnExchangeRate`            float(8) DEFAULT NULL,
  `RequestedDeliveryDate`            date NOT NULL,
  `OrderProbabilityInPercent`        float(6) DEFAULT NULL,
  `ExpectedOrderNetAmount`           float(13) DEFAULT NULL,
  `Incoterms`                        varchar(4) DEFAULT NULL,
  `PaymentTerms`                     varchar(4) NOT NULL,
  `PaymentMethod`                    varchar(1) NOT NULL,
  `Contract`                         int(16) DEFAULT NULL,
  `ContractItem`                     int(6) DEFAULT NULL,
  `Project`                          int(16) DEFAULT NULL,
  `WBSElement`                       int(8) DEFAULT NULL,
  `ReferenceDocument`                int(16) DEFAULT NULL,
  `AccountAssignmentGroup`           varchar(2) NOT NULL,
  `AccountingExchangeRate`           float(8) DEFAULT NULL,
  `InvoiceDocumentDate`              date DEFAULT NULL,
  `IsExportImport`                   tinyint(1) DEFAULT NULL,
  `HeaderText`                       varchar(200) DEFAULT NULL,
  `HeaderIsClosed`                   tinyint(1) DEFAULT NULL,
  `HeaderBlockStatus`                tinyint(1) DEFAULT NULL,
  `ExternalReferenceDocument`        varchar(100) DEFAULT NULL,
  `CertificateAuthorityChain`        varchar(2000) DEFAULT NULL,
  `UsageControlChain`                varchar(2000) DEFAULT NULL,
  `CreationDate`                     date NOT NULL,
  `LastChangeDate`                   date NOT NULL,
  `IsCancelled`                      tinyint(1) DEFAULT NULL,
  `IsMarkedForDeletion`              tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`Quotation`),
    
    CONSTRAINT `DPFMQuotationsHeaderSCRID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `Buyer`, `Seller`) REFERENCES `data_platform_scr_general_data` (`SupplyChainRelationshipID`, `Buyer`, `Seller`),
    CONSTRAINT `DPFMQuotationsHeaderSCRBillingID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipBillingID`, `Buyer`, `Seller`, `BillToParty`, `BillFromParty`) REFERENCES `data_platform_scr_billing_relation_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipBillingID`, `Buyer`, `Seller`, `BillToParty`, `BillFromParty`),
    CONSTRAINT `DPFMQuotationsHeaderSCRPaymentID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipBillingID`, `SupplyChainRelationshipPaymentID`, `Buyer`, `Seller`, `BillToParty`, `BillFromParty`, `Payer`, `Payee`) REFERENCES `data_platform_scr_payment_relation_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipBillingID`, `SupplyChainRelationshipPaymentID`, `Buyer`, `Seller`, `BillToParty`, `BillFromParty`, `Payer`, `Payee`),
    CONSTRAINT `DPFMQuotationsHeaderBillToCountry_fk` FOREIGN KEY (`BillToCountry`) REFERENCES `data_platform_country_country_data` (`Country`),
    CONSTRAINT `DPFMQuotationsHeaderBillFromCountry_fk` FOREIGN KEY (`BillFromCountry`) REFERENCES `data_platform_country_country_data` (`Country`),
    CONSTRAINT `DPFMQuotationsHeaderTransactionCurrency_fk` FOREIGN KEY (`TransactionCurrency`) REFERENCES `data_platform_currency_currency_data` (`Currency`),
    CONSTRAINT `DPFMQuotationsHeaderIncoterms_fk` FOREIGN KEY (`Incoterms`) REFERENCES `data_platform_incoterms_incoterms_data` (`Incoterms`),
    CONSTRAINT `DPFMQuotationsHeaderPaymentTerms_fk` FOREIGN KEY (`PaymentTerms`) REFERENCES `data_platform_payment_terms_payment_terms_data` (`PaymentTerms`),
    CONSTRAINT `DPFMQuotationsHeaderPaymentMethod_fk` FOREIGN KEY (`PaymentMethod`) REFERENCES `data_platform_payment_method_payment_method_data` (`PaymentMethod`),
    CONSTRAINT `DPFMQuotationsHeaderDataContract_fk` FOREIGN KEY (`Contract`) REFERENCES `data_platform_contract_header_data` (`Contract`),
    CONSTRAINT `DPFMQuotationsHeaderDataContractItem_fk` FOREIGN KEY (`Contract`, `ContractItem`) REFERENCES `data_platform_contract_item_data` (`Contract`, `ContractItem`),
    CONSTRAINT `DPFMQuotationsHeaderDataProject_fk` FOREIGN KEY (`Project`) REFERENCES `data_platform_project_project_data` (`Project`),
    CONSTRAINT `DPFMQuotationsHeaderDataWBSElement_fk` FOREIGN KEY (`Project`, `WBSElement`) REFERENCES `data_platform_project_wbs_element_data` (`Project`, `WBSElement`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
