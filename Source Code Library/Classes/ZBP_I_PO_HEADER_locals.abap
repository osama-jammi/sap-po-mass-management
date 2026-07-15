CLASS lhc_POHeader DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR POHeader RESULT result.

    METHODS createPurchaseOrder FOR MODIFY
      IMPORTING keys FOR ACTION POHeader~createPurchaseOrder RESULT result.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR POHeader RESULT result.

ENDCLASS.

CLASS lhc_POHeader IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD createPurchaseOrder.
    " Logic to call BAPI_PO_CREATE1 will go here.
    " 1. Read Draft / Active records
    " 2. Map data to BAPI structures
    " 3. Call BAPI
    " 4. Update Status and PoNumber in zpo_header
  ENDMETHOD.

  METHOD get_instance_features.
    " Enable/Disable createPurchaseOrder button based on Status
  ENDMETHOD.

ENDCLASS.
