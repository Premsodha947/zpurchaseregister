@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZMM_PURCHASE_REGISTER'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZMM_PURCHASE_REGISTER
  as select distinct from I_OperationalAcctgDocItem as a
    left outer join       I_OperationalAcctgDocItem as b   on(
        b.AccountingDocument               =  a.AccountingDocument
        and b.CompanyCode                  =  a.CompanyCode
        and b.FiscalYear                   =  a.FiscalYear
        and b.TaxItemGroup                 =  a.TaxItemGroup
        and b.TransactionTypeDetermination =  'JIC'
        and(
          b.TaxCode                        <> 'JA' 
          or b.TaxCode                     <> 'JB'
          or b.TaxCode                     <> 'JC'
          or b.TaxCode                     <> 'JD'
        ) )
    left outer join       I_GLAccountText           as bb   on(
        bb.GLAccount    = b.GLAccount
        and bb.Language = 'E'
      )    
    left outer join       I_OperationalAcctgDocItem as c   on(
        c.AccountingDocument               =  a.AccountingDocument
        and c.CompanyCode                  =  a.CompanyCode
        and c.FiscalYear                   =  a.FiscalYear
        and c.TaxItemGroup                 =  a.TaxItemGroup
        and c.TransactionTypeDetermination =  'JIS'
        and(
          c.TaxCode                        <> 'JA'
          or c.TaxCode                     <> 'JB'
          or c.TaxCode                     <> 'JC'
          or c.TaxCode                     <> 'JD'
        )
      )
    left outer join       I_GLAccountText           as cc   on(
        cc.GLAccount    = c.GLAccount
        and cc.Language = 'E'
      )  
    left outer join       I_OperationalAcctgDocItem as d   on(
        d.AccountingDocument               =  a.AccountingDocument
        and d.CompanyCode                  =  a.CompanyCode
        and d.FiscalYear                   =  a.FiscalYear
        and d.TaxItemGroup                 =  a.TaxItemGroup
        and d.TransactionTypeDetermination =  'JII'
        and(
          d.TaxCode                        <> 'JE'
          or d.TaxCode                     <> 'JF'
          or d.TaxCode                     <> 'JG'
          or d.TaxCode                     <> 'JH'
        )
      )
    left outer join       I_GLAccountText           as d2   on(
        d2.GLAccount    = d.GLAccount
        and d2.Language = 'E'
      )  
    left outer join       I_SupplierInvoiceAPI01    as e   on(
        e.SupplierInvoiceWthnFiscalYear = a.OriginalReferenceDocument
        and e.CompanyCode               = a.CompanyCode
        and e.FiscalYear                = a.FiscalYear
      )
    left outer join       I_Product                 as f   on(
        f.Product = a.Product
      )
    left outer join       I_PurchaseOrderItemAPI01  as dd  on(
       dd.PurchaseOrder         = a.PurchasingDocument
       and dd.PurchaseOrderItem = a.PurchasingDocumentItem
     )
    left outer join       I_PurchaseOrderAPI01      as dd2 on(
      dd2.PurchaseOrder = a.PurchasingDocument
    )
    left outer join       I_SchedgagrmthdrApi01     as dd3 on(
      dd3.SchedulingAgreement = a.PurchasingDocument
    )
    left outer join       I_ProductDescription_2    as ee  on(
       ee.Product      = a.Product
       and ee.Language = 'E'
     )

    left outer join       I_Supplier                as j   on(
        j.Supplier = e.InvoicingParty
      )
    left outer join       I_BuPaIdentification      as k   on(
        k.BusinessPartner          = e.InvoicingParty
        and k.BPIdentificationType = 'ZMSME'
      )
    left outer join       I_GLAccountText           as l   on(
        l.GLAccount    = a.GLAccount
        and l.Language = 'E'
      )
    left outer join       I_RegionText              as m   on(
        m.Region       = j.Region
        and m.Language = 'E'
        and m.Country  = j.Country
      )
    left outer join       I_AE_CnsmpnTaxCtrlCodeTxt as n   on(
        n.ConsumptionTaxCtrlCode = a.IN_HSNOrSACCode
        and n.Language           = 'E'
        and n.CountryCode        = 'IN'
      )
    left outer join       I_JournalEntry            as o   on(
        o.AccountingDocument = a.AccountingDocument
        and o.CompanyCode    = a.CompanyCode
        and o.FiscalYear     = a.FiscalYear
      )
    left outer join       ZTEXT_CODE_TMG_CDS        as oo  on(
       oo.TaxCode            = a.TaxCode
       and oo.ConditionType  = 'JICN'
       and oo.TransactionKey = 'NVV'
     )
    left outer join       ZTEXT_CODE_TMG_CDS        as pp  on(
       pp.TaxCode            = a.TaxCode
       and pp.ConditionType  = 'JISN'
       and pp.TransactionKey = 'NVV'
     )
    left outer join       ZTEXT_CODE_TMG_CDS        as qq  on(
       qq.TaxCode            = a.TaxCode
       and qq.ConditionType  = 'JIIN'
       and qq.TransactionKey = 'NVV'
     )
    left outer join       ZTEXT_CODE_TMG_CDS        as p   on(
        p.TaxCode            = a.TaxCode
        and p.ConditionType  = 'JICG'
        and p.TransactionKey = 'JIC'
      )
    left outer join       ZTEXT_CODE_TMG_CDS        as q   on(
        q.TaxCode            = a.TaxCode
        and q.ConditionType  = 'JISG'
        and q.TransactionKey = 'JIS'
      )
    left outer join       ZTEXT_CODE_TMG_CDS        as r   on(
        r.TaxCode            = a.TaxCode
        and r.ConditionType  = 'JIIG'
        and r.TransactionKey = 'JII'
      )
    left outer join       I_SupplierInvoiceTaxAPI01 as s   on(
        s.SupplierInvoice = e.SupplierInvoice
        and s.FiscalYear  = e.FiscalYear
        and s.TaxCode     = a.TaxCode
      )
    left outer join       I_OperationalAcctgDocItem as t   on(
        t.OriginalReferenceDocument        = a.OriginalReferenceDocument
        and t.CompanyCode                  = a.CompanyCode
        and t.FiscalYear                   = a.FiscalYear
        and t.TransactionTypeDetermination = 'WIT'
        and t.FinancialAccountType         = 'S'
      )
    left outer join       I_GLAccountText           as U   on(
        U.GLAccount    = t.GLAccount
        and l.Language = 'E'
      )
    left outer join       I_OperationalAcctgDocItem as v   on(
        v.OriginalReferenceDocument        = a.OriginalReferenceDocument
        and v.CompanyCode                  = a.CompanyCode
        and v.FiscalYear                   = a.FiscalYear
        and v.TransactionTypeDetermination = 'WIT'
        and v.FinancialAccountType         = 'K'
      )
//    left outer join       I_OperationalAcctgDocItem as w   on(
//        w.OriginalReferenceDocument        = a.OriginalReferenceDocument
//        and w.CompanyCode                  = a.CompanyCode
//        and w.FiscalYear                   = a.FiscalYear
//        and w.TransactionTypeDetermination = 'BSX'
//      )
    left outer join       I_OperationalAcctgDocItem as x   on(
        x.AccountingDocument                = a.AccountingDocument
        and x.CompanyCode                   = a.CompanyCode
        and x.FiscalYear                    = a.FiscalYear
        and(
          x.TransactionTypeDetermination    = 'JRC'
          or x.TransactionTypeDetermination = 'JRS'
          or x.TransactionTypeDetermination = 'JRI'
        )
      )
    left outer join       I_OperationalAcctgDocItem as xx  on(
       xx.OriginalReferenceDocument        = a.OriginalReferenceDocument
       and xx.FiscalYear                   = a.FiscalYear
       and xx.CompanyCode                  = a.CompanyCode
       and xx.TransactionTypeDetermination = 'KBS'
     )
    left outer join       I_OperationalAcctgDocItem as abc on(
      abc.AccountingDocument               = a.AccountingDocument
      and abc.TaxItemGroup                 = a.TaxItemGroup
      and abc.FiscalYear                   = a.FiscalYear
      and abc.CompanyCode                  = a.CompanyCode
      and abc.TransactionTypeDetermination = 'JRC'
      and(
        abc.TaxCode                        = 'JA'
        or abc.TaxCode                     = 'JB'
        or abc.TaxCode                     = 'JC'
        or abc.TaxCode                     = 'JD'
      )

    )
    left outer join       I_OperationalAcctgDocItem as abd on(
      abd.AccountingDocument               = a.AccountingDocument
      and abd.TaxItemGroup                 = a.TaxItemGroup
      and abd.FiscalYear                   = a.FiscalYear
      and abd.CompanyCode                  = a.CompanyCode
      and abd.TransactionTypeDetermination = 'JRS'
      and(
        abd.TaxCode                        = 'JA'
        or abd.TaxCode                     = 'JB'
        or abd.TaxCode                     = 'JC'
        or abd.TaxCode                     = 'JD'
      )

    )
    left outer join       I_OperationalAcctgDocItem as abe on(
      abe.AccountingDocument               = a.AccountingDocument
      and abe.TaxItemGroup                 = a.TaxItemGroup
      and abe.FiscalYear                   = a.FiscalYear
      and abe.CompanyCode                  = a.CompanyCode
      and abe.TransactionTypeDetermination = 'JRI'
      and(
        abe.TaxCode                        = 'JE'
        or abe.TaxCode                     = 'JF'
        or abe.TaxCode                     = 'JG'
        or abe.TaxCode                     = 'JH'
      )
    )
    left outer join       I_SchedgAgrmtItmApi01     as sch on(
      sch.SchedulingAgreement         = a.PurchasingDocument
      and sch.SchedulingAgreementItem = a.PurchasingDocumentItem
    )
//    left outer join I_OperationalAcctgDocItem as po2 on (  
//     po2.AccountingDocument = a.AccountingDocument
////     and po2.Material = a.Material
////     and po2.Material <> ''
////     and po2.TaxItemGroup = a.TaxItemGroup
//     and po2.AccountingDocumentItem = '002'
//     and po2.FinancialAccountType = 'S'
//     and po2.AccountingDocumentType = 'RE' )
//   left outer join       I_JournalEntry            as o2   on(
//        o2.AccountingDocument = po2.AccountingDocument
//        and o2.CompanyCode    = a.CompanyCode
//        and o2.FiscalYear     = a.FiscalYear
//        and o2.TransactionCode = 'J_1IG_INV'
//      )
//    left outer join I_BillingDocumentItem               as o3   on( 
//        o3.BillingDocument    = o2.DocumentReferenceID
//        and o3.BillingQuantity is not initial
//      ) 


//    left outer join I_DeliveryDocumentItem as o4 on (
//        o4.DeliveryDocument = o3.ReferenceSDDocument
//        and o4.DeliveryDocumentItem = o3.ReferenceSDDocumentItem 
//        )      

{
  key a.OriginalReferenceDocument                                                  as miro_doc,
  key a.PostingDate                                                                as miro_postingdate,
  key a.AccountingDocument                                                         as journalentry_no,
//  key a.TaxItemGroup                                                               as journalentry_item,
  key a.AccountingDocumentItem                                                               as journalentry_item,
  key a.FiscalYear                                                                 as FiscalYear,
      f.ProductType                                                                as materialType,
      a.Product                                                                    as material,
      ee.ProductDescription                                                        as material_desc,
      a.IN_HSNOrSACCode                                                            as HSNCode,
      concat(concat(concat(concat
      (n.ConsumptionTaxCtrlCodeText1,n.ConsumptionTaxCtrlCodeText2 ),
       n.ConsumptionTaxCtrlCodeText3 ), n.ConsumptionTaxCtrlCodeText4 ),
             n.ConsumptionTaxCtrlCodeText5 )                                       as HSNCode_Desc,
      a.Plant,
      a.PurchasingDocument,
//      case when a.PurchasingDocument is initial then o3.SalesDocument
//        else a.PurchasingDocument end                                              as PurchasingDocument,
//      cast( case when a.PurchasingDocumentItem is initial then cast( o3.SalesDocumentItem as abap.char( 6) )
//        else a.PurchasingDocumentItem  end as abap.char( 6) )                                              as PurchasingDocumentItem,  
      a.PurchasingDocumentItem,
      a.ProfitCenter,
      a.MasterFixedAsset,
      a.AccountingDocumentType,
      a.DocumentDate                                                               as miro_docdate,
      e.SupplierInvoiceIDByInvcgParty                                              as miro_Refno,
      substring( a.Reference3IDByBusinessPartner, 5,
      length( a.Reference3IDByBusinessPartner ) - 8 )                              as migo_Docno,
      e.InvoicingParty                                                             as VendorCode,
      j.SupplierName                                                               as VendorName,
      j.BusinessPartnerPanNumber                                                   as PanNumber,
      k.BPIdentificationNumber                                                     as VendorMSME,
      j.TaxNumber3                                                                 as Vendor_GSTIN,

      //   j.Region                        as StateCode,
      case when  j.Region  = 'JK' then '01'
           when  j.Region  = 'HP' then '02'
           when  j.Region  = 'PB' then '03'
           when  j.Region  = 'CH' then '04'
           when  j.Region  = 'UK' then '05'
           when  j.Region  = 'HR' then '06'
           when  j.Region  = 'DL' then '07'
           when  j.Region  = 'RJ' then '08'
           when  j.Region  = 'UP' then '09'
           when  j.Region  = 'BR' then '10'
           when  j.Region  = 'SK' then '11'
           when  j.Region  = 'AR' then '12'
           when  j.Region  = 'NL' then '13'
           when  j.Region  = 'MN' then '14'
           when  j.Region  = 'MZ' then '15'
           when  j.Region  = 'TR' then '16'
           when  j.Region  = 'ML' then '17'
           when  j.Region  = 'AS' then '18'
           when  j.Region  = 'WB' then '19'
           when  j.Region  = 'JH' then '20'
           when  j.Region  = 'OD' then '21'
           when  j.Region  = 'CG' then '22'
           when  j.Region  = 'MP' then '23'
           when  j.Region  = 'GJ' then '24'
           when  j.Region  = 'DD' then '25'
           when  j.Region  = 'DH' then '26'
           when  j.Region  = 'MH' then '27'
           when  j.Region  = 'AD' then '28'
           when  j.Region  = 'KA' then '29'
           when  j.Region  = 'GA' then '30'
           when  j.Region  = 'LD' then '31'
           when  j.Region  = 'KL' then '32'
           when  j.Region  = 'TN' then '33'
           when  j.Region  = 'PY' then '34'
           when  j.Region  = 'AN' then '35'
           when  j.Region  = 'TS' then '36'
           when  j.Region  = 'AP' then '37'
           else null end                                                           as StateCode,
      m.RegionName                                                                 as StateCode_Desc,
      l.GLAccount                                                                  as miro_gl,
      l.GLAccountLongName                                                          as miro_glname,
      a.TaxCode                                                                    as Miro_item_taxCode,
      case when p.ConditionType = 'JICG'
            and q.ConditionType = 'JISG'
            then p.Description
            else r.Description end                                                 as Miro_item_taxCode_dec,
      @Semantics: { quantity : {unitOfMeasure: 'BaseUnit'} }
      a.Quantity                                                                   as miro_Qty,
      a.BaseUnit,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      case when dd.NetPriceAmount is null
      then sch.NetPriceAmount
       else
       dd.NetPriceAmount
       end                                                                         as POItem_rate,
      case when dd.DocumentCurrency is null
      then sch.DocumentCurrency
      else dd.DocumentCurrency end                                                 as DocumentCurrency,
      @Semantics: { amount : {currencyCode: 'CompanyCodeCurrency'} }
      a.AmountInCompanyCodeCurrency                                                as BasicAmount,
      a.CompanyCodeCurrency,
      @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
      case
      when b.TaxCode <> 'JA'
       and b.TaxCode <> 'JB'
       and b.TaxCode <> 'JC'
       and b.TaxCode <> 'JD'
       then b.AmountInTransactionCurrency else null end                            as CGST,
       b.GLAccount                                                                 as cgst_gl,
       bb.GLAccountLongName                                                        as cgst_glname,
      p.Percentage                                                                 as CGST_rate,
      @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
      case when c.TaxCode <> 'JA'
            and c.TaxCode <> 'JB'
            and c.TaxCode <> 'JC'
            and c.TaxCode <> 'JD'
            then c.AmountInTransactionCurrency else null end                       as SGST,
       c.GLAccount                                                                 as sgst_gl,
       cc.GLAccountLongName                                                        as sgst_glname,      
      q.Percentage                                                                 as SGST_rate,
      @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
      case when d.TaxCode <> 'JE'
      and d.TaxCode <> 'JF'
      and d.TaxCode <> 'JG'
      and d.TaxCode <> 'JH'
      then d.AmountInTransactionCurrency else null end                             as IGST,
      d.GLAccount                                                                 as igst_gl,
      d2.GLAccountLongName                                                        as igst_glname,
      r.Percentage                                                                 as IGST_rate,
      @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
      t.AmountInTransactionCurrency                                                as tcs_amount,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      s.TaxBaseAmountInCoCodeCrcy                                                  as Revised_bas_exclud_GstAmt,
      case when oo.ConditionType = 'JICN'  then
      cast(s.TaxAmount as abap.dec( 13, 3 ) ) / 2  else null end                   as Non_cr_cgst,
      case when pp.ConditionType = 'JISN'  then
      cast(s.TaxAmount as abap.dec( 13, 3 ) ) / 2  else null end                   as Non_cr_sgst,
      case when qq.ConditionType = 'JIIN'  then
      cast(s.TaxAmount as abap.dec( 13, 3 ) )   else null end                      as Non_cr_igst,


      coalesce( cast(a.AmountInCompanyCodeCurrency as abap.dec( 13, 3 ) ), 0 ) +
      coalesce( cast(b.AmountInCompanyCodeCurrency as abap.dec( 13, 3 ) ), 0 )
      + coalesce( cast(c.AmountInCompanyCodeCurrency as abap.dec( 13, 3 ) ), 0 ) +
       coalesce( cast(d.AmountInCompanyCodeCurrency as abap.dec( 13, 3 ) ), 0 )    as Total_Amount,
      @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
      a.WithholdingTaxAmount                                                       as TDS_VALUE,
      coalesce( cast(a.AmountInCompanyCodeCurrency as abap.dec( 13, 3 ) ), 0 ) +
       coalesce( cast(b.AmountInCompanyCodeCurrency as abap.dec( 13, 3 ) ), 0 )
      + coalesce( cast(c.AmountInCompanyCodeCurrency as abap.dec( 13, 3 ) ), 0 ) +
      coalesce( cast(d.AmountInCompanyCodeCurrency as abap.dec( 13, 3 ) ), 0 )
        + coalesce( cast(a.WithholdingTaxAmount as abap.dec( 13, 3 ) ), 0 ) +
        coalesce ( cast ( t.AmountInTransactionCurrency as abap.dec ( 13, 3 )),0 ) as BillAmt_afterTDS,

      t.GLAccount                                                                  as tds_gl,
      U.GLAccountLongName                                                          as tds_gl_desc,

      a.TransactionCurrency,
      f.WeightUnit,
      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      f.NetWeight,
      cast(a.Quantity as abap.dec( 13, 3 ) )
      * cast(f.NetWeight as abap.dec( 13, 3 ) )                                    as Netweight_tot_Qty,
      f.BaseUnit                                                                   as net_weight_unit,
      cast(f.GrossWeight as abap.dec( 13, 3 ))                                     as GrossWeight,
      j.CityName,
      @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
      case when a.TransactionTypeDetermination = 'FR1'
      then a.AmountInTransactionCurrency
        else null end                                                              as freight_amount,
      v.DocumentItemText                                                           as miro_header_text,
      t.DocumentItemText                                                           as miro_lineItem_text,
      a.BusinessPlace                                                              as miro_BusinessPlace,
      case when x.AmountInCompanyCodeCurrency is null
      then 'N' else 'Y' end                                                        as RCM_flag,
      case f.ProductType when 'SERV' then 'IS'
                when 'ZASE' then 'IC'
                when 'ZCAS' then 'IC'
                else 'IG' end                                                      as Eligibility_ind,
      'N'                                                                          as Common_supply_ind,
      case a.AccountingDocumentType
             when 'RE' then 'INV'
             when 'KR' then 'INV'
             when 'MR' then 'SLF'
             when 'MT' then 'SLF'
             when 'AA' then 'AA'
             when 'CR' then 'CR'
             when 'KG' then 'CR'
             when 'DK' then 'DR'
             when 'RV' then 'RV'
             else null end                                                         as DocumentType,
      e.ReverseDocument                                                            as originalDocument,
//      xx.NetDueDate                                                                as PaymentDueDate,
      a.DebitCreditCode,
      case when j.IN_GSTSupplierClassification is initial
      then 'Registered'
      when j.IN_GSTSupplierClassification = '1'
      then 'Not Registered'
      else null end                                                                as VendorStatus,
      o.TransactionCode                                                            as Type,
      case when dd2.CreationDate is null
      then dd3.CreationDate else dd2.CreationDate end                              as POdate,
      case when dd2.CompanyCode is null
      then dd3.CompanyCode else dd2.CompanyCode end                                as CompanyCode,
      case when dd2.PurchaseOrderType is null
      then dd3.PurchasingDocumentType
      else dd2.PurchaseOrderType end                                               as PurchaseOrderType,
      j._SupplierCompany.MinorityGroup,
      f.ProductGroup                                                               as materialgroup,
      a.CostCenter,
      o.AccountingDocumentCreationDate                                             as entrydate,
      o.CreationTime,
      o.AccountingDocCreatedByUser                                                 as username,
//      a.TransactionTypeDetermination,

      @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
      abc.AbsoluteAmountInCoCodeCrcy                                               as CGST_RCM_received,
      @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
      abd.AbsoluteAmountInCoCodeCrcy                                               as SGST_RCM_received,
      @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
      abe.AbsoluteAmountInCoCodeCrcy                                               as IGST_RCM_received,
      @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
      abc.AmountInBalanceTransacCrcy                                               as CGST_RCM_payable,
      @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
      abd.AmountInBalanceTransacCrcy                                               as SGST_RCM_payable,
      @Semantics: { amount : {currencyCode: 'TransactionCurrency'} }
      abe.AmountInBalanceTransacCrcy                                               as IGST_RCM_payable


}
where
       e.ReverseDocument              is initial
  and
  (
       a.TransactionTypeDetermination = 'WRX'
    or a.TransactionTypeDetermination = 'ANL'
    or a.TransactionTypeDetermination = 'FR1'
    or a.TransactionTypeDetermination = 'FR3'
    or a.TransactionTypeDetermination = 'BSX'
    
  )
  and (  a.AccountingDocumentType       = 'RE'
  or  a.AccountingDocumentType       = 'CR'
  or  a.AccountingDocumentType       = 'DK'
  or  a.AccountingDocumentType       = 'KG'
  or (  a.AccountingDocumentType       = 'KR' and a.TransactionTypeDetermination = 'EGK' ) )
  
  
