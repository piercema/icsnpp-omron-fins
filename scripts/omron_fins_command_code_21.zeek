module OMRON_FINS;

    function process_error_clear_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        local error_log = detail_error_log($ts=network_time(), $uid=c$uid, $id=c$id);
        error_log$omron_fins_link_id = link_id;
        error_log$command_code       = OMRON_FINS_ENUMS::COMMAND[finsCommand$commandCode];
        error_log$icf_data_type      = OMRON_FINS_ENUMS::DATA_TYPE[finsCommand$icfDataType];
        c$omron_fins_error_log = error_log;

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            error_log$error_reset_fal_no = OMRON_FINS_ERROR_CODES::ERROR_CODES[finsCommand$errorClearCommand$command$errorResetFalNo];
        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            error_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$errorClearCommand$response$responseCode];
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_error_log(c);
        delete c$omron_fins_error_log;
    }

    function process_error_log_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            print "process_error_log_read_detail: COMMAND";
        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$errorLogReadCommand$response$responseCode];
            print "process_error_log_read_detail: RESPONSE";
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_error_log_clear_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            print "process_error_log_clear_detail: COMMAND";
        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$errorLogClearCommand$response$responseCode];
            print "process_error_log_clear_detail: RESPONSE";
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }



