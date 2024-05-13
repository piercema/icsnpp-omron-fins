module OMRON_FINS;

export {
    type general_log: record {
        ts                          : time &log;
        uid                         : string &log;
        id                          : conn_id &log;
        proto                       : string &log;
        icf_gateway                 : string &log &optional;
        icf_data_type               : string &log &optional;
        icf_response_setting        : string &log &optional;
        gateway_count               : count &log &optional;
        destination_network_address : count &log &optional;
        destination_node_number     : count &log &optional;
        destination_unit_address    : count &log &optional;
        source_network_address      : count &log &optional;
        source_node_number          : count &log &optional;
        source_unit_address         : count &log &optional;
        service_id                  : count &log &optional;
    };

}
