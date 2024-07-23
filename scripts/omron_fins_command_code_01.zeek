module OMRON_FINS;

    function process_memory_area_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_detail_log$memory_area_code  = OMRON_FINS_ENUMS::MEMORY_AREA[finsCommand$memoryAreaReadCommand$command$memoryAreaReadCommandType$memoryAreaCode];
            info_detail_log$beginning_address = finsCommand$memoryAreaReadCommand$command$memoryAreaReadCommandType$beginningAddress;     
            info_detail_log$number_of_items   = finsCommand$memoryAreaReadCommand$command$numberOfItems;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaReadCommand$response$responseCode];
            info_detail_log$data          = finsCommand$memoryAreaReadCommand$response$data;
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
            info_detail_log$memory_area_code  = OMRON_FINS_ENUMS::MEMORY_AREA[finsCommand$memoryAreaWriteCommand$command$memoryAreaWriteCommandType$memoryAreaCode];
            info_detail_log$beginning_address = finsCommand$memoryAreaWriteCommand$command$memoryAreaWriteCommandType$beginningAddress;     
            info_detail_log$number_of_items   = finsCommand$memoryAreaWriteCommand$command$numberOfItems;
            info_detail_log$data              = finsCommand$memoryAreaWriteCommand$command$dataAsString;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaWriteCommand$response$responseCode];
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_multiple_memory_area_read_detail(c : connection, finsCommand: OMRON_FINS::Command, link_id: string) {

        local info_detail_log: detail_log;
        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            for (i in finsCommand$multipleMemoryAreaReadCommand$command$memoryAreaReadCommandType) {
                # Set/add the detail_log to the connection
                c = set_session_detail_log(c);
                info_detail_log = c$omron_fins_detail_log;

                # Set the data
                info_detail_log$omron_fins_link_id = link_id;
                info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);
                info_detail_log$memory_area_code  = OMRON_FINS_ENUMS::MEMORY_AREA[finsCommand$multipleMemoryAreaReadCommand$command$memoryAreaReadCommandType[i]$memoryAreaCode];
                info_detail_log$beginning_address = finsCommand$multipleMemoryAreaReadCommand$command$memoryAreaReadCommandType[i]$beginningAddress;

                # Fire the event and tidy up
                OMRON_FINS::emit_omron_fins_detail_log(c);
                delete c$omron_fins_detail_log;
            }
        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            for (i in finsCommand$multipleMemoryAreaReadCommand$response$memoryAreaReadResponseType) {
                # Set/add the detail_log to the connection
                c = set_session_detail_log(c);
                info_detail_log = c$omron_fins_detail_log;

                # Set the data
                info_detail_log$omron_fins_link_id = link_id;
                info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);
                info_detail_log$response_code    = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$multipleMemoryAreaReadCommand$response$responseCode];
                info_detail_log$memory_area_code = OMRON_FINS_ENUMS::MEMORY_AREA[finsCommand$multipleMemoryAreaReadCommand$response$memoryAreaReadResponseType[i]$memoryAreaCode];
                info_detail_log$data             = finsCommand$multipleMemoryAreaReadCommand$response$memoryAreaReadResponseType[i]$data;

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
            info_detail_log$memory_area_code  = OMRON_FINS_ENUMS::MEMORY_AREA[finsCommand$memoryAreaFillCommand$command$memoryAreaFillCommandType$memoryAreaCode];
            info_detail_log$beginning_address = finsCommand$memoryAreaFillCommand$command$memoryAreaFillCommandType$beginningAddress;     
            info_detail_log$number_of_items   = finsCommand$memoryAreaFillCommand$command$numberOfItems;
            info_detail_log$data              = finsCommand$memoryAreaFillCommand$command$data;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaFillCommand$response$responseCode];
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_memory_area_transfer_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {

        local info_detail_log: detail_log;

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            #
            # Source information
            #

            # Set/add the detail_log to the connection
            c = set_session_detail_log(c);
            info_detail_log = c$omron_fins_detail_log;

            # Set the source data
            info_detail_log$omron_fins_link_id = link_id;
            info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);
            info_detail_log$memory_area_code  = OMRON_FINS_ENUMS::MEMORY_AREA[finsCommand$memoryAreaTransferCommand$command$memoryAreaTransferSource$memoryAreaCode] + " (Source)";
            info_detail_log$beginning_address = finsCommand$memoryAreaTransferCommand$command$memoryAreaTransferSource$beginningAddress;     
            info_detail_log$number_of_items   = finsCommand$memoryAreaTransferCommand$command$numberOfItems;

            # Fire the event and tidy up
            OMRON_FINS::emit_omron_fins_detail_log(c);
            delete c$omron_fins_detail_log;

            #
            # Destination information
            #

            # Set/add the detail_log to the connection
            c = set_session_detail_log(c);
            info_detail_log = c$omron_fins_detail_log;

            # Set the destination data
            info_detail_log$omron_fins_link_id = link_id;
            info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);
            info_detail_log$memory_area_code  = OMRON_FINS_ENUMS::MEMORY_AREA[finsCommand$memoryAreaTransferCommand$command$memoryAreaTransferDestination$memoryAreaCode] + " (Destination)";
            info_detail_log$beginning_address = finsCommand$memoryAreaTransferCommand$command$memoryAreaTransferDestination$beginningAddress;     

            # Fire the event and tidy up
            OMRON_FINS::emit_omron_fins_detail_log(c);
            delete c$omron_fins_detail_log;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            # Set/add the detail_log to the connection
            c = set_session_detail_log(c);
            info_detail_log = c$omron_fins_detail_log;

            # Set the data
            info_detail_log$omron_fins_link_id = link_id;
            info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaTransferCommand$response$responseCode];

            # Fire the event and tidy up
            OMRON_FINS::emit_omron_fins_detail_log(c);
            delete c$omron_fins_detail_log;
        }
    }
