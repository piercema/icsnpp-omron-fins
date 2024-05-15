module OMRON_FINS;

hook set_session_general_log(c: connection) {
    if ( ! c?$omron_fins_general_log )
        c$omron_fins_general_log = general_log(
            $ts=network_time(),
            $uid=c$uid,
            $id=c$id,
            $proto="omron_fins");
}

event OMRON_FINS::FINS_HeaderEvt (c: connection, is_orig: bool, fins_header: OMRON_FINS::FINS_Header) {
    hook set_session_general_log(c);

    local info_general_log = c$omron_fins_general_log;

    info_general_log$icf_gateway                 = OMRON_FINS_ENUMS::GATEWAY_USAGE[fins_header$icf$gateway];
    info_general_log$icf_data_type               = OMRON_FINS_ENUMS::DATA_TYPE[fins_header$icf$data_type];
    info_general_log$icf_response_setting        = OMRON_FINS_ENUMS::RESPONSE_SETTING[fins_header$icf$response_setting];
    info_general_log$gateway_count               = fins_header$gateway_count;
    info_general_log$destination_network_address = fins_header$destination_network_address;
    info_general_log$destination_node_number     = fins_header$destination_node_number;
    info_general_log$destination_unit_address    = fins_header$destination_unit_address;
    info_general_log$source_network_address      = fins_header$source_network_address;
    info_general_log$source_node_number          = fins_header$source_node_number;
    info_general_log$source_unit_address         = fins_header$source_unit_address;
    info_general_log$service_id                  = fins_header$service_id;
    info_general_log$command                     = OMRON_FINS_ENUMS::COMMAND[fins_header$command];
    OMRON_FINS::emit_omron_fins_general_log(c);
}


