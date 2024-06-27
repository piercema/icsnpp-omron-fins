module OMRON_FINS;

hook set_session_general_log(c: connection) {
    if ( ! c?$omron_fins_general_log )
        c$omron_fins_general_log = general_log(
            $ts=network_time(),
            $uid=c$uid,
            $id=c$id,
            $proto="omron_fins");
}

hook set_session_detail_log(c: connection) {
    if ( ! c?$omron_fins_detail_log )
        c$omron_fins_detail_log = detail_log(
            $ts=network_time(),
            $uid=c$uid,
            $id=c$id);
}

event OMRON_FINS::FINS_HeaderEvt (c: connection, is_orig: bool, finsHeader: OMRON_FINS::FINS_Header) {
    hook set_session_general_log(c);

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
    OMRON_FINS::emit_omron_fins_general_log(c);
}

event OMRON_FINS::FINS_CommandEvt (c: connection, is_orig: bool, finsCommand: OMRON_FINS::Command) {
    hook set_session_detail_log(c);

    local info_detail_log = c$omron_fins_detail_log;

    info_detail_log$command_code  = OMRON_FINS_ENUMS::COMMAND[finsCommand$commandCode];
    info_detail_log$icf_data_type = OMRON_FINS_ENUMS::DATA_TYPE[finsCommand$icfDataType];
    switch(finsCommand$commandCode) {
        case OMRON_FINS_ENUMS::CommandCode_MEMORY_AREA_READ:
            info_detail_log = OMRON_FINS::process_memory_area_read(info_detail_log, finsCommand);
            break;
    }

    OMRON_FINS::emit_omron_fins_detail_log(c);
}
