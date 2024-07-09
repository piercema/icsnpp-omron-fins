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
        }
    }
