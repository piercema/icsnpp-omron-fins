module OMRON_FINS;

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

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_detail_log$memory_area_code  = OMRON_FINS_ENUMS::MEMORY_AREA[finsCommand$memoryAreaWrite$command$memoryAreaWriteCommandType$memoryAreaCode];
            info_detail_log$beginning_address = finsCommand$memoryAreaWrite$command$memoryAreaWriteCommandType$beginningAddress;     
            info_detail_log$number_of_items   = finsCommand$memoryAreaWrite$command$numberOfItems;
            info_detail_log$data              = finsCommand$memoryAreaWrite$command$dataAsString;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaWrite$response$responseCode];
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_multiple_memory_area_read_detail(c : connection, finsCommand: OMRON_FINS::Command, link_id: string) {

        local info_detail_log: detail_log;
        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            for (i in finsCommand$multipleMemoryAreaRead$command$memoryAreaReadCommandType) {
                # Set/add the detail_log to the connection
                c = set_session_detail_log(c);
                info_detail_log = c$omron_fins_detail_log;

                # Set the data
                info_detail_log$omron_fins_link_id = link_id;
                info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);
                info_detail_log$memory_area_code  = OMRON_FINS_ENUMS::MEMORY_AREA[finsCommand$multipleMemoryAreaRead$command$memoryAreaReadCommandType[i]$memoryAreaCode];
                info_detail_log$beginning_address = finsCommand$multipleMemoryAreaRead$command$memoryAreaReadCommandType[i]$beginningAddress;

                # Fire the event and tidy up
                OMRON_FINS::emit_omron_fins_detail_log(c);
                delete c$omron_fins_detail_log;
            }
        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            for (i in finsCommand$multipleMemoryAreaRead$response$memoryAreaReadResponseType) {
                # Set/add the detail_log to the connection
                c = set_session_detail_log(c);
                info_detail_log = c$omron_fins_detail_log;

                # Set the data
                info_detail_log$omron_fins_link_id = link_id;
                info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);
                info_detail_log$response_code    = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$multipleMemoryAreaRead$response$responseCode];
                info_detail_log$memory_area_code = OMRON_FINS_ENUMS::MEMORY_AREA[finsCommand$multipleMemoryAreaRead$response$memoryAreaReadResponseType[i]$memoryAreaCode];
                info_detail_log$data             = finsCommand$multipleMemoryAreaRead$response$memoryAreaReadResponseType[i]$data;

                # Fire the event and tidy up
                OMRON_FINS::emit_omron_fins_detail_log(c);
                delete c$omron_fins_detail_log;
            }
        }
    }

    function process_memory_area_fill_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_detail_log$memory_area_code  = OMRON_FINS_ENUMS::MEMORY_AREA[finsCommand$memoryAreaFill$command$memoryAreaFillCommandType$memoryAreaCode];
            info_detail_log$beginning_address = finsCommand$memoryAreaFill$command$memoryAreaFillCommandType$beginningAddress;     
            info_detail_log$number_of_items   = finsCommand$memoryAreaFill$command$numberOfItems;
            info_detail_log$data              = finsCommand$memoryAreaFill$command$data;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaFill$response$responseCode];
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

