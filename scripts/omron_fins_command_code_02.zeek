module OMRON_FINS;

    function process_parameter_area_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_detail_log$parameter_area_code = OMRON_FINS_ENUMS::PARAMETER_AREA_CODE[finsCommand$parameterAreaReadCommand$command$parameterAreaCode];
            info_detail_log$beginning_word      = finsCommand$parameterAreaReadCommand$command$beginningWord;
            info_detail_log$number_of_words     = finsCommand$parameterAreaReadCommand$command$numberOfWords$wordsToRead;
            info_detail_log$last_word_bit       = finsCommand$parameterAreaReadCommand$command$numberOfWords$lastWordBit;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code       = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$parameterAreaReadCommand$response$responseCode];
            info_detail_log$parameter_area_code = OMRON_FINS_ENUMS::PARAMETER_AREA_CODE[finsCommand$parameterAreaReadCommand$response$parameterAreaCode];
            info_detail_log$beginning_word      = finsCommand$parameterAreaReadCommand$response$beginningWord;
            info_detail_log$number_of_words     = finsCommand$parameterAreaReadCommand$response$numberOfWords$wordsToRead;
            info_detail_log$last_word_bit       = finsCommand$parameterAreaReadCommand$response$numberOfWords$lastWordBit;
            info_detail_log$data                = finsCommand$parameterAreaReadCommand$response$dataAsString;
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_parameter_area_write_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_detail_log$parameter_area_code = OMRON_FINS_ENUMS::PARAMETER_AREA_CODE[finsCommand$parameterAreaWriteCommand$command$parameterAreaCode];
            info_detail_log$beginning_word      = finsCommand$parameterAreaWriteCommand$command$beginningWord;
            info_detail_log$number_of_words     = finsCommand$parameterAreaWriteCommand$command$numberOfWords$wordsToRead;
            info_detail_log$last_word_bit       = finsCommand$parameterAreaWriteCommand$command$numberOfWords$lastWordBit;
            info_detail_log$data                = finsCommand$parameterAreaWriteCommand$command$dataAsString;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$parameterAreaWriteCommand$response$responseCode];
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_parameter_area_clear_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_detail_log$parameter_area_code = OMRON_FINS_ENUMS::PARAMETER_AREA_CODE[finsCommand$parameterAreaClearCommand$command$parameterAreaCode];
            info_detail_log$beginning_word      = finsCommand$parameterAreaClearCommand$command$beginningWord;
            info_detail_log$number_of_words     = finsCommand$parameterAreaClearCommand$command$numberOfWords;
            info_detail_log$data                = finsCommand$parameterAreaClearCommand$command$data;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$parameterAreaClearCommand$response$responseCode];
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_data_link_table_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {

        local info_detail_log: detail_log;

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            # Set/add the detail_log to the connection
            c = set_session_detail_log(c);
            info_detail_log = c$omron_fins_detail_log;

            # Set the data
            info_detail_log$omron_fins_link_id = link_id;
            info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);
            info_detail_log$fixed = finsCommand$dataLinkTableReadCommand$command$fixed;
            info_detail_log$intelligent_id_no = finsCommand$dataLinkTableReadCommand$command$intelligentIdNo;
            info_detail_log$first_word = finsCommand$dataLinkTableReadCommand$command$firstWord;
            info_detail_log$read_length = finsCommand$dataLinkTableReadCommand$command$readLength;

            # Fire the event and tidy up
            OMRON_FINS::emit_omron_fins_detail_log(c);
            delete c$omron_fins_detail_log;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {

            for (i in finsCommand$dataLinkTableReadCommand$response$blockRecord) {
                # Set/add the detail_log to the connection
                c = set_session_detail_log(c);
                info_detail_log = c$omron_fins_detail_log;

                # Set the data
                info_detail_log$omron_fins_link_id = link_id;
                info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);
                info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$dataLinkTableReadCommand$response$responseCode];

                info_detail_log$num_of_link_nodes = finsCommand$dataLinkTableReadCommand$response$numOfLinkNodesMask$numOfLinkNodes;

                info_detail_log$block_record_data_link_status = OMRON_FINS_ENUMS::DATA_LINK_STATUS[finsCommand$dataLinkTableReadCommand$response$blockRecord[i]$nodeNum$dataLinkStatus];
                info_detail_log$block_record_num_of_link_nodes = finsCommand$dataLinkTableReadCommand$response$blockRecord[i]$nodeNum$numOfLinkNodes;
                info_detail_log$block_record_cio_area_first_word = finsCommand$dataLinkTableReadCommand$response$blockRecord[i]$cioAreaFirstWord;
                info_detail_log$block_record_kind_of_dm = finsCommand$dataLinkTableReadCommand$response$blockRecord[i]$kindOfDM;
                info_detail_log$block_record_dm_area_first_word = finsCommand$dataLinkTableReadCommand$response$blockRecord[i]$dmAreaFirstWord;
                info_detail_log$block_record_num_of_total_words = finsCommand$dataLinkTableReadCommand$response$blockRecord[i]$numOfTotalWords;

                # Fire the event and tidy up
                OMRON_FINS::emit_omron_fins_detail_log(c);
                delete c$omron_fins_detail_log;
            }
        }
    }

    function process_data_link_table_write_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {

        local info_detail_log: detail_log;

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {

            for (i in finsCommand$dataLinkTableWriteCommand$command$blockRecord) {
                # Set/add the detail_log to the connection
                c = set_session_detail_log(c);
                info_detail_log = c$omron_fins_detail_log;

                # Set the data
                info_detail_log$omron_fins_link_id = link_id;
                info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

                info_detail_log$fixed = finsCommand$dataLinkTableWriteCommand$command$fixed;
                info_detail_log$intelligent_id_no = finsCommand$dataLinkTableWriteCommand$command$intelligentIdNo;
                info_detail_log$first_word = finsCommand$dataLinkTableWriteCommand$command$firstWord;
                info_detail_log$data_length = finsCommand$dataLinkTableWriteCommand$command$dataLength;
                info_detail_log$num_of_link_nodes = finsCommand$dataLinkTableWriteCommand$command$numOfLinkNodesMask$numOfLinkNodes;

                info_detail_log$block_record_node_num = finsCommand$dataLinkTableWriteCommand$command$blockRecord[i]$nodeNumMask$nodeNum;
                info_detail_log$block_record_cio_area_first_word = finsCommand$dataLinkTableWriteCommand$command$blockRecord[i]$cioAreaFirstWord;
                info_detail_log$block_record_kind_of_dm = finsCommand$dataLinkTableWriteCommand$command$blockRecord[i]$kindOfDM;
                info_detail_log$block_record_dm_area_first_word = finsCommand$dataLinkTableWriteCommand$command$blockRecord[i]$dmAreaFirstWord;
                info_detail_log$block_record_num_of_total_words = finsCommand$dataLinkTableWriteCommand$command$blockRecord[i]$numOfTotalWords;

                # Fire the event and tidy up
                OMRON_FINS::emit_omron_fins_detail_log(c);
                delete c$omron_fins_detail_log;
            }

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {

            # Set/add the detail_log to the connection
            c = set_session_detail_log(c);
            info_detail_log = c$omron_fins_detail_log;

            # Set the data
            info_detail_log$omron_fins_link_id = link_id;
            info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$dataLinkTableWriteCommand$response$responseCode];

            # Fire the event and tidy up
            OMRON_FINS::emit_omron_fins_detail_log(c);
            delete c$omron_fins_detail_log;
        }
    }
