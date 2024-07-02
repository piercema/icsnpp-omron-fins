module OMRON_FINS;

event OMRON_FINS::FINS_HeaderEvt (c: connection, is_orig: bool, finsHeader: OMRON_FINS::FINS_Header) {
    c = set_session_general_log(c);

    local info_general_log = c$omron_fins_general_log;

    info_general_log$icf_gateway                 = OMRON_FINS_ENUMS::GATEWAY_USAGE[finsHeader$icf$gateway];
    info_general_log$icf_data_type               = OMRON_FINS_ENUMS::DATA_TYPE[finsHeader$icf$dataType];
    info_general_log$icf_response_setting        = OMRON_FINS_ENUMS::RESPONSE_SETTING[finsHeader$icf$responseSetting];
    info_general_log$gateway_count               = finsHeader$gatewayCount;
    info_general_log$destination_network_address = finsHeader$destinationNetworkAddress;
    info_general_log$destination_node_number     = finsHeader$destinationNodeNumber;
    info_general_log$destination_unit_address    = finsHeader$destinationUnitAddress;
    info_general_log$source_network_address      = finsHeader$sourceNetworkAddress;
    info_general_log$source_node_number          = finsHeader$sourceNodeNumber;
    info_general_log$source_unit_address         = finsHeader$sourceUnitAddress;
    info_general_log$service_id                  = finsHeader$serviceId;
    info_general_log$command_code                = OMRON_FINS_ENUMS::COMMAND[finsHeader$commandCode];

    # Fire the event and tidy up
    OMRON_FINS::emit_omron_fins_general_log(c);
    delete c$omron_fins_general_log;
}

event OMRON_FINS::FINS_CommandEvt (c: connection, is_orig: bool, finsCommand: OMRON_FINS::Command) {
    switch(finsCommand$commandCode) {
        case OMRON_FINS_ENUMS::CommandCode_MEMORY_AREA_READ:
            OMRON_FINS::process_memory_area_read_detail(c, finsCommand);
            break;
        case OMRON_FINS_ENUMS::CommandCode_MULTIPLE_MEMORY_AREA_READ:
            OMRON_FINS::process_multiple_memory_area_read_detail(c, finsCommand);
            break;
    }

}
