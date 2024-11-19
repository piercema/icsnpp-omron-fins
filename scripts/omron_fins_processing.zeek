module OMRON_FINS;

    function process_details(c: connection, finsCommand: OMRON_FINS::Command, omron_fins_link_id: string): string {
        local general_log_response_code : string;
        general_log_response_code = "";

        switch(finsCommand$commandCode) {
            case OMRON_FINS_ENUMS::CommandCode_MEMORY_AREA_READ:
                general_log_response_code = process_memory_area_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_MEMORY_AREA_WRITE:
                general_log_response_code = process_memory_area_write_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_MULTIPLE_MEMORY_AREA_READ:
                general_log_response_code = process_multiple_memory_area_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_MEMORY_AREA_FILL:
                general_log_response_code = process_memory_area_fill_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_MEMORY_AREA_TRANSFER:
                general_log_response_code = process_memory_area_transfer_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_PARAMETER_AREA_READ:
                general_log_response_code = process_parameter_area_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_PARAMETER_AREA_WRITE:
                general_log_response_code = process_parameter_area_write_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_PARAMETER_AREA_CLEAR:
                general_log_response_code = process_parameter_area_clear_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_DATA_LINK_TABLE_READ:
                general_log_response_code = process_data_link_table_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_DATA_LINK_TABLE_WRITE:
                general_log_response_code = process_data_link_table_write_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_PROGRAM_AREA_PROTECT:
                general_log_response_code = process_program_area_protect_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_PROGRAM_AREA_PROTECT_CLEAR:
                general_log_response_code = process_program_area_protect_clear_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_PROGRAM_AREA_READ:
                general_log_response_code = process_program_area_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_PROGRAM_AREA_WRITE:
                general_log_response_code = process_program_area_write_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_PROGRAM_AREA_CLEAR:
                general_log_response_code = process_program_area_clear_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_RUN:
                general_log_response_code = process_run_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_STOP:
                general_log_response_code = process_stop_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_CONTROLLER_DATA_READ:
                general_log_response_code = process_controller_data_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_CONNECTION_DATA_READ:
                general_log_response_code = process_connection_data_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_CONTROLLER_STATUS_READ:
                general_log_response_code = process_controller_status_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_NETWORK_STATUS_READ:
                general_log_response_code = process_network_status_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_DATA_LINK_STATUS_READ:
                general_log_response_code = process_data_link_status_read_detail(c, finsCommand, omron_fins_link_id);
                break;
             case OMRON_FINS_ENUMS::CommandCode_CYCLE_TIME_READ:
                general_log_response_code = process_cycle_time_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_LOOP_BACK_TEST:
                general_log_response_code = process_loop_back_test_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_BROADCAST_TEST_RESULTS_READ:
                general_log_response_code = process_broadcast_test_results_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_BROADCAST_TEST_DATA_SEND:
                # Note: No response is returned from the Broadcast Test Data Send command. 
                process_broadcast_test_data_send_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_MESSAGE_READ_MESSAGE_CLEAR_FAL_FALS_READ:
                general_log_response_code = process_message_read_message_clear_fal_fals_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_ACCESS_RIGHT_ACQUIRE:
                general_log_response_code = process_access_right_acquire_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_ACCESS_RIGHT_FORCED_ACQUIRE:
                general_log_response_code = process_access_right_forced_acquire_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_ACCESS_RIGHT_RELEASE:
                general_log_response_code = process_access_right_release_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_ERROR_CLEAR:
                general_log_response_code = process_error_clear_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_ERROR_LOG_READ:
                general_log_response_code = process_error_log_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_ERROR_LOG_CLEAR:
                general_log_response_code = process_error_log_clear_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_FILE_NAME_READ:
                general_log_response_code = process_file_name_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_SINGLE_FILE_READ:
                general_log_response_code = process_single_file_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_SINGLE_FILE_WRITE:
                general_log_response_code = process_single_file_write_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_MEMORY_CARD_FORMAT:
                general_log_response_code = process_memory_card_format_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_FILE_DELETE:
                general_log_response_code = process_file_delete_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_VOLUME_LABEL_CREATE_DELETE:
                general_log_response_code = process_volume_label_create_delete_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_FILE_COPY:
                general_log_response_code = process_file_copy_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_FILE_NAME_CHANGE:
                general_log_response_code = process_file_name_change_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_FILE_DATA_CHECK:
                general_log_response_code = process_file_data_check_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_MEMORY_AREA_FILE_TRANSER:
                general_log_response_code = process_memory_area_file_transfer_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_PARAMETER_AREA_FILE_TRANSFER:
                general_log_response_code = process_parameter_area_file_transfer_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_PROGRAM_AREA_FILE_TRANSFER:
                general_log_response_code = process_program_area_file_transfer_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_FILE_MEMORY_INDEX_READ:
                general_log_response_code = process_file_memory_index_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_FILE_MEMORY_READ:
                general_log_response_code = process_file_memory_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_FILE_MEMORY_WRITE:
                general_log_response_code = process_file_memory_write_detail(c, finsCommand, omron_fins_link_id);
                break;
             case OMRON_FINS_ENUMS::CommandCode_FORCED_SET_RESET:
                general_log_response_code = process_forced_set_reset_detail(c, finsCommand, omron_fins_link_id);
                break;
             case OMRON_FINS_ENUMS::CommandCode_FORCED_SET_RESET_CANCEL:
                general_log_response_code = process_forced_set_reset_cancel_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_MULTIPLE_FORCED_STATUS_READ:
                general_log_response_code = process_multiple_forced_status_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_CLOCK_READ:
                general_log_response_code = process_clock_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_CLOCK_WRITE:
                general_log_response_code = process_clock_write_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_NAME_SET:
                general_log_response_code = process_name_set_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_NAME_READ:
                general_log_response_code = process_name_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_NAME_DELETE:
                general_log_response_code = process_name_delete_detail(c, finsCommand, omron_fins_link_id);
                break;
        }

        return general_log_response_code;
    }

    function process_fins_header(c: connection, info_general_log: general_log, finsHeader: OMRON_FINS::FINS_Header) : connection {

        # Map header information
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

        # Process the command details
        info_general_log$response_code = process_details(c, finsHeader$command, info_general_log$omron_fins_link_id);

        # Return the connection
        return c;
    }
