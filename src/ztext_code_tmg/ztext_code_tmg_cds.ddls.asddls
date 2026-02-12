@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZTEXT_CODE_TMG_CDS'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZTEXT_CODE_TMG_CDS as select from ztext_code_tmg1
{
    key taxcode as TaxCode,
    key transaction_key as TransactionKey,
    key conditiontype as ConditionType,
    description as Description,
    percentage as Percentage
}
 