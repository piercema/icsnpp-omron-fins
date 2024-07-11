module OMRON_FINS;

    type general_log: record {
        ts                          : time    &log;
        uid                         : string  &log;
        id                          : conn_id &log;
        proto                       : string  &log;
        omron_fins_link_id          : string  &log &optional;
        icf_gateway                 : string  &log &optional;
        icf_data_type               : string  &log &optional;
        icf_response_setting        : string  &log &optional;
        gateway_count               : count   &log &optional;
        destination_network_address : count   &log &optional;
        destination_node_number     : count   &log &optional;
        destination_unit_address    : count   &log &optional;
        source_network_address      : count   &log &optional;
        source_node_number          : count   &log &optional;
        source_unit_address         : count   &log &optional;
        service_id                  : string  &log &optional;
        command_code                : string  &log &optional;
    };

    type detail_log: record {
        ts                          : time    &log;
        uid                         : string  &log;
        id                          : conn_id &log;
        omron_fins_link_id          : string  &log &optional;
        command_code                : string  &log &optional;
        icf_data_type               : string  &log &optional;

        memory_area_code            : string &log &optional;
        beginning_address           : string &log &optional;
        number_of_items             : count  &log &optional;

        parameter_area_code         : string &log &optional;
        beginning_word              : string &log &optional;
        number_of_words             : count  &log &optional;
        last_word                   : count  &log &optional;

        response_code               : string &log &optional;
        data                        : string &log &optional;

        year                        : count  &log &optional;
        month                       : count  &log &optional;
        date                        : count  &log &optional;
        hour                        : count  &log &optional;
        minute                      : count  &log &optional;
        second                      : count  &log &optional;
        day                         : string &log &optional;

    };

