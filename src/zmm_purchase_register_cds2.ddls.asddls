@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZMM_PURCHASE_REGISTER_CDS2'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZMM_PURCHASE_REGISTER_CDS2 as select from ZMM_PURCHASE_REGISTER as a
       left outer join I_MaterialDocumentHeader_2 as b on ( 
        b.MaterialDocument          = a.migo_Docno
        and b.MaterialDocumentYear  = a.FiscalYear 
       )
{
    key left ( a.miro_doc, 10 ) as miro_doc,
    key a.miro_postingdate,
    key a.journalentry_no,
    key a.journalentry_item,
    a.materialType,
    a.material,
    a.material_desc,
    a.HSNCode,
    a.HSNCode_Desc,
    a.Plant,
    a.PurchasingDocument,
    a.PurchasingDocumentItem,
    a.ProfitCenter,
    a.MasterFixedAsset,
    a.AccountingDocumentType,
    a.miro_docdate,
    a.miro_Refno,
    a.migo_Docno,
    b.PostingDate as migo_Docno_date, 
    a.VendorCode,
    a.VendorName,
    a.PanNumber,
    a.VendorMSME,
    a.Vendor_GSTIN,
    a.StateCode,
    a.StateCode_Desc,
    a.miro_gl,
    a.miro_glname,
    a.Miro_item_taxCode,
    a.Miro_item_taxCode_dec,
    @Semantics: { quantity : {unitOfMeasure: 'BaseUnit'} }
    a.miro_Qty,
    a.BaseUnit,
    @Semantics.amount.currencyCode: 'DocumentCurrency'
    case when a.PurchaseOrderType = 'NB2' then ( a.POItem_rate * -1 ) else a.POItem_rate end as POItem_rate,
    a.DocumentCurrency,
    @Semantics: { amount : {currencyCode: 'CompanyCodeCurrency'} }
    a.BasicAmount,
    a.CompanyCodeCurrency,
    @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
    a.CGST,
    a.cgst_gl,
    a.cgst_glname,
    a.CGST_rate,
    @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
    a.SGST,
    a.sgst_gl,
    a.sgst_glname,
    a.SGST_rate,
    @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
    a.IGST,
    a.igst_gl,
    a.igst_glname,
    a.IGST_rate,
    @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
    a.tcs_amount,
    @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
    a.Revised_bas_exclud_GstAmt,
    a.Non_cr_cgst,
    a.Non_cr_sgst,
    a.Non_cr_igst,
    a.Total_Amount,
    @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
    a.TDS_VALUE,
    a.BillAmt_afterTDS,
    a.tds_gl,
    a.tds_gl_desc,
    a.TransactionCurrency,
    a.WeightUnit,
    @Semantics.quantity.unitOfMeasure: 'WeightUnit'
    a.NetWeight,
    a.Netweight_tot_Qty, 
    a.GrossWeight,
    a.net_weight_unit,
    a.CityName,
    @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
    a.freight_amount,
    a.miro_header_text,
    a.miro_lineItem_text,
    a.miro_BusinessPlace,
    a.RCM_flag,
    a.Eligibility_ind,
    a.Common_supply_ind,
    a.DocumentType,
    a.originalDocument,
    a.DebitCreditCode,
//    a.PaymentDueDate,
    a.VendorStatus,
    a.Type,
    a.POdate,
    a.CompanyCode,
    a.PurchaseOrderType,
    a.MinorityGroup,
    a.materialgroup,
    a.CostCenter,
    a.entrydate,
    a.CreationTime,
    a.username,
    @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
    a.CGST_RCM_received,
    @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
    a.SGST_RCM_received,
    @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
    a.IGST_RCM_received,
    @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
    a.CGST_RCM_payable,
    @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
    a.SGST_RCM_payable,
    @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
    a.IGST_RCM_payable
    
 
 
 }

