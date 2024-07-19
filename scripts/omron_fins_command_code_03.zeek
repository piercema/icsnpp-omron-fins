module OMRON_FINS;

    function process_program_area_protect_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_detail_log$program_no     = finsCommand$programAreaProtect$command$programNo;
            info_detail_log$protect_code   = finsCommand$programAreaProtect$command$protectCode;
            info_detail_log$beginning_word = finsCommand$programAreaProtect$command$beginningWord;
            info_detail_log$last_word      = finsCommand$programAreaProtect$command$lastWord;
            info_detail_log$password       = finsCommand$programAreaProtect$command$password;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$programAreaProtect$response$responseCode];
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
            info_detail_log$program_no     = finsCommand$programAreaProtectClear$command$programNo;
            info_detail_log$protect_code   = finsCommand$programAreaProtectClear$command$protectCode;
            info_detail_log$beginning_word = finsCommand$programAreaProtectClear$command$beginningWord;
            info_detail_log$last_word      = finsCommand$programAreaProtectClear$command$lastWord;
            info_detail_log$password       = finsCommand$programAreaProtectClear$command$password;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$programAreaProtectClear$response$responseCode];

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
            info_detail_log$program_no      = finsCommand$programAreaRead$command$programNo;
            info_detail_log$beginning_word  = finsCommand$programAreaRead$command$beginningWord;
            info_detail_log$number_of_bytes = finsCommand$programAreaRead$command$numberOfBytesMask$numberOfBytes;
            info_detail_log$last_word_bit   = finsCommand$programAreaRead$command$numberOfBytesMask$lastWordBit;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code   = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$programAreaRead$response$responseCode];
            info_detail_log$program_no      = finsCommand$programAreaRead$response$programNo;
            info_detail_log$beginning_word  = finsCommand$programAreaRead$response$beginningWord;
            info_detail_log$number_of_bytes = finsCommand$programAreaRead$response$numberOfBytesMask$numberOfBytes;
            info_detail_log$last_word_bit   = finsCommand$programAreaRead$response$numberOfBytesMask$lastWordBit;
            info_detail_log$data            = finsCommand$programAreaRead$response$dataAsString;

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
            info_detail_log$program_no      = finsCommand$programAreaWrite$command$programNo;
            info_detail_log$beginning_word  = finsCommand$programAreaWrite$command$beginningWord;
            info_detail_log$number_of_bytes = finsCommand$programAreaWrite$command$numberOfBytesMask$numberOfBytes;
            info_detail_log$last_word_bit   = finsCommand$programAreaWrite$command$numberOfBytesMask$lastWordBit;
            info_detail_log$data            = finsCommand$programAreaWrite$command$dataAsString;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code   = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$programAreaWrite$response$responseCode];
            info_detail_log$program_no      = finsCommand$programAreaWrite$response$programNo;
            info_detail_log$beginning_word  = finsCommand$programAreaWrite$response$beginningWord;
            info_detail_log$number_of_bytes = finsCommand$programAreaWrite$response$numberOfBytesMask$numberOfBytes;
            info_detail_log$last_word_bit   = finsCommand$programAreaWrite$response$numberOfBytesMask$lastWordBit;

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
            info_detail_log$program_no     = finsCommand$programAreaClear$command$programNo;
            info_detail_log$clear_code     = finsCommand$programAreaClear$command$clearCode;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$programAreaClear$response$responseCode];

        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }
