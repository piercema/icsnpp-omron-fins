module OMRON_FINS;

export {

    function process_memory_area_read(info_detail_log: detail_log, finsCommand: OMRON_FINS::Command): detail_log {

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_detail_log$memory_area_code       = OMRON_FINS_ENUMS::MEMORY_AREA[finsCommand$memoryAreaRead$command$memoryAreaCode];
            info_detail_log$beginning_address      = finsCommand$memoryAreaRead$command$beginningAddress;     
            info_detail_log$number_of_items        = finsCommand$memoryAreaRead$command$numberOfItems;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaRead$response$responseCode];
            info_detail_log$data          = finsCommand$memoryAreaRead$response$data;
        }

        return info_detail_log;
    }

}
