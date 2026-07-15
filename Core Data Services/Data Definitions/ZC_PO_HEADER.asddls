@EndUserText.label: 'Consumption View - PO Header'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_PO_HEADER
  provider contract transactional_query
  as projection on ZI_PO_HEADER
{
  key PoUuid,
  PoReference,
  DocType,
  Vendor,
  PurchOrg,
  PurchGrp,
  CompCode,
  DocDate,
  PoNumber,
  Status,
  Message,
  CreatedBy,
  CreatedAt,
  LastChangedBy,
  LastChangedAt,
  LocalLastChangedAt,
  
  _Item : redirected to composition child ZC_PO_ITEM
}
