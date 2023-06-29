CREATE TABLE `data_platform_quotations_item_data`
(
    `Quotation`                                         int(16) NOT NULL,
    `QuotationItem`                                     int(6) NOT NULL,
    `QuotationItemCategory`                             varchar(4) NOT NULL,
    `SupplyChainRelationshipID`                         int(16) NOT NULL,
    `QuotationItemText`                                 varchar(200) NOT NULL,
    `QuotationItemTextByBuyer`                          varchar(200) NOT NULL,
    `QuotationItemTextBySeller`                         varchar(200) NOT NULL,
    `Product`                                           varchar(40) NOT NULL,
    `ProductStandardID`                                 varchar(18) NOT NULL,
    `ProductGroup`                                      varchar(9) DEFAULT NULL,
    `BaseUnit`                                          varchar(3) NOT NULL,
    `PricingDate`                                       date NOT NULL,
    `PriceDetnExchangeRate`                             float(8) DEFAULT NULL,
    `RequestedDeliveryDate`                             date NOT NULL,
    `DeliveryUnit`                                      varchar(3) NOT NULL,
    `ServicesRenderingDate`                             date DEFAULT NULL,
    `QuotationQuantityInBaseUnit`                       float(15) NOT NULL,
    `QuotationQuantityInDeliveryUnit`                   float(15) NOT NULL,
    `ItemWeightUnit`                                    varchar(3) DEFAULT NULL,
    `ProductGrossWeight`                                float(15) DEFAULT NULL,
    `ItemGrossWeight`                                   float(15) DEFAULT NULL,
    `ProductNetWeight`                                  float(15) DEFAULT NULL,
    `ItemNetWeight`                                     float(15) DEFAULT NULL,
    `InternalCapacityQuantity`                          float(15) DEFAULT NULL,
    `InternalCapacityQuantityUnit`                      varchar(3) DEFAULT NULL,
    `NetAmount`                                         float(13) DEFAULT NULL,
    `TaxAmount`                                         float(13) DEFAULT NULL,
    `GrossAmount`                                       float(13) DEFAULT NULL,
    `Incoterms`                                         varchar(4) DEFAULT NULL,
    `TransactionTaxClassification`                      varchar(1) NOT NULL,
    `ProductTaxClassificationBillToCountry`             varchar(1) NOT NULL,
    `ProductTaxClassificationBillFromCountry`           varchar(1) NOT NULL,
    `DefinedTaxClassification`                          varchar(1) NOT NULL,
    `AccountAssignmentGroup`                            varchar(2) NOT NULL,
    `ProductAccountAssignmentGroup`                     varchar(2) NOT NULL,
    `PaymentTerms`                                      varchar(4) NOT NULL,
    `PaymentMethod`                                     varchar(1) NOT NULL,
    `Project`                                           varchar(24) DEFAULT NULL,
    `AccountingExchangeRate`                            float(8) DEFAULT NULL,
    `ReferenceDocument`                                 int(16) DEFAULT NULL,
    `ReferenceDocumentItem`                             int(6) DEFAULT NULL,
    `TaxCode`                                           varchar(1) DEFAULT NULL,
    `TaxRate`                                           float(6) DEFAULT NULL,
    `CountryOfOrigin`                                   varchar(3) DEFAULT NULL,
    `CountryOfOriginLanguage`                           varchar(2) DEFAULT NULL,
    `ItemBlockStatus`                                   tinyint(1) DEFAULT NULL,
    `CreationDate`                                      date NOT NULL,
    `LastChangeDate`                                    date NOT NULL,
    `IsCancelled`                                       tinyint(1) DEFAULT NULL,
    `IsMarkedForDeletion`                             tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`Quotation`, `QuotationItem`),
    
    CONSTRAINT `DataPlatformQuotationsItemData_fk` FOREIGN KEY (`Quotation`) REFERENCES `data_platform_quotations_header_data` (`Quotation`),
    CONSTRAINT `DataPlatformQuotationsItemDataProductGroup_fk` FOREIGN KEY (`ProductGroup`) REFERENCES `data_platform_product_group_product_group_data` (`ProductGroup`),
    CONSTRAINT `DataPlatformQuotationsItemDataBaseUnit_fk` FOREIGN KEY (`BaseUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DataPlatformQuotationsItemDataDeliveryUnit_fk` FOREIGN KEY (`DeliveryUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DataPlatformQuotationsItemDataItemWeightUnit_fk` FOREIGN KEY (`ItemWeightUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DataPlatformQuotationsItemDataInternalCapacityQuantityUnit_fk` FOREIGN KEY (`InternalCapacityQuantityUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DataPlatformQuotationsItemDataIncoterms_fk` FOREIGN KEY (`Incoterms`) REFERENCES `data_platform_incoterms_incoterms_data` (`Incoterms`),
    CONSTRAINT `DataPlatformQuotationsItemDataPaymentMethod_fk` FOREIGN KEY (`PaymentMethod`) REFERENCES `data_platform_payment_method_payment_method_data` (`PaymentMethod`),
    CONSTRAINT `DataPlatformQuotationsItemDataProject_fk` FOREIGN KEY (`Project`) REFERENCES `data_platform_project_project_data` (`Project`),
    CONSTRAINT `DataPlatformQuotationsItemDataTaxCode_fk` FOREIGN KEY (`TaxCode`) REFERENCES `data_platform_tax_code_tax_code_data` (`TaxCode`),
    CONSTRAINT `DataPlatformQuotationsItemDataCountryOfOrigin_fk` FOREIGN KEY (`CountryOfOrigin`) REFERENCES `data_platform_country_country_data` (`Country`),
    CONSTRAINT `DataPlatformQuotationsItemDataCountryOfOriginLanguage_fk` FOREIGN KEY (`CountryOfOriginLanguage`) REFERENCES `data_platform_language_language_data` (`Language`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
