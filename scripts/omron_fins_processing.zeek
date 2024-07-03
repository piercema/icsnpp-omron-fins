module OMRON_FINS;

event OMRON_FINS::FINS_HeaderEvt (c: connection, is_orig: bool, finsHeader: OMRON_FINS::FINS_Header) {
    c = set_session_general_log(c);

    local info_general_log = c$omron_fins_general_log;

    info_general_log$omron_fins_link_id          = finsHeader$omronFinsLinkId;
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

    process_details(c, finsHeader$command, info_general_log$omron_fins_link_id);

    # Fire the event and tidy up
    OMRON_FINS::emit_omron_fins_general_log(c);
    delete c$omron_fins_general_log;
}
