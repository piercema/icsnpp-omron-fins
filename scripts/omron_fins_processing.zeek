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
