module OMRON_FINS;

    function process_clock_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string): string {
        # Local string to hold the response code for general logging
        local general_log_response_code : string;
        general_log_response_code = "";

        # Set sesssion detail log object
        c = set_session_detail_log(c);
        local info_detail_log = c$omron_fins_detail_log;

        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        # Note: For the Clock Read command,there is no data to process; therefore we only process the response

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$clockReadCommand$response$responseCode];
            info_detail_log$year          = finsCommand$clockReadCommand$response$year;
            info_detail_log$month         = finsCommand$clockReadCommand$response$month;
            info_detail_log$date          = finsCommand$clockReadCommand$response$date;
            info_detail_log$hour          = finsCommand$clockReadCommand$response$hour;
            info_detail_log$minute        = finsCommand$clockReadCommand$response$minute;
            info_detail_log$second        = finsCommand$clockReadCommand$response$second;
            info_detail_log$day           = OMRON_FINS_ENUMS::DAY_OF_WEEK[finsCommand$clockReadCommand$response$day];

            # Set the general logging response code
            general_log_response_code = info_detail_log$response_code;

            # Fire the event and tidy up
            OMRON_FINS::emit_omron_fins_detail_log(c);
            delete c$omron_fins_detail_log;

        }

        # Return the response code for general logging
        return general_log_response_code;
    }

    function process_clock_write_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string): string {
        # Local string to hold the response code for general logging
        local general_log_response_code : string;
        general_log_response_code = "";

        # Set sesssion detail log object
        c = set_session_detail_log(c);
        local info_detail_log = c$omron_fins_detail_log;

        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_detail_log$year          = finsCommand$clockWriteCommand$command$year;
            info_detail_log$month         = finsCommand$clockWriteCommand$command$month;
            info_detail_log$date          = finsCommand$clockWriteCommand$command$date;
            info_detail_log$hour          = finsCommand$clockWriteCommand$command$hour;
            info_detail_log$minute        = finsCommand$clockWriteCommand$command$minute;
            info_detail_log$second        = finsCommand$clockWriteCommand$command$second;
            info_detail_log$day           = OMRON_FINS_ENUMS::DAY_OF_WEEK[finsCommand$clockWriteCommand$command$day];

            # Fire the event and tidy up
            OMRON_FINS::emit_omron_fins_detail_log(c);
            delete c$omron_fins_detail_log;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            #
            # Since there is only a response for this command, we capture the response_code in the general log file and 
            # not in the info_detail_log file.
            #

            # Set the general logging response code
            general_log_response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$clockWriteCommand$response$responseCode];
        }

        # Return the response code for general logging
        return general_log_response_code;
    }
