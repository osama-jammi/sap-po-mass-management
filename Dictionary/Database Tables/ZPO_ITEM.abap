@EndUserText.label : 'Postes de l''import PO'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zpo_item {
  key client      : abap.clnt not null;
  key item_uuid   : sysuuid_x16 not null;
  po_uuid         : sysuuid_x16 not null;
  item_no         : abap.numc(5);
  material        : abap.char(40);
  plant           : abap.char(4);
  quantity        : abap.quan(13,3);
  uom             : abap.unit(3);
  net_price       : abap.curr(11,2);
  currency        : abap.cuky;
  deliv_date      : abap.dats;
  local_last_changed_at : abp_lastchange_tstmpl;
}
