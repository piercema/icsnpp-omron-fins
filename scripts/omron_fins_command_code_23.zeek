module OMRON_FINS;

    function process_forced_set_reset_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        local info_detail_log: detail_log;

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            for (i in finsCommand$forcedSetResetCommand$command$forcedSetResetData) {
                c = set_session_detail_log(c);

                info_detail_log = c$omron_fins_detail_log;
                info_detail_log$omron_fins_link_id = link_id;
                info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

                info_detail_log$no_of_bits = finsCommand$forcedSetResetCommand$command$noOfBits;
                info_detail_log$set_reset_specification = OMRON_FINS_ENUMS::SET_RESET_SPECIFICATION[finsCommand$forcedSetResetCommand$command$forcedSetResetData[i]$setResetSpecification];
                info_detail_log$memory_area_code = OMRON_FINS_ENUMS::MEMORY_AREA[finsCommand$forcedSetResetCommand$command$forcedSetResetData[i]$memoryAreaCode];
                info_detail_log$bit_flag = finsCommand$forcedSetResetCommand$command$forcedSetResetData[i]$bitFlag;

                # Fire the event and tidy up
                OMRON_FINS::emit_omron_fins_detail_log(c);
                delete c$omron_fins_detail_log;
            }

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            c = set_session_detail_log(c);

            info_detail_log = c$omron_fins_detail_log;
            info_detail_log$omron_fins_link_id = link_id;
            info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$forcedSetResetCommand$response$responseCode];

            # Fire the event and tidy up
            OMRON_FINS::emit_omron_fins_detail_log(c);
            delete c$omron_fins_detail_log;
        }
    }

    function process_forced_set_reset_cancel_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        # Note: For the Forced Set/Reset command, there is no data to process; therefore we only process the response

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$forcedSetResetCancelCommand$response$responseCode];
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_multiple_forced_status_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_detail_log$memory_area_code = OMRON_FINS_ENUMS::MEMORY_AREA[finsCommand$multipleForcedStatusReadCommand$command$memoryAreaCode];
            info_detail_log$beginning_address = finsCommand$multipleForcedStatusReadCommand$command$beginningAddress;
            info_detail_log$no_of_units = finsCommand$multipleForcedStatusReadCommand$command$noOfUnits;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$multipleForcedStatusReadCommand$response$responseCode];
            info_detail_log$memory_area_code = OMRON_FINS_ENUMS::MEMORY_AREA[finsCommand$multipleForcedStatusReadCommand$response$memoryAreaCode];
            info_detail_log$beginning_address = finsCommand$multipleForcedStatusReadCommand$response$beginningAddress;
            info_detail_log$no_of_units = finsCommand$multipleForcedStatusReadCommand$response$noOfUnits;
            info_detail_log$data = finsCommand$multipleForcedStatusReadCommand$response$data;
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

