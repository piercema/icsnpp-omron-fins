module OMRON_FINS;

    function process_name_set_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string): string {
        # Local string to hold the response code for general logging
        local general_log_response_code : string;
        general_log_response_code = "";

        # Set sesssion detail log object
        c = set_session_detail_log(c);
        local info_detail_log = c$omron_fins_detail_log;

        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_detail_log$data = finsCommand$nameSetCommand$command$nameDataAsString;

            # Fire the event and tidy up
            OMRON_FINS::emit_omron_fins_detail_log(c);
            delete c$omron_fins_detail_log;

        }
        else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            #
            # Since there is only a response for this command, we capture the response_code in the general log file and 
            # not in the info_detail_log file.
            #

            # Set the general logging response code
            general_log_response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$nameSetCommand$response$responseCode];
        }

        # Return the response code for general logging
        return general_log_response_code;
    }

    function process_name_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string): string {
        # Local string to hold the response code for general logging
        local general_log_response_code : string;
        general_log_response_code = "";

        # Set sesssion detail log object
         c = set_session_detail_log(c);
        local info_detail_log = c$omron_fins_detail_log;

        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        # Note: For the Name Read command,there is no data to process; therefore we only process the response

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$nameReadCommand$response$responseCode];
            info_detail_log$data = finsCommand$nameReadCommand$command$nameDataAsString;

            # Fire the event and tidy up
            OMRON_FINS::emit_omron_fins_detail_log(c);
            delete c$omron_fins_detail_log;

            # Set the general logging response code
            general_log_response_code = info_detail_log$response_code;
        }

        # Return the response code for general logging
        return general_log_response_code;
    }

    function process_name_delete_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string): string {
        # Local string to hold the response code for general logging
        local general_log_response_code : string;
        general_log_response_code = "";

        # Note: For the Name Delete command,there is no data to process; therefore we only process the response

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            #
            # Since there is only a response for this command, we capture the response_code in the general log file and 
            # not in the info_detail_log file.
            #

            # Set the general logging response code
            general_log_response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$nameDeleteCommand$response$responseCode];
        }

        # Return the response code for general logging
        return general_log_response_code;
   }
