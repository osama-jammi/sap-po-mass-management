@EndUserText.label: 'Consumption View - PO Item'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_PO_ITEM
  as projection on ZI_PO_ITEM
{
  key ItemUuid,
  PoUuid,
  ItemNo,
  Material,
  Plant,
  Quantity,
  Uom,
  NetPrice,
  Currency,
  DelivDate,
  LocalLastChangedAt,
  
  _Header : redirected to parent ZC_PO_HEADER
}
