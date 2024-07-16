module OMRON_FINS;

    function process_parameter_area_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_detail_log$parameter_area_code = OMRON_FINS_ENUMS::PARAMETER_AREA_CODE[finsCommand$parameterAreaRead$command$parameterAreaCode];
            info_detail_log$beginning_word      = finsCommand$parameterAreaRead$command$beginningWord;
            info_detail_log$number_of_words     = finsCommand$parameterAreaRead$command$numberOfWords$wordsToRead;
            info_detail_log$last_word           = finsCommand$parameterAreaRead$command$numberOfWords$lastWord;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code       = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$parameterAreaRead$response$responseCode];
            info_detail_log$parameter_area_code = OMRON_FINS_ENUMS::PARAMETER_AREA_CODE[finsCommand$parameterAreaRead$response$parameterAreaCode];
            info_detail_log$beginning_word      = finsCommand$parameterAreaRead$response$beginningWord;
            info_detail_log$number_of_words     = finsCommand$parameterAreaRead$response$numberOfWords$wordsToRead;
            info_detail_log$last_word           = finsCommand$parameterAreaRead$response$numberOfWords$lastWord;
            info_detail_log$data                = finsCommand$parameterAreaRead$response$dataAsString;
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
            info_detail_log$parameter_area_code = OMRON_FINS_ENUMS::PARAMETER_AREA_CODE[finsCommand$parameterAreaWrite$command$parameterAreaCode];
            info_detail_log$beginning_word      = finsCommand$parameterAreaWrite$command$beginningWord;
            info_detail_log$number_of_words     = finsCommand$parameterAreaWrite$command$numberOfWords$wordsToRead;
            info_detail_log$last_word           = finsCommand$parameterAreaWrite$command$numberOfWords$lastWord;
            info_detail_log$data                = finsCommand$parameterAreaWrite$command$dataAsString;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$parameterAreaWrite$response$responseCode];
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
            info_detail_log$parameter_area_code = OMRON_FINS_ENUMS::PARAMETER_AREA_CODE[finsCommand$parameterAreaClear$command$parameterAreaCode];
            info_detail_log$beginning_word      = finsCommand$parameterAreaClear$command$beginningWord;
            info_detail_log$number_of_words     = finsCommand$parameterAreaClear$command$numberOfWords;
            info_detail_log$data                = finsCommand$parameterAreaClear$command$data;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$parameterAreaClear$response$responseCode];
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_data_link_table_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log: detail_log;

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            # Set/add the detail_log to the connection
            c = set_session_detail_log(c);
            info_detail_log = c$omron_fins_detail_log;

            # Set the data
            info_detail_log$omron_fins_link_id = link_id;
            info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);
            info_detail_log$fixed = finsCommand$dataLinkTableRead$command$fixed;
            info_detail_log$intelligent_id_no = finsCommand$dataLinkTableRead$command$intelligentIdNo;
            info_detail_log$first_word = finsCommand$dataLinkTableRead$command$firstWord;
            info_detail_log$read_length = finsCommand$dataLinkTableRead$command$readLength;

            # Fire the event and tidy up
            OMRON_FINS::emit_omron_fins_detail_log(c);
            delete c$omron_fins_detail_log;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {

            for (i in finsCommand$dataLinkTableRead$response$blockRecord) {
                # Set/add the detail_log to the connection
                c = set_session_detail_log(c);
                info_detail_log = c$omron_fins_detail_log;

                # Set the data
                info_detail_log$omron_fins_link_id = link_id;
                info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);
                info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$dataLinkTableRead$response$responseCode];

                info_detail_log$num_of_link_nodes = finsCommand$dataLinkTableRead$response$numOfLinkNodesMask$numOfLinkNodes;

                info_detail_log$block_record_data_link_status = OMRON_FINS_ENUMS::DATA_LINK_STATUS[finsCommand$dataLinkTableRead$response$blockRecord[i]$nodeNum$dataLinkStatus];
                info_detail_log$block_record_num_of_link_nodes = finsCommand$dataLinkTableRead$response$blockRecord[i]$nodeNum$numOfLinkNodes;
                info_detail_log$block_record_cio_area_first_word= finsCommand$dataLinkTableRead$response$blockRecord[i]$cioAreaFirstWord;
                info_detail_log$block_record_kind_of_dm= finsCommand$dataLinkTableRead$response$blockRecord[i]$kindOfDM;
                info_detail_log$block_record_dm_area_first_word= finsCommand$dataLinkTableRead$response$blockRecord[i]$dmAreaFirstWord;
                info_detail_log$block_record_num_of_total_words= finsCommand$dataLinkTableRead$response$blockRecord[i]$numOfTotalWords;

                # Fire the event and tidy up
                OMRON_FINS::emit_omron_fins_detail_log(c);
                delete c$omron_fins_detail_log;
            }





        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }
