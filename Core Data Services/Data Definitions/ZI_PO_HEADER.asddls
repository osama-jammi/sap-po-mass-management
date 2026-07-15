@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View - PO Header'
define root view entity ZI_PO_HEADER
  as select from zpo_header
  composition [0..*] of ZI_PO_ITEM as _Item
{
  key po_uuid as PoUuid,
  po_reference as PoReference,
  doc_type as DocType,
  vendor as Vendor,
  purch_org as PurchOrg,
  purch_grp as PurchGrp,
  comp_code as CompCode,
  doc_date as DocDate,
  po_number as PoNumber,
  status as Status,
  message as Message,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.lastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  
  _Item
}
