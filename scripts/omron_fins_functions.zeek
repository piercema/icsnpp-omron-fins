module OMRON_FINS;

export {

    function process_memory_area_read(info_detail_log: detail_log, fins_command: OMRON_FINS::Command): detail_log {

        if (fins_command$icf_data_type == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_detail_log$memory_area_code       = OMRON_FINS_ENUMS::MEMORY_AREA[fins_command$memory_area_read$command$memory_area_code];
            info_detail_log$beginning_address      = fins_command$memory_area_read$command$beginning_address;     
            info_detail_log$number_of_items        = fins_command$memory_area_read$command$number_of_items;

        } else if (fins_command$icf_data_type == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[fins_command$memory_area_read$response$response_code];
            info_detail_log$data          = fins_command$memory_area_read$response$data;
        }

        return info_detail_log;
    }

}
