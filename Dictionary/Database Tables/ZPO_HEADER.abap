@EndUserText.label : 'En-tête de l''import PO'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zpo_header {
  key client      : abap.clnt not null;
  key po_uuid     : sysuuid_x16 not null;
  po_reference    : abap.char(20);
  doc_type        : abap.char(4);
  vendor          : abap.char(10);
  purch_org       : abap.char(4);
  purch_grp       : abap.char(3);
  comp_code       : abap.char(4);
  doc_date        : abap.dats;
  po_number       : abap.char(10);
  status          : abap.char(1);
  message         : abap.char(255);
  created_by      : abp_creation_user;
  created_at      : abp_creation_tstmpl;
  last_changed_by : abp_locinst_lastchange_user;
  last_changed_at : abp_locinst_lastchange_tstmpl;
  local_last_changed_at : abp_lastchange_tstmpl;
}
