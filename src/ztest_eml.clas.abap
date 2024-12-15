CLASS ztest_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ztest_eml IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*Example 1 :  READ a travel
*    DATA : lt_keys          TYPE TABLE FOR READ IMPORT /DMO/I_Travel_M.
*
*    lt_keys = VALUE #( ( %tky-%key-travel_id = '00002772' )
*                       ( %tky-%key-travel_id = '00002815' ) ).
*
*    READ ENTITY /DMO/I_Travel_M
*    ALL FIELDS
*    WITH CORRESPONDING #( lt_keys )
*    RESULT data(lt_travel_data_r)
*    FAILED DATA(lt_failed).

*Example 2 : CREATE a new travel.

*    DATA lt_travel_new_data TYPE TABLE FOR CREATE /dmo/i_travel_m.
*
*    lt_travel_new_data = VALUE #( ( %cid = '1'
*                                    agency_id = '070049'
*                                    customer_id = '000072'
*                                    begin_date = cl_abap_context_info=>get_system_date( ) + 1
*                                    end_date = cl_abap_context_info=>get_system_date( ) + 2
*                                    overall_status = 'O'
*                                    %control = VALUE #( agency_id = if_abap_behv=>mk-on
*                                                        customer_id = if_abap_behv=>mk-on
*                                                        begin_date = if_abap_behv=>mk-on
*                                                        end_date = if_abap_behv=>mk-on
*                                                        overall_status = if_abap_behv=>mk-on )
*                                 )
*                                 ( %cid = '2'
*                                    agency_id = '070049'
*                                    customer_id = '000072'
*                                    begin_date = cl_abap_context_info=>get_system_date( ) + 1
*                                    end_date = cl_abap_context_info=>get_system_date( ) + 2
*                                    overall_status = 'O'
*                                    %control = VALUE #( agency_id = if_abap_behv=>mk-on
*                                                        customer_id = if_abap_behv=>mk-on
*                                                        begin_date = if_abap_behv=>mk-on
*                                                        end_date = if_abap_behv=>mk-on
*                                                        overall_status = if_abap_behv=>mk-on )
*                                 ) ).
*
*    MODIFY ENTITY /dmo/i_travel_m
*    CREATE FROM lt_travel_new_data
*    FAILED DATA(lt_failed)
*    REPORTED DATA(lt_reported)
*    MAPPED DATA(lt_mapped).
*
*    lt_travel_new_data = VALUE #( ( %cid = '1'
*                                    agency_id = '070049'
*                                    customer_id = '000072'
*                                    begin_date = cl_abap_context_info=>get_system_date( ) + 1
*                                    end_date = cl_abap_context_info=>get_system_date( ) + 2
*                                    overall_status = 'O'
*                                    %control = VALUE #( agency_id = if_abap_behv=>mk-on
*                                                        customer_id = if_abap_behv=>mk-on
*                                                        begin_date = if_abap_behv=>mk-on
*                                                        end_date = if_abap_behv=>mk-on
*                                                        overall_status = if_abap_behv=>mk-on )
*                                 ) ).
*
*    MODIFY ENTITY /dmo/i_travel_m
*    CREATE FROM lt_travel_new_data
*    FAILED lt_failed
*    REPORTED lt_reported
*    MAPPED lt_mapped.
*
*    COMMIT ENTITIES
*    RESPONSE OF /dmo/i_travel_m
*    FAILED DATA(failed_commit)
*    REPORTED DATA(reported_commit).

*Example 3 : UPDATE a travel

*    DATA lt_travel_new_data TYPE TABLE FOR CREATE /dmo/i_travel_m.
*
*    lt_travel_new_data = VALUE #( ( %cid = '1'
*                                    agency_id = '070049'
*                                    customer_id = '000072'
*                                    %control = VALUE #( agency_id = if_abap_behv=>mk-on
*                                                        customer_id = if_abap_behv=>mk-on )
*                                 ) ).
*
*    MODIFY ENTITY /dmo/i_travel_m
*    CREATE FROM lt_travel_new_data
*    FAILED DATA(lt_failed)
*    REPORTED DATA(lt_reported)
*    MAPPED DATA(lt_mapped).
*
*    DATA(ls_mapped) = lt_mapped-travel[ 1 ].
*
*    DATA lt_travel_data TYPE TABLE FOR UPDATE /dmo/i_travel_m.
*
*    lt_travel_data = VALUE #( ( %tky-%key-travel_id = '00002772'
*                                description = 'Vacation'
*                                %control-description = if_abap_behv=>mk-on ) ).
*
*    MODIFY ENTITY /dmo/i_travel_m
*    UPDATE FROM lt_travel_data
*    FAILED DATA(lt_failed_u)
*    REPORTED DATA(lt_reported_u).
*
*    DATA : lt_travel_data_r TYPE TABLE FOR READ RESULT /dmo/i_travel_m,
*           lt_keys          TYPE TABLE FOR READ IMPORT /DMO/I_Travel_M.
*
*    lt_keys = VALUE #( ( %tky = ls_mapped-%tky ) ).
*
*    READ ENTITY /DMO/I_Travel_M
*    FROM lt_keys
*    RESULT lt_travel_data_r.
*
*    COMMIT ENTITIES
*    RESPONSE OF /dmo/i_travel_m
*    FAILED DATA(failed_commit)
*    REPORTED DATA(reported_commit).

*Example 4 : CREATE  & UPDATE

*    DATA lt_travel_new_data TYPE TABLE FOR CREATE /dmo/i_travel_m.
*
*    lt_travel_new_data = VALUE #( ( %cid = '1'
*                                    agency_id = '070049'
*                                    customer_id = '000072'
*                                    begin_date = cl_abap_context_info=>get_system_date( ) + 1
*                                    end_date = cl_abap_context_info=>get_system_date( ) + 2
*                                    overall_status = 'O'
*                                    %control = VALUE #( agency_id = if_abap_behv=>mk-on
*                                                        customer_id = if_abap_behv=>mk-on
*                                                        begin_date = if_abap_behv=>mk-on
*                                                        end_date = if_abap_behv=>mk-on
*                                                        overall_status = if_abap_behv=>mk-on )
*                                 ) ).
*
*    MODIFY ENTITY /dmo/i_travel_m
*    CREATE FROM lt_travel_new_data
*    FAILED DATA(lt_failed)
*    REPORTED DATA(lt_reported)
*    MAPPED DATA(lt_mapped).
*
*    DATA(ls_mapped) = lt_mapped-travel[ 1 ].
*
*    DATA lt_travel_data TYPE TABLE FOR UPDATE /dmo/i_travel_m.
*
*    lt_travel_data = VALUE #( ( %tky = ls_mapped-%tky
*                                description = 'Vacation'
*                                %control-description = if_abap_behv=>mk-on ) ).
*
*    MODIFY ENTITY /dmo/i_travel_m
*    UPDATE FROM lt_travel_data
*    FAILED DATA(lt_failed_u)
*    REPORTED DATA(lt_reported_u).
*
*    COMMIT ENTITIES
*    RESPONSE OF /dmo/i_travel_m
*    FAILED DATA(failed_commit)
*    REPORTED DATA(reported_commit).

*Example 5 : DELETE a travel
*    DATA : lt_keys          TYPE TABLE FOR DELETE /DMO/I_Travel_M.
*
*    lt_keys = VALUE #( ( %tky-%key-travel_id = '00002772' )
*                       ( %tky-%key-travel_id = '00002815' ) ).
*
*    MODIFY ENTITY /DMO/I_Travel_M
*    DELETE FROM lt_keys
*    FAILED DATA(failed)
*    REPORTED DATA(reported).


  ENDMETHOD.
ENDCLASS.
