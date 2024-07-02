module OMRON_FINS;

export {
    function set_session_general_log(c: connection): connection {
        if ( ! c?$omron_fins_general_log )
            c$omron_fins_general_log = general_log(
                $ts=network_time(),
                $uid=c$uid,
                $id=c$id,
                $proto="omron_fins");
        
        return c;
    }

    function set_session_detail_log(c: connection): connection {
        if ( ! c?$omron_fins_detail_log )
            c$omron_fins_detail_log = detail_log(
                $ts=network_time(),
                $uid=c$uid,
                $id=c$id);

        return c;
    }

    function process_command_and_datatype_detail(info_detail_log: detail_log, finsCommand: OMRON_FINS::Command): detail_log {

        info_detail_log$command_code  = OMRON_FINS_ENUMS::COMMAND[finsCommand$commandCode];
        info_detail_log$icf_data_type = OMRON_FINS_ENUMS::DATA_TYPE[finsCommand$icfDataType];

        return info_detail_log;
    }

    function process_memory_area_read_detail(c: connection, finsCommand: OMRON_FINS::Command) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_detail_log$memory_area_code  = OMRON_FINS_ENUMS::MEMORY_AREA[finsCommand$memoryAreaRead$command$memoryAreaReadType$memoryAreaCode];
            info_detail_log$beginning_address = finsCommand$memoryAreaRead$command$memoryAreaReadType$beginningAddress;     
            info_detail_log$number_of_items   = finsCommand$memoryAreaRead$command$numberOfItems;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaRead$response$responseCode];
            info_detail_log$data          = finsCommand$memoryAreaRead$response$data;
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_multiple_memory_area_read_detail(c : connection, finsCommand: OMRON_FINS::Command) {

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            for (i in finsCommand$multipleMemoryAreaRead$command$memoryAreaReadType) {
                # Set/add the detail_log to the connection
                c = set_session_detail_log(c);

                # Set the data
                c$omron_fins_detail_log = process_command_and_datatype_detail(c$omron_fins_detail_log, finsCommand);
                c$omron_fins_detail_log$memory_area_code  = OMRON_FINS_ENUMS::MEMORY_AREA[finsCommand$multipleMemoryAreaRead$command$memoryAreaReadType[i]$memoryAreaCode];
                c$omron_fins_detail_log$beginning_address = finsCommand$multipleMemoryAreaRead$command$memoryAreaReadType[i]$beginningAddress;

                 # Fire the event and tidy up
                OMRON_FINS::emit_omron_fins_detail_log(c);
                delete c$omron_fins_detail_log;

            }
        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            print "processMultipleMemoryAreaRead:: Response";
        }


    }


}
