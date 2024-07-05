module OMRON_FINS;

export {
    function process_memory_area_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_detail_log$memory_area_code  = OMRON_FINS_ENUMS::MEMORY_AREA[finsCommand$memoryAreaRead$command$memoryAreaReadCommandType$memoryAreaCode];
            info_detail_log$beginning_address = finsCommand$memoryAreaRead$command$memoryAreaReadCommandType$beginningAddress;     
            info_detail_log$number_of_items   = finsCommand$memoryAreaRead$command$numberOfItems;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaRead$response$responseCode];
            info_detail_log$data          = finsCommand$memoryAreaRead$response$data;
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_memory_area_write_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        c$omron_fins_detail_log$omron_fins_link_id = link_id;
        c$omron_fins_detail_log = process_command_and_datatype_detail(c$omron_fins_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            c$omron_fins_detail_log$memory_area_code  = OMRON_FINS_ENUMS::MEMORY_AREA[finsCommand$memoryAreaWrite$command$memoryAreaWriteCommandType$memoryAreaCode];
            c$omron_fins_detail_log$beginning_address = finsCommand$memoryAreaWrite$command$memoryAreaWriteCommandType$beginningAddress;     
            c$omron_fins_detail_log$number_of_items   = finsCommand$memoryAreaWrite$command$numberOfItems;
            c$omron_fins_detail_log$data              = finsCommand$memoryAreaWrite$command$dataAsString;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            c$omron_fins_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaWrite$response$responseCode];
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_multiple_memory_area_read_detail(c : connection, finsCommand: OMRON_FINS::Command, link_id: string) {

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            for (i in finsCommand$multipleMemoryAreaRead$command$memoryAreaReadCommandType) {
                # Set/add the detail_log to the connection
                c = set_session_detail_log(c);

                # Set the data
                c$omron_fins_detail_log$omron_fins_link_id = link_id;
                c$omron_fins_detail_log = process_command_and_datatype_detail(c$omron_fins_detail_log, finsCommand);
                c$omron_fins_detail_log$memory_area_code  = OMRON_FINS_ENUMS::MEMORY_AREA[finsCommand$multipleMemoryAreaRead$command$memoryAreaReadCommandType[i]$memoryAreaCode];
                c$omron_fins_detail_log$beginning_address = finsCommand$multipleMemoryAreaRead$command$memoryAreaReadCommandType[i]$beginningAddress;

                 # Fire the event and tidy up
                OMRON_FINS::emit_omron_fins_detail_log(c);
                delete c$omron_fins_detail_log;
            }
        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            for (i in finsCommand$multipleMemoryAreaRead$response$memoryAreaReadResponseType) {
                # Set/add the detail_log to the connection
                c = set_session_detail_log(c);
 
                # Set the data
                c$omron_fins_detail_log$omron_fins_link_id = link_id;
                c$omron_fins_detail_log = process_command_and_datatype_detail(c$omron_fins_detail_log, finsCommand);
                c$omron_fins_detail_log$response_code    = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$multipleMemoryAreaRead$response$responseCode];
                c$omron_fins_detail_log$memory_area_code = OMRON_FINS_ENUMS::MEMORY_AREA[finsCommand$multipleMemoryAreaRead$response$memoryAreaReadResponseType[i]$memoryAreaCode];
                c$omron_fins_detail_log$data             = finsCommand$multipleMemoryAreaRead$response$memoryAreaReadResponseType[i]$data;
 
                # Fire the event and tidy up
                OMRON_FINS::emit_omron_fins_detail_log(c);
                delete c$omron_fins_detail_log;
            }
        }
    }
}
