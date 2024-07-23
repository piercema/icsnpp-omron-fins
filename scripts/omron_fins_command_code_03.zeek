module OMRON_FINS;

    function process_program_area_protect_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_detail_log$program_no     = finsCommand$programAreaProtectCommand$command$programNo;
            info_detail_log$protect_code   = finsCommand$programAreaProtectCommand$command$protectCode;
            info_detail_log$beginning_word = finsCommand$programAreaProtectCommand$command$beginningWord;
            info_detail_log$last_word      = finsCommand$programAreaProtectCommand$command$lastWord;
            info_detail_log$password       = finsCommand$programAreaProtectCommand$command$password;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$programAreaProtectCommand$response$responseCode];
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_program_area_protect_clear_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_detail_log$program_no     = finsCommand$programAreaProtectClearCommand$command$programNo;
            info_detail_log$protect_code   = finsCommand$programAreaProtectClearCommand$command$protectCode;
            info_detail_log$beginning_word = finsCommand$programAreaProtectClearCommand$command$beginningWord;
            info_detail_log$last_word      = finsCommand$programAreaProtectClearCommand$command$lastWord;
            info_detail_log$password       = finsCommand$programAreaProtectClearCommand$command$password;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$programAreaProtectClearCommand$response$responseCode];

        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_program_area_read_detail(c : connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_detail_log$program_no      = finsCommand$programAreaReadCommand$command$programNo;
            info_detail_log$beginning_word  = finsCommand$programAreaReadCommand$command$beginningWord;
            info_detail_log$number_of_bytes = finsCommand$programAreaReadCommand$command$numberOfBytesMask$numberOfBytes;
            info_detail_log$last_word_bit   = finsCommand$programAreaReadCommand$command$numberOfBytesMask$lastWordBit;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code   = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$programAreaReadCommand$response$responseCode];
            info_detail_log$program_no      = finsCommand$programAreaReadCommand$response$programNo;
            info_detail_log$beginning_word  = finsCommand$programAreaReadCommand$response$beginningWord;
            info_detail_log$number_of_bytes = finsCommand$programAreaReadCommand$response$numberOfBytesMask$numberOfBytes;
            info_detail_log$last_word_bit   = finsCommand$programAreaReadCommand$response$numberOfBytesMask$lastWordBit;
            info_detail_log$data            = finsCommand$programAreaReadCommand$response$dataAsString;

        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_program_area_write_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_detail_log$program_no      = finsCommand$programAreaWriteCommand$command$programNo;
            info_detail_log$beginning_word  = finsCommand$programAreaWriteCommand$command$beginningWord;
            info_detail_log$number_of_bytes = finsCommand$programAreaWriteCommand$command$numberOfBytesMask$numberOfBytes;
            info_detail_log$last_word_bit   = finsCommand$programAreaWriteCommand$command$numberOfBytesMask$lastWordBit;
            info_detail_log$data            = finsCommand$programAreaWriteCommand$command$dataAsString;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code   = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$programAreaWriteCommand$response$responseCode];
            info_detail_log$program_no      = finsCommand$programAreaWriteCommand$response$programNo;
            info_detail_log$beginning_word  = finsCommand$programAreaWriteCommand$response$beginningWord;
            info_detail_log$number_of_bytes = finsCommand$programAreaWriteCommand$response$numberOfBytesMask$numberOfBytes;
            info_detail_log$last_word_bit   = finsCommand$programAreaWriteCommand$response$numberOfBytesMask$lastWordBit;

        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_program_area_clear_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_detail_log$program_no     = finsCommand$programAreaClearCommand$command$programNo;
            info_detail_log$clear_code     = finsCommand$programAreaClearCommand$command$clearCode;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$programAreaClearCommand$response$responseCode];

        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }
