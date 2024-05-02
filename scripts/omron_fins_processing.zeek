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

    info_general_log$fins__header_reserved = fins_header$reserved;
    info_general_log$fins__header_gateway_count = fins_header$gateway_count;
    info_general_log$fins__header_destination_network_address = fins_header$destination_network_address;
    info_general_log$fins__header_destination_node_number = fins_header$destination_node_number;
    info_general_log$fins__header_destination_unit_address = fins_header$destination_unit_address;
    info_general_log$fins__header_source_network_address = fins_header$source_network_address;
    info_general_log$fins__header_source_node_number = fins_header$source_node_number;
    info_general_log$fins__header_source_unit_address = fins_header$source_unit_address;
    info_general_log$fins__header_service_id = fins_header$service_id;
    info_general_log$fins__header_information_control_field_gateway = fins_header$information_control_field$gateway;
    info_general_log$fins__header_information_control_field_data_type = fins_header$information_control_field$data_type;
    info_general_log$fins__header_information_control_field_reserved = fins_header$information_control_field$reserved;
    info_general_log$fins__header_information_control_field_response_setting = fins_header$information_control_field$response_setting;
    OMRON_FINS::emit_omron_fins_general_log(c);
}


