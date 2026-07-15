@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View - PO Item'
define view entity ZI_PO_ITEM
  as select from zpo_item
  association to parent ZI_PO_HEADER as _Header on $projection.PoUuid = _Header.PoUuid
{
  key item_uuid as ItemUuid,
  po_uuid as PoUuid,
  item_no as ItemNo,
  material as Material,
  plant as Plant,
  @Semantics.quantity.unitOfMeasure: 'Uom'
  quantity as Quantity,
  uom as Uom,
  @Semantics.amount.currencyCode: 'Currency'
  net_price as NetPrice,
  currency as Currency,
  deliv_date as DelivDate,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  
  _Header
}
