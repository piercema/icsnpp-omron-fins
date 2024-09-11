module OMRON_FINS;

    function process_details(c: connection, finsCommand: OMRON_FINS::Command, omron_fins_link_id: string) {
        switch(finsCommand$commandCode) {
            case OMRON_FINS_ENUMS::CommandCode_MEMORY_AREA_READ:
                process_memory_area_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_MEMORY_AREA_WRITE:
                process_memory_area_write_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_MULTIPLE_MEMORY_AREA_READ:
                process_multiple_memory_area_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_MEMORY_AREA_FILL:
                process_memory_area_fill_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_MEMORY_AREA_TRANSFER:
                process_memory_area_transfer_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_PARAMETER_AREA_READ:
                process_parameter_area_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_PARAMETER_AREA_WRITE:
                process_parameter_area_write_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_PARAMETER_AREA_CLEAR:
                process_parameter_area_clear_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_DATA_LINK_TABLE_READ:
                process_data_link_table_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_DATA_LINK_TABLE_WRITE:
                process_data_link_table_write_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_PROGRAM_AREA_PROTECT:
                process_program_area_protect_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_PROGRAM_AREA_PROTECT_CLEAR:
                process_program_area_protect_clear_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_PROGRAM_AREA_READ:
                process_program_area_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_PROGRAM_AREA_WRITE:
                process_program_area_write_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_PROGRAM_AREA_CLEAR:
                process_program_area_clear_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_RUN:
                process_run_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_STOP:
                process_stop_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_CONTROLLER_DATA_READ:
                process_controller_data_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_CONNECTION_DATA_READ:
                process_connection_data_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_CONTROLLER_STATUS_READ:
                process_controller_status_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_NETWORK_STATUS_READ:
                process_network_status_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_DATA_LINK_STATUS_READ:
                process_data_link_status_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_LOOP_BACK_TEST:
                process_loop_back_test_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_BROADCAST_TEST_RESULTS_READ:
                process_broadcast_test_results_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_BROADCAST_TEST_DATA_SEND:
                process_broadcast_test_data_send_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_MESSAGE_READ_MESSAGE_CLEAR_FAL_FALS_READ:
                process_message_read_message_clear_fal_fals_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_ACCESS_RIGHT_ACQUIRE:
                process_access_right_acquire_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_ACCESS_RIGHT_FORCED_ACQUIRE:
                process_access_right_forced_acquire_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_ACCESS_RIGHT_RELEASE:
                process_access_right_release_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_ERROR_CLEAR:
                process_error_clear_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_ERROR_LOG_READ:
                process_error_log_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_ERROR_LOG_CLEAR:
                process_error_log_clear_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_FILE_NAME_READ:
                process_file_name_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_SINGLE_FILE_READ:
                process_single_file_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_SINGLE_FILE_WRITE:
                process_single_file_write_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_MEMORY_CARD_FORMAT:
                process_memory_card_format_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_FILE_DELETE:
                process_file_delete_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_VOLUME_LABEL_CREATE_DELETE:
                process_volume_label_create_delete_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_FILE_COPY:
                process_file_copy_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_FILE_NAME_CHANGE:
                process_file_name_change_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_FILE_DATA_CHECK:
                process_file_data_check_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_MEMORY_AREA_FILE_TRANSER:
                process_memory_area_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_PARAMETER_AREA_FILE_TRANSFER:
                process_parameter_area_file_transfer_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_PROGRAM_AREA_FILE_TRANSFER:
                process_program_area_file_transfer_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_FILE_MEMORY_INDEX_READ:
                process_file_memory_index_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_FILE_MEMORY_READ:
                process_file_memory_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_FILE_MEMORY_WRITE:
                process_file_memory_write_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_CYCLE_TIME_READ:
                process_cycle_time_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_CLOCK_READ:
                process_clock_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_CLOCK_WRITE:
                process_clock_write_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_NAME_SET:
                process_name_set_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_NAME_READ:
                process_name_read_detail(c, finsCommand, omron_fins_link_id);
                break;
            case OMRON_FINS_ENUMS::CommandCode_NAME_DELETE:
                process_name_delete_detail(c, finsCommand, omron_fins_link_id);
                break;
        }
    }
