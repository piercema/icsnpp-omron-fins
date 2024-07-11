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

#    function process_parameter_area_clear_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
#        c = set_session_detail_log(c);
#
#        local info_detail_log = c$omron_fins_detail_log;
#        info_detail_log$omron_fins_link_id = link_id;
#        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);
#
#        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
#
#        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
#            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaFill$response$responseCode];
#        }
#
#        # Fire the event and tidy up
#        OMRON_FINS::emit_omron_fins_detail_log(c);
#        delete c$omron_fins_detail_log;
#    }

#    function process_data_link_table_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
#        c = set_session_detail_log(c);
#
#        local info_detail_log = c$omron_fins_detail_log;
#        info_detail_log$omron_fins_link_id = link_id;
#        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);
#
#        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
#
#        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
#            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaFill$response$responseCode];
#        }
#
#        # Fire the event and tidy up
#        OMRON_FINS::emit_omron_fins_detail_log(c);
#        delete c$omron_fins_detail_log;
#    }

#    function process_data_link_table_write_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
#        c = set_session_detail_log(c);
#
#        local info_detail_log = c$omron_fins_detail_log;
#        info_detail_log$omron_fins_link_id = link_id;
#        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);
#
#        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
#
#        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
#            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaFill$response$responseCode];
#        }
#
#        # Fire the event and tidy up
#        OMRON_FINS::emit_omron_fins_detail_log(c);
#        delete c$omron_fins_detail_log;
#    }

