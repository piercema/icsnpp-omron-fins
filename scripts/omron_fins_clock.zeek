module OMRON_FINS;

    function process_clock_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        # Note: For the Clock Read command,there is no data to process; therefore we only process the response

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$clockRead$response$responseCode];
            info_detail_log$year          = finsCommand$clockRead$response$year;
            info_detail_log$month         = finsCommand$clockRead$response$month;
            info_detail_log$date          = finsCommand$clockRead$response$date;
            info_detail_log$hour          = finsCommand$clockRead$response$hour;
            info_detail_log$minute        = finsCommand$clockRead$response$minute;
            info_detail_log$second        = finsCommand$clockRead$response$second;
            info_detail_log$day           = OMRON_FINS_ENUMS::DAY_OF_WEEK[finsCommand$clockRead$response$day];
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_clock_write_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_detail_log$year          = finsCommand$clockWrite$command$year;
            info_detail_log$month         = finsCommand$clockWrite$command$month;
            info_detail_log$date          = finsCommand$clockWrite$command$date;
            info_detail_log$hour          = finsCommand$clockWrite$command$hour;
            info_detail_log$minute        = finsCommand$clockWrite$command$minute;
            info_detail_log$second        = finsCommand$clockWrite$command$second;
            info_detail_log$day           = OMRON_FINS_ENUMS::DAY_OF_WEEK[finsCommand$clockWrite$command$day];
        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$clockWrite$response$responseCode];
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }
