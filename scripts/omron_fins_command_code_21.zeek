module OMRON_FINS;

    function process_error_clear_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        local error_log = detail_error_log($ts=network_time(), $uid=c$uid, $id=c$id);
        error_log$omron_fins_link_id = link_id;
        error_log$command_code       = OMRON_FINS_ENUMS::COMMAND[finsCommand$commandCode];
        error_log$icf_data_type      = OMRON_FINS_ENUMS::DATA_TYPE[finsCommand$icfDataType];
        c$omron_fins_error_log       = error_log;

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
        local error_log : detail_error_log;


        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            # Setup detail error log
            error_log = detail_error_log($ts=network_time(), $uid=c$uid, $id=c$id);
            error_log$omron_fins_link_id = link_id;
            error_log$command_code       = OMRON_FINS_ENUMS::COMMAND[finsCommand$commandCode];
            error_log$icf_data_type      = OMRON_FINS_ENUMS::DATA_TYPE[finsCommand$icfDataType];
            c$omron_fins_error_log       = error_log;

            # Set values
            error_log$beginning_record_no = finsCommand$errorLogReadCommand$command$beginningRecordNo;
            error_log$no_of_records       = finsCommand$errorLogReadCommand$command$noOfRecords;

            # Fire the event and tidy up
            OMRON_FINS::emit_omron_fins_error_log(c);
            delete c$omron_fins_error_log;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            # Loop over the error records
            for (i in finsCommand$errorLogReadCommand$response$errorRecords) {
                # Setup detail error log
                error_log = detail_error_log($ts=network_time(), $uid=c$uid, $id=c$id);
                error_log$omron_fins_link_id = link_id;
                error_log$command_code       = OMRON_FINS_ENUMS::COMMAND[finsCommand$commandCode];
                error_log$icf_data_type      = OMRON_FINS_ENUMS::DATA_TYPE[finsCommand$icfDataType];
                c$omron_fins_error_log       = error_log;

                # Set values
                error_log$response_code         = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$errorLogReadCommand$response$responseCode];
                error_log$max_no_stored_records = finsCommand$errorLogReadCommand$response$maxNoStoredRecords;
                error_log$no_of_stored_records  = finsCommand$errorLogReadCommand$response$noOfStoredRecords;
                error_log$no_of_records         = finsCommand$errorLogReadCommand$response$noOfRecords;
                error_log$error_code_1          = OMRON_FINS_ERROR_CODES::ERROR_CODES[finsCommand$errorLogReadCommand$response$errorRecords[i]$errorCode1];
                error_log$error_code_2          = OMRON_FINS_ERROR_CODES::ERROR_CODES[finsCommand$errorLogReadCommand$response$errorRecords[i]$errorCode2];
                error_log$minute                = finsCommand$errorLogReadCommand$response$errorRecords[i]$minute;
                error_log$second                = finsCommand$errorLogReadCommand$response$errorRecords[i]$second;
                error_log$day                   = finsCommand$errorLogReadCommand$response$errorRecords[i]$day;
                error_log$hour                  = finsCommand$errorLogReadCommand$response$errorRecords[i]$hour;
                error_log$year                  = finsCommand$errorLogReadCommand$response$errorRecords[i]$year;
                error_log$month                 = finsCommand$errorLogReadCommand$response$errorRecords[i]$month;

                # Fire the event and tidy up
                OMRON_FINS::emit_omron_fins_error_log(c);
                delete c$omron_fins_error_log;
            }
        }
    }

    function process_error_log_clear_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        local error_log = detail_error_log($ts=network_time(), $uid=c$uid, $id=c$id);
        error_log$omron_fins_link_id = link_id;
        error_log$command_code       = OMRON_FINS_ENUMS::COMMAND[finsCommand$commandCode];
        error_log$icf_data_type      = OMRON_FINS_ENUMS::DATA_TYPE[finsCommand$icfDataType];
        c$omron_fins_error_log       = error_log;

        # Note: For the Error Log Clear command,there is no data to process; therefore we only process the response

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            error_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$errorLogClearCommand$response$responseCode];
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_error_log(c);
        delete c$omron_fins_error_log;

    }



