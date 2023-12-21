CREATE TABLE `data_platform_quotations_item_data`
(
    `Quotation`                                int(16) NOT NULL,
    `QuotationItem`                            int(6) NOT NULL,
    `QuotationItemCategory`                    varchar(4) NOT NULL,
    `SupplyChainRelationshipID`                int(16) NOT NULL,
    `Buyer`                                    int(12) NOT NULL,
    `Seller`                                   int(12) NOT NULL,
    `QuotationItemText`                        varchar(200) NOT NULL,
    `QuotationItemTextByBuyer`                 varchar(200) NOT NULL,
    `QuotationItemTextBySeller`                varchar(200) NOT NULL,
    `Product`                                  varchar(40) NOT NULL,
    `ProductStandardID`                        varchar(18) DEFAULT NULL,
    `ProductGroup`                             varchar(9) DEFAULT NULL,
    `BaseUnit`                                 varchar(3) NOT NULL,
    `PricingDate`                              date NOT NULL,
    `PriceDetnExchangeRate`                    float(8) DEFAULT NULL,
    `RequestedDeliveryDate`                    date NOT NULL,
    `DeliveryUnit`                             varchar(3) NOT NULL,
    `ServicesRenderingDate`                    date DEFAULT NULL,
    `QuotationQuantityInBaseUnit`              float(15) NOT NULL,
    `QuotationQuantityInDeliveryUnit`          float(15) NOT NULL,
    `ItemWeightUnit`                           varchar(3) DEFAULT NULL,
    `ProductGrossWeight`                       float(15) DEFAULT NULL,
    `ItemGrossWeight`                          float(15) DEFAULT NULL,
    `ProductNetWeight`                         float(15) DEFAULT NULL,
    `ItemNetWeight`                            float(15) DEFAULT NULL,
    `InternalCapacityQuantity`                 float(15) DEFAULT NULL,
    `InternalCapacityQuantityUnit`             varchar(3) DEFAULT NULL,
    `NetAmount`                                float(13) NOT NULL,
    `TaxAmount`                                float(13) NOT NULL,
    `GrossAmount`                              float(13) NOT NULL,
    `Incoterms`                                varchar(4) DEFAULT NULL,
    `TransactionTaxClassification`             varchar(1) NOT NULL,
    `ProductTaxClassificationBillToCountry`    varchar(1) DEFAULT NULL,
    `ProductTaxClassificationBillFromCountry`  varchar(1) DEFAULT NULL,
    `DefinedTaxClassification`                 varchar(1) DEFAULT NULL,
    `AccountAssignmentGroup`                   varchar(2) NOT NULL,
    `ProductAccountAssignmentGroup`            varchar(2) NOT NULL,
    `PaymentTerms`                             varchar(4) NOT NULL,
    `PaymentMethod`                            varchar(1) NOT NULL,
    `Project`                                  int(16) DEFAULT NULL,
    `WBSElement`                               int(8) DEFAULT NULL,
    `AccountingExchangeRate`                   float(8) DEFAULT NULL,
    `ReferenceDocument`                        int(16) DEFAULT NULL,
    `ReferenceDocumentItem`                    int(6) DEFAULT NULL,
    `TaxCode`                                  varchar(1) DEFAULT NULL,
    `TaxRate`                                  float(6) DEFAULT NULL,
    `CountryOfOrigin`                          varchar(3) DEFAULT NULL,
    `CountryOfOriginLanguage`                  varchar(2) DEFAULT NULL,
    `ItemBlockStatus`                          tinyint(1) DEFAULT NULL,
    `ExternalReferenceDocument`         	   varchar(100) DEFAULT NULL,
    `ExternalReferenceDocumentItem`     	   varchar(10) DEFAULT NULL,
    `CreationDate`                             date NOT NULL,
    `LastChangeDate`                           date NOT NULL,
    `IsCancelled`                              tinyint(1) DEFAULT NULL,
    `IsMarkedForDeletion`                      tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`Quotation`, `QuotationItem`),
    
    CONSTRAINT `DPFMQuotationsItemData_fk` FOREIGN KEY (`Quotation`) REFERENCES `data_platform_quotations_header_data` (`Quotation`),
    CONSTRAINT `DPFMQuotationsItemSCRID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `Buyer`, `Seller`) REFERENCES `data_platform_scr_general_data` (`SupplyChainRelationshipID`, `Buyer`, `Seller`),
    CONSTRAINT `DPFMQuotationsItemDataProductGroup_fk` FOREIGN KEY (`ProductGroup`) REFERENCES `data_platform_product_group_product_group_data` (`ProductGroup`),
    CONSTRAINT `DPFMQuotationsItemDataBaseUnit_fk` FOREIGN KEY (`BaseUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DPFMQuotationsItemDataDeliveryUnit_fk` FOREIGN KEY (`DeliveryUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DPFMQuotationsItemDataItemWeightUnit_fk` FOREIGN KEY (`ItemWeightUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DPFMQuotationsItemDataInternalCapacityQuantityUnit_fk` FOREIGN KEY (`InternalCapacityQuantityUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DPFMQuotationsItemDataIncoterms_fk` FOREIGN KEY (`Incoterms`) REFERENCES `data_platform_incoterms_incoterms_data` (`Incoterms`),
    CONSTRAINT `DPFMQuotationsItemDataPaymentMethod_fk` FOREIGN KEY (`PaymentMethod`) REFERENCES `data_platform_payment_method_payment_method_data` (`PaymentMethod`),
    CONSTRAINT `DPFMQuotationsItemDataProject_fk` FOREIGN KEY (`Project`) REFERENCES `data_platform_project_project_data` (`Project`),
    CONSTRAINT `DPFMQuotationsItemDataWBSElement_fk` FOREIGN KEY (`Project`, `WBSElement`) REFERENCES `data_platform_project_wbs_element_data` (`Project`, `WBSElement`),
    -- CONSTRAINT `DPFMQuotationsItemDataTaxCode_fk` FOREIGN KEY (`TaxCode`) REFERENCES `data_platform_tax_code_tax_code_data` (`TaxCode`),　テーブルあるがエラー
    CONSTRAINT `DPFMQuotationsItemDataCountryOfOrigin_fk` FOREIGN KEY (`CountryOfOrigin`) REFERENCES `data_platform_country_country_data` (`Country`),
    CONSTRAINT `DPFMQuotationsItemDataCountryOfOriginLanguage_fk` FOREIGN KEY (`CountryOfOriginLanguage`) REFERENCES `data_platform_language_language_data` (`Language`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
