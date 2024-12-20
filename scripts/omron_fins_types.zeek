module OMRON_FINS;

    type general_log: record {
        ts                          : time    &log;
        uid                         : string  &log;
        id                          : conn_id &log;
        proto                       : string  &log;
        omron_fins_link_id          : string  &log &optional;
        tcp_header                  : string  &log &optional;
        tcp_length                  : count   &log &optional;
        tcp_command                 : string  &log &optional;
        tcp_error_code              : string  &log &optional;
        client_node_address         : count   &log &optional;
        server_node_address         : count   &log &optional;
        icf_gateway                 : string  &log &optional;
        icf_data_type               : string  &log &optional;
        icf_response_setting        : string  &log &optional;
        gateway_count               : count   &log &optional;
        destination_network_address : string   &log &optional;
        destination_node_number     : string   &log &optional;
        destination_unit_address    : string   &log &optional;
        source_network_address      : string   &log &optional;
        source_node_number          : string   &log &optional;
        source_unit_address         : string   &log &optional;
        service_id                  : string  &log &optional;
        command_code                : string  &log &optional;
        response_code               : string  &log &optional;
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
        clock_time                  : time   &log &optional;

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
        number_of_bytes                  : count  &log &optional;

        run_mode                         : string &log &optional;

        controller_data_to_read          : string &log &optional;

        # Controller Model
        controller_model                 : string &log &optional;
        controller_version               : string &log &optional;
        for_system_use                   : string &log &optional;
        program_area_size                : count  &log &optional;
        iom_size                         : count  &log &optional;
        no_of_dm_words                   : count  &log &optional;
        timer_size                       : count  &log &optional;
        expansion_dm_size                : count  &log &optional;
        no_of_steps_transitions          : count  &log &optional;
        kind_of_memory_card              : string &log &optional;
        memory_card_size                 : count  &log &optional;

        # CPU Bus Unit
        cpu_bus_unit_config              : vector of count &log &optional;
        no_of_sysmac_bus_master_mounted  : count  &log &optional;
        no_of_sysmac_bus2_master_mounted : count  &log &optional;

        # CPU Bus Unit - PC Status details
        peripheral_device_connected      : count  &log &optional;
        built_in_host_interface          : count  &log &optional;
        no_of_racks_connected            : count  &log &optional;

        no_of_units                      : count  &log &optional;
        unit_address                     : string &log &optional;
        model_number                     : string &log &optional;

        # Controller Status Data Read details
        controller_status_data_read_status : string &log &optional;
        controller_status_data_read_mode   : string &log &optional;
        fatal_error                        : vector of string &log &optional;
        non_fatal_error                    : vector of string &log &optional;
        message_yes_no                     : vector of string &log &optional;
        fal_fals_no                        : count  &log &optional;
        error_message                      : string &log &optional;

        # Cycle Time Read
        cycle_time_read_parameter          : string &log &optional;
        average_cycle_time                 : double &log &optional; 
        max_cycle_time                     : double &log &optional; 
        min_cycle_time                     : double &log &optional; 

        # Loopback Test
        test_data                          : string &log &optional;

        # Broadcast Test Results Read
        number_of_receptions               : count &log &optional;

        # Message Read | Message Clear | FAL/FALS Read
        command                            : string &log &optional;
        message_no_0                       : bool   &log &optional;
        message_no_1                       : bool   &log &optional;
        message_no_2                       : bool   &log &optional;
        message_no_3                       : bool   &log &optional;
        message_no_4                       : bool   &log &optional;
        message_no_5                       : bool   &log &optional;
        message_no_6                       : bool   &log &optional;
        message_no_7                       : bool   &log &optional;
        message_0                          : string &log &optional;
        message_1                          : string &log &optional;
        message_2                          : string &log &optional;
        message_3                          : string &log &optional;
        message_4                          : string &log &optional;
        message_5                          : string &log &optional;
        message_6                          : string &log &optional;
        message_7                          : string &log &optional;

        fal_fals_no_0                       : bool   &log &optional;
        fal_fals_no_1                       : bool   &log &optional;
        fal_fals_no_2                       : bool   &log &optional;
        fal_fals_no_3                       : bool   &log &optional;
        fal_fals_no_4                       : bool   &log &optional;
        fal_fals_no_5                       : bool   &log &optional;
        fal_fals_no_6                       : bool   &log &optional;
        fal_fals_no_7                       : bool   &log &optional;
        fal_fals_no_8                       : bool   &log &optional;
        fal_fals_no_9                       : bool   &log &optional;
        fal_fals_no_10                      : bool   &log &optional;
        fal_fals_no_11                      : bool   &log &optional;
        fal_fals_no_12                      : bool   &log &optional;
        fal_fals_no_13                      : bool   &log &optional;
        fal_fals_0                          : string &log &optional;
        fal_fals_1                          : string &log &optional;
        fal_fals_2                          : string &log &optional;
        fal_fals_3                          : string &log &optional;
        fal_fals_4                          : string &log &optional;
        fal_fals_5                          : string &log &optional;
        fal_fals_6                          : string &log &optional;
        fal_fals_7                          : string &log &optional;
        fal_fals_8                          : string &log &optional;
        fal_fals_9                          : string &log &optional;
        fal_fals_10                         : string &log &optional;
        fal_fals_11                         : string &log &optional;
        fal_fals_12                         : string &log &optional;
        fal_fals_13                         : string &log &optional;

        # Access Right Acquire
        acquire_network_address             : count  &log &optional;
        acquire_node_number                 : count  &log &optional;
        acquire_unit_address                : count  &log &optional;

        # Set/Reset details
        no_of_bits                          : count  &log &optional;
        set_reset_specification             : string &log &optional;
        bit_flag                            : count  &log &optional;

    };

    type network_status_read_log: record {
        ts                          : time    &log;
        uid                         : string  &log;
        id                          : conn_id &log;
        omron_fins_link_id          : string  &log &optional;
        command_code                : string  &log &optional;
        icf_data_type               : string  &log &optional;
        response_code               : string  &log &optional;

        node_number                 : count   &log &optional;
        in_network                  : string  &log &optional;
        exit_status                 : string  &log &optional;
        polling                     : string  &log &optional;
        communication_cycle_time    : double  &log &optional;
        current_polling_node_number : count   &log &optional;
        cyclic_operation            : string  &log &optional;
        cyclic_transmission_status  : string  &log &optional;
        non_fatal_error             : string  &log &optional;
        cyclic_error_count          : count   &log &optional;
    };

    type data_link_status_read_log: record {
        ts                 : time    &log;
        uid                : string  &log;
        id                 : conn_id &log;
        omron_fins_link_id : string  &log &optional;
        command_code       : string  &log &optional;
        icf_data_type      : string  &log &optional;
        response_code      : string  &log &optional;

        node_number        : count  &log &optional;
        data_links         : string &log &optional;
        node_setting       : string &log &optional;
        master_node_number : count  &log &optional;
        error_status       : string &log &optional;
        mode_status        : string &log &optional;
        warning_status     : string &log &optional;
    };

     type detail_error_log: record {
        ts                 : time    &log;
        uid                : string  &log;
        id                 : conn_id &log;
        omron_fins_link_id : string  &log &optional;
        command_code       : string  &log &optional;
        icf_data_type      : string  &log &optional;
        response_code      : string  &log &optional;

        # Error clear
        error_reset_fal_no    : string &log &optional;

        # Error Log Read
        beginning_record_no   : count  &log &optional;
        max_no_stored_records : count  &log &optional;
        no_of_stored_records  : count  &log &optional;
        no_of_records         : count  &log &optional;
        error_code_1          : string &log &optional;
        error_code_2          : string &log &optional;
        minute                : count  &log &optional;
        second                : count  &log &optional;
        day                   : count  &log &optional;
        hour                  : count  &log &optional;
        year                  : count  &log &optional;
        month                 : count  &log &optional;
    };

    type detail_file_log: record {
        ts                      : time    &log;
        uid                     : string  &log;
        id                      : conn_id &log;
        omron_fins_link_id      : string  &log &optional;
        command_code            : string  &log &optional;
        icf_data_type           : string  &log &optional;
        response_code           : string  &log &optional;

        # File Name Read
        disk_no                 : count  &log &optional;
        beginning_file_position : string &log &optional;
        no_of_files             : count  &log &optional;

        volume_label            : string &log &optional;
        year                    : count  &log &optional;
        month                   : count  &log &optional;
        day                     : count  &log &optional;
        hour                    : count  &log &optional;
        minute                  : count  &log &optional;
        second                  : count  &log &optional;

        total_capacity          : count  &log &optional;
        unused_capacity         : count  &log &optional;
        total_no_files          : count  &log &optional;
        no_files_read           : count  &log &optional;

        last_file               : bool  &log &optional;

        file_name               : string &log &optional;
        file_capacity           : count  &log &optional;

        # Single File Read
        file_position           : count  &log &optional;
        data_length             : count  &log &optional;
        fuid                    : string &log &optional;

        # Single File Write
        parameter_code          : string &log &optional;

        # File Copy
        src_disk_no             : count  &log &optional;
        src_file_name           : string &log &optional;
        dst_disk_no             : count  &log &optional;
        dst_file_name           : string &log &optional;

        # File Name Change
        old_file_name           : string &log &optional;
        new_file_name           : string &log &optional;

        parameter_area_code     : string &log &optional;
        beginning_address       : string &log &optional;
        no_of_words             : count  &log &optional;

        memory_area_code        : string &log &optional;
        no_of_items             : count  &log &optional;

        program_no              : string &log &optional;
        no_of_bytes             : count  &log &optional;
        beginning_word          : string &log &optional;

        beginning_block_no      : count  &log &optional;
        no_of_blocks            : count  &log &optional;
        remaining_blocks        : count  &log &optional;
        total_no_of_blocks      : count  &log &optional;
        memory_type             : string &log &optional;
        data_type               : string &log &optional;
        last_block              : bool &log &optional;
        protected               : bool &log &optional;
        control_data            : count  &log &optional;

        block_no                : count  &log &optional;
        memory_data             : string &log &optional;
    };
