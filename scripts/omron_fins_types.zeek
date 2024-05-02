module OMRON_FINS;

export {
    type general_log: record {
        ts                                                      : time &log;
        uid                                                     : string &log;
        id                                                      : conn_id &log;
        proto                                                   : string &log;
        fins__header_reserved                                   : count &log &optional;
        fins__header_gateway_count                              : count &log &optional;
        fins__header_destination_network_address                : count &log &optional;
        fins__header_destination_node_number                    : count &log &optional;
        fins__header_destination_unit_address                   : count &log &optional;
        fins__header_source_network_address                     : count &log &optional;
        fins__header_source_node_number                         : count &log &optional;
        fins__header_source_unit_address                        : count &log &optional;
        fins__header_service_id                                 : count &log &optional;
        fins__header_information_control_field_gateway          : bool &log &optional;
        fins__header_information_control_field_data_type        : bool &log &optional;
        fins__header_information_control_field_reserved         : count &log &optional;
        fins__header_information_control_field_response_setting : bool &log &optional;
    };

}
