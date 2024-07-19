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
        last_word_bit               : count  &log &optional;

        response_code               : string &log &optional;
        data                        : string &log &optional;

        year                        : count  &log &optional;
        month                       : count  &log &optional;
        date                        : count  &log &optional;
        hour                        : count  &log &optional;
        minute                      : count  &log &optional;
        second                      : count  &log &optional;
        day                         : string &log &optional;

        fixed                            : string &log &optional;
        intelligent_id_no                : string &log &optional;
        first_word                       : string &log &optional;
        read_length                      : string &log &optional;
        data_length                      : string &log &optional;

        num_of_link_nodes                : count &log &optional;

        block_record_data_link_status    : string &log &optional;
        block_record_num_of_link_nodes   : count  &log &optional;
        block_record_node_num            : count  &log &optional;
        block_record_cio_area_first_word : string &log &optional;
        block_record_kind_of_dm          : string &log &optional;
        block_record_dm_area_first_word  : string &log &optional;
        block_record_num_of_total_words  : count  &log &optional;

        program_no                       : count  &log &optional;
        protect_code                     : count  &log &optional;
        password                         : string &log &optional;
        last_word                        : string &log &optional;
        clear_code                       : string &log &optional;
    };

