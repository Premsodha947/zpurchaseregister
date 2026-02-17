@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZMM_PURCHASE_REGISTER_FINAL'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZMM_PURCHASE_REGISTER_FINAL as select from ZMM_PURCHASE_REGISTER_CDS2
{

     @UI.lineItem: [{ position: 10, importance: #LOW  }]
     @EndUserText.label       : 'Miro Doc No.' 
     @UI.selectionField       : [{position: 10 }]  
//     @Consumption.valueHelpDefinition: [ { entity:  { name:    'I_CompanyCode', element: 'CompanyCode' } }]   
 key miro_doc as miro_doc,
 
     @UI.lineItem             : [{ position: 20, importance: #LOW  }]
     @EndUserText.label       : 'Miro Posting Date'
     @UI.selectionField       : [{position: 20 }]   
     @Consumption.filter.selectionType: #INTERVAL
//     @Consumption.filter.mandatory: true  
 key miro_postingdate,
 
     @UI.lineItem             : [{ position: 30, importance: #LOW  }]
     @EndUserText.label       : 'Journal Entry No.' 
     @UI.selectionField       : [{position: 30 }]     
 key journalentry_no,
 
     @UI.lineItem             : [{ position: 40, importance: #LOW  }]
     @EndUserText.label       : 'Miro Line Item'     
 key journalentry_item,
 
     @UI.lineItem             : [{ position: 50, importance: #LOW  }]
     @EndUserText.label       : 'Material TYpe'     
     materialType,
 
     @UI.lineItem             : [{ position: 60, importance: #LOW  }]
     @EndUserText.label       : 'Material'     
     material,
 
     @UI.lineItem             : [{ position: 70, importance: #LOW  }]
     @EndUserText.label       : 'Material Description'     
     material_desc,
 
     @UI.lineItem             : [{ position: 80, importance: #LOW  }]
     @EndUserText.label       : 'HSN Code'     
     HSNCode,
 
     @UI.lineItem             : [{ position: 90, importance: #LOW  }]
     @EndUserText.label       : 'HSN Code Desc.'     
     HSNCode_Desc,
 
     @UI.lineItem             : [{ position: 100, importance: #LOW  }]
     @EndUserText.label       : 'Plant'     
     @UI.selectionField       : [{position: 40 }]
     Plant,
   
     @UI.lineItem             : [{ position: 110, importance: #LOW  }]
     @EndUserText.label       : 'Purchasing Document'     
     PurchasingDocument,
         
     @UI.lineItem             : [{ position: 120, importance: #LOW  }]
     @EndUserText.label       : 'Purchasing Document Item'     
     PurchasingDocumentItem,
         
     @UI.lineItem             : [{ position: 130, importance: #LOW  }]
     @EndUserText.label       : 'Material Profit Center'     
     ProfitCenter,
         
     @UI.lineItem             : [{ position: 140, importance: #LOW  }]
     @EndUserText.label       : 'Fix Asset Code'     
     MasterFixedAsset,
 
     @UI.lineItem             : [{ position: 150, importance: #LOW  }]
     @EndUserText.label       : 'Journal Entry Type' 
     AccountingDocumentType,
 
     @UI.lineItem             : [{ position: 160, importance: #LOW  }]
     @EndUserText.label       : 'Miro Document Date'     
     miro_docdate,
 
     @UI.lineItem             : [{ position: 170, importance: #LOW  }]
     @EndUserText.label       : 'Miro Reference No.'     
     miro_Refno,
 
     @UI.lineItem             : [{ position: 180, importance: #LOW  }]
     @EndUserText.label       : 'Migo Doc No.'     
     migo_Docno,
 
     @UI.lineItem             : [{ position: 190, importance: #LOW  }]
     @EndUserText.label       : 'Migo Posting Date'     
     migo_Docno_date,
 
     @UI.lineItem             : [{ position: 200, importance: #LOW  }]
     @EndUserText.label       : 'Vendor Code' 
     @UI.selectionField       : [{position: 50 }]      
     VendorCode,
 
     @UI.lineItem             : [{ position: 210, importance: #LOW  }]
     @EndUserText.label       : 'Vendor Name'     
     VendorName,
 
     @UI.lineItem             : [{ position: 220, importance: #LOW  }]
     @EndUserText.label       : 'Vendor Pan No.'     
     PanNumber,
 
     @UI.lineItem             : [{ position: 230, importance: #LOW  }]
     @EndUserText.label       : 'Vendor MSME No.'     
     VendorMSME,

     @UI.lineItem             : [{ position: 240, importance: #LOW  }]
     @EndUserText.label       : 'Vendor GST No.'     
     Vendor_GSTIN,

     @UI.lineItem             : [{ position: 250, importance: #LOW  }]
     @EndUserText.label       : ' Vendor State Code'     
     StateCode,
    
     @UI.lineItem             : [{ position: 260, importance: #LOW  }]
     @EndUserText.label       : 'Vendor State Code Desc.'     
     StateCode_Desc,
    
     @UI.lineItem             : [{ position: 270, importance: #LOW  }]
     @EndUserText.label       : 'Migo/Miro GL No.'     
     miro_gl,
    
     @UI.lineItem             : [{ position: 280, importance: #LOW  }]
     @EndUserText.label       : 'Migo/Miro GL Description'     
     miro_glname,
    
     @UI.lineItem             : [{ position: 290, importance: #LOW  }]
     @EndUserText.label       : 'Tax Code'     
     Miro_item_taxCode,
    
     @UI.lineItem             : [{ position: 300, importance: #LOW  }]
     @EndUserText.label       : 'Miro Item Text Code Desc.'     
     Miro_item_taxCode_dec,

     @UI.lineItem             : [{ position: 310, importance: #LOW  }]
     @EndUserText.label       : 'Miro Quantity'
     @Semantics: { quantity : {unitOfMeasure: 'BaseUnit'} }
     @DefaultAggregation: #SUM
     miro_Qty,
     
     @UI.lineItem             : [{ position: 315, importance: #LOW  }]
     @EndUserText.label       : 'Miro UOM'
     BaseUnit,
 
     @UI.lineItem             : [{ position: 320, importance: #LOW  }]
     @EndUserText.label       : 'PO Item Rate'
     @Semantics.amount.currencyCode: 'DocumentCurrency'
     @DefaultAggregation: #SUM
     POItem_rate, 
 
     @UI.lineItem             : [{ position: 330, importance: #LOW  }]
     @EndUserText.label       : 'Miro Basic Amount'
     @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
     @DefaultAggregation: #SUM
     BasicAmount,
 
     @UI.lineItem             : [{ position: 340, importance: #LOW  }]
     @EndUserText.label       : 'CGST GL Amount'   
     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
     @DefaultAggregation: #SUM
     CGST,

     @UI.lineItem             : [{ position: 350, importance: #LOW  }]
     @EndUserText.label       : 'CGST Tax Rate %'  
     CGST_rate,
 
     @UI.lineItem             : [{ position: 360, importance: #LOW  }]
     @EndUserText.label       : 'SGST GL Amount' 
     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }  
     @DefaultAggregation: #SUM  
     SGST,
 
     @UI.lineItem             : [{ position: 370, importance: #LOW  }]
     @EndUserText.label       : 'SGST Tax Rate %'    
     SGST_rate,
 
     @UI.lineItem             : [{ position: 380, importance: #LOW  }]
     @EndUserText.label       : 'IGST GL AMount' 
     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }  
     @DefaultAggregation: #SUM 
     IGST,
 
     @UI.lineItem             : [{ position: 390, importance: #LOW  }]
     @EndUserText.label       : 'IGST Tax RAte %'     
     IGST_rate,
 
     @UI.lineItem             : [{ position: 400, importance: #LOW  }]
     @EndUserText.label       : 'TCS Amount'     
     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
     @DefaultAggregation: #SUM
     TDS_VALUE,
 
//     @UI.lineItem             : [{ position: 410, importance: #LOW  }]
//     @EndUserText.label       : 'TCS Rate'     
// key TCS_rate,
 
     @UI.lineItem             : [{ position: 420, importance: #LOW  }]
     @EndUserText.label       : 'Revised Basic Excluding GST Amt'
     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }  
     @DefaultAggregation: #SUM  
     Revised_bas_exclud_GstAmt,
 
//     @UI.lineItem             : [{ position: 430, importance: #LOW  }]
//     @EndUserText.label       : 'Non Credit CGST'     
//     Non_cr_cgst,
//
//     @UI.lineItem             : [{ position: 440, importance: #LOW  }]
//     @EndUserText.label       : 'Non Credit CGST %'     
//     Miro_item_taxCode_dec as non_credit_cgst_per ,
//
// 
//     @UI.lineItem             : [{ position: 450, importance: #LOW  }]
//     @EndUserText.label       : 'Non Credit SGST'     
//     Non_cr_sgst,
// 
//     @UI.lineItem             : [{ position: 460, importance: #LOW  }]
//     @EndUserText.label       : 'Non Credit SGST %'     
//     Miro_item_taxCode_dec as non_credit_sgst_per,
// 
// 
//     @UI.lineItem             : [{ position: 470, importance: #LOW  }]
//     @EndUserText.label       : 'Non Credit IGST'     
//     @Aggregation.default:  #SUM
//     Non_cr_igst,
// 
//     @UI.lineItem             : [{ position: 480, importance: #LOW  }]
//     @EndUserText.label       : 'Non Credit IGST %'   
//     Miro_item_taxCode_dec as non_credit_igst_per,
 
     @UI.lineItem             : [{ position: 490, importance: #LOW  }]
     @EndUserText.label       : 'Invoice AMount'
     @DefaultAggregation: #SUM
     Total_Amount,

     @UI.lineItem             : [{ position: 500, importance: #LOW  }]
     @EndUserText.label       : 'TDS Value'  
     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }   
     @DefaultAggregation: #SUM
     tcs_amount,
   
     @UI.lineItem             : [{ position: 510, importance: #LOW  }]
     @EndUserText.label       : 'Bill Amount After TDS'   
     @DefaultAggregation: #SUM  
     BillAmt_afterTDS,
     
     @UI.lineItem             : [{ position: 515, importance: #LOW  }]
     @EndUserText.label       : 'TDS/TCS GL'     
     tds_gl,
     
     @UI.lineItem             : [{ position: 520, importance: #LOW  }]
     @EndUserText.label       : 'TDS/TCS GL Description'     
     tds_gl_desc,
     
     @UI.lineItem             : [{ position: 525, importance: #LOW  }]
     @EndUserText.label       : 'Net Weight'
     @Semantics.quantity.unitOfMeasure: 'WeightUnit'
     @DefaultAggregation: #SUM
     NetWeight,
     
     @UI.lineItem             : [{ position: 530, importance: #LOW  }]
     @EndUserText.label       : 'Net Weight Total Qty' 
     @DefaultAggregation: #SUM
     Netweight_tot_Qty,
     
     @UI.lineItem             : [{ position: 535, importance: #LOW  }]
     @EndUserText.label       : 'Net Weight UOM'     
     net_weight_unit,
     
     @UI.lineItem             : [{ position: 540, importance: #LOW  }]
     @EndUserText.label       : 'Gross Weight'     
     @DefaultAggregation: #SUM
     GrossWeight,
     
     @UI.lineItem             : [{ position: 545, importance: #LOW  }]
     @EndUserText.label       : 'City Name'     
     CityName,
     
     @UI.lineItem             : [{ position: 550, importance: #LOW  }]
     @EndUserText.label       : 'Freight Amount'
     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }  
     @DefaultAggregation: #SUM   
     freight_amount,
     
     @UI.lineItem             : [{ position: 555, importance: #LOW  }]
     @EndUserText.label       : 'Miro Header Text'
     miro_header_text,
     
     @UI.lineItem             : [{ position: 560, importance: #LOW  }]
     @EndUserText.label       : 'Miro Line Item Wise Text'
     miro_lineItem_text,
     
     @UI.lineItem             : [{ position: 565, importance: #LOW  }]
     @EndUserText.label       : 'Miro Business Places'     
     miro_BusinessPlace,
    
     @UI.lineItem             : [{ position: 570, importance: #LOW  }]   
     @EndUserText.label       : 'RCM Flag'        
     RCM_flag,
     
     @UI.lineItem             : [{ position: 575, importance: #LOW  }]   
     @EndUserText.label       : 'Eligibility Indicator'        
     Eligibility_ind,   
   
     @UI.lineItem             : [{ position: 580, importance: #LOW  }]   
     @EndUserText.label       : 'Common Supply Indicator'        
     Common_supply_ind,
     
//     @UI.lineItem             : [{ position: 585, importance: #LOW  }]   
//     @EndUserText.label       : 'Available CGST' 
//     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
//     @DefaultAggregation: #SUM
//     CGST as cgst1,
//     
//     @UI.lineItem             : [{ position: 590, importance: #LOW  }]   
//     @EndUserText.label       : 'Available SGST' 
//     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
//     @DefaultAggregation: #SUM
//     SGST as Sgst1,
//     
//     @UI.lineItem             : [{ position: 595, importance: #LOW  }]   
//     @EndUserText.label       : 'Available IGST' 
//     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
//     @DefaultAggregation: #SUM
//     IGST as igst1,
//     
//     @UI.lineItem             : [{ position: 600, importance: #LOW  }]    
//     @EndUserText.label       : 'Document Type'        
//     DocumentType,   
   
     @UI.lineItem             : [{ position: 605, importance: #LOW  }]   
     @EndUserText.label       : 'Type'        
     Type,   
   
     @UI.lineItem             : [{ position: 610, importance: #LOW  }]   
     @EndUserText.label       : 'Original Document'        
     originalDocument,  
     
     @UI.lineItem             : [{ position: 615, importance: #LOW  }]   
     @EndUserText.label       : 'Debit Credit Indicator'
     DebitCreditCode, 
    
     @UI.lineItem             : [{ position: 620, importance: #LOW  }]   
     @EndUserText.label       : 'Vendor Status'        
     VendorStatus,
     
     @UI.lineItem             : [{ position: 625, importance: #LOW  }]   
     @EndUserText.label       : 'PO date'
     POdate,
     
     @UI.lineItem             : [{ position: 630, importance: #LOW  }]   
     @EndUserText.label       : 'Company Code'
     CompanyCode,
     
     @UI.lineItem             : [{ position: 635, importance: #LOW  }]   
     @EndUserText.label       : 'Purchase Order Type'
     PurchaseOrderType,
     
     @UI.lineItem             : [{ position: 640, importance: #LOW  }]   
     @EndUserText.label       : 'Minority Group'
     MinorityGroup,
     
     @UI.lineItem             : [{ position: 645, importance: #LOW  }]   
     @EndUserText.label       : 'material Group'
     materialgroup,
     
     @UI.lineItem             : [{ position: 650, importance: #LOW  }]   
     @EndUserText.label       : 'Cost Center'
     CostCenter,
     
     @UI.lineItem             : [{ position: 655, importance: #LOW  }]   
     @EndUserText.label       : 'Entry Date'
     entrydate,
     
     @UI.lineItem             : [{ position: 660, importance: #LOW  }]   
     @EndUserText.label       : 'Time of Entry'
     CreationTime,
     
     @UI.lineItem             : [{ position: 665, importance: #LOW  }]   
     @EndUserText.label       : 'User Name'
     username,
     
     @UI.lineItem             : [{ position: 670, importance: #LOW  }]   
     @EndUserText.label       : 'CGST_RCM_received'
     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
     CGST_RCM_received,
     
     @UI.lineItem             : [{ position: 675, importance: #LOW  }]   
     @EndUserText.label       : 'SGST_RCM_received'
     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
     SGST_RCM_received,
     
     @UI.lineItem             : [{ position: 680, importance: #LOW  }]   
     @EndUserText.label       : 'IGST_RCM_received'
     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
     IGST_RCM_received,
     
     @UI.lineItem             : [{ position: 685, importance: #LOW  }]   
     @EndUserText.label       : 'CGST_RCM_payable'
     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
     CGST_RCM_payable,
     
     @UI.lineItem             : [{ position: 690, importance: #LOW  }]   
     @EndUserText.label       : 'SGST_RCM_payable'
     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
     SGST_RCM_payable,
     
     @UI.lineItem             : [{ position: 695, importance: #LOW  }]   
     @EndUserText.label       : 'IGST_RCM_payable'
     @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
     IGST_RCM_payable,
     
     @UI.lineItem             : [{ position: 700, importance: #LOW  }]   
     @EndUserText.label       : 'CGST GL Account'
     cgst_gl,
     
     @UI.lineItem             : [{ position: 710, importance: #LOW  }]   
     @EndUserText.label       : 'CGST GL Account Name'
     cgst_glname,
     
     @UI.lineItem             : [{ position: 720, importance: #LOW  }]   
     @EndUserText.label       : 'SGST GL Account'
     sgst_gl,
     
     @UI.lineItem             : [{ position: 730, importance: #LOW  }]   
     @EndUserText.label       : 'SGST GL Account Name'
     sgst_glname,
     
     @UI.lineItem             : [{ position: 740, importance: #LOW  }]   
     @EndUserText.label       : 'IGST GL Account'
     igst_gl,
     
     @UI.lineItem             : [{ position: 750, importance: #LOW  }]   
     @EndUserText.label       : 'IGST GL Account Name'
     igst_glname,
     
     
    
     
     WeightUnit,
     DocumentCurrency,
     CompanyCodeCurrency,   
     TransactionCurrency   
       
        
 
 
} 
// where miro_glname <> 'Custom Clearing'

