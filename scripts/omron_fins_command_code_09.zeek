module OMRON_FINS;
    function process_message_read_command_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        # Message type
        info_detail_log$command = OMRON_FINS_ENUMS::MESSAGE_NO_PARAMETER[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageType];

        # Message bits set
        info_detail_log$message_no_0 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageNoBit_or_falFalsBit_0];
        info_detail_log$message_no_1 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageNoBit_or_falFalsBit_1];
        info_detail_log$message_no_2 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageNoBit_or_falFalsBit_2];
        info_detail_log$message_no_3 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageNoBit_or_falFalsBit_3];
        info_detail_log$message_no_4 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageNoBit_or_falFalsBit_4];
        info_detail_log$message_no_5 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageNoBit_or_falFalsBit_5];
        info_detail_log$message_no_6 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageNoBit_or_falFalsBit_6];
        info_detail_log$message_no_7 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageNoBit_or_falFalsBit_7];

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_message_clear_command_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        # Message type
        info_detail_log$command = OMRON_FINS_ENUMS::MESSAGE_NO_PARAMETER[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageType];

        # Message bits set
        info_detail_log$message_no_0 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageNoBit_or_falFalsBit_0];
        info_detail_log$message_no_1 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageNoBit_or_falFalsBit_1];
        info_detail_log$message_no_2 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageNoBit_or_falFalsBit_2];
        info_detail_log$message_no_3 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageNoBit_or_falFalsBit_3];
        info_detail_log$message_no_4 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageNoBit_or_falFalsBit_4];
        info_detail_log$message_no_5 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageNoBit_or_falFalsBit_5];
        info_detail_log$message_no_6 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageNoBit_or_falFalsBit_6];
        info_detail_log$message_no_7 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageNoBit_or_falFalsBit_7];

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_fal_fals_read_command_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        # Message type
        info_detail_log$command = OMRON_FINS_ENUMS::MESSAGE_NO_PARAMETER[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageType];

        # Message bits set
        info_detail_log$fal_fals_no_0  = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageNoBit_or_falFalsBit_0];
        info_detail_log$fal_fals_no_1  = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageNoBit_or_falFalsBit_1];
        info_detail_log$fal_fals_no_2  = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageNoBit_or_falFalsBit_2];
        info_detail_log$fal_fals_no_3  = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageNoBit_or_falFalsBit_3];
        info_detail_log$fal_fals_no_4  = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageNoBit_or_falFalsBit_4];
        info_detail_log$fal_fals_no_5  = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageNoBit_or_falFalsBit_5];
        info_detail_log$fal_fals_no_6  = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageNoBit_or_falFalsBit_6];
        info_detail_log$fal_fals_no_7  = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageNoBit_or_falFalsBit_7];
        info_detail_log$fal_fals_no_8  = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$reservedBit_or_falFalsBit_8];
        info_detail_log$fal_fals_no_9  = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$reservedBit_or_falFalsBit_9];
        info_detail_log$fal_fals_no_10 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$reservedBit_or_falFalsBit_10];
        info_detail_log$fal_fals_no_11 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$reservedBit_or_falFalsBit_11];
        info_detail_log$fal_fals_no_12 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$reservedBit_or_falFalsBit_12];
        info_detail_log$fal_fals_no_13 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$reservedBit_or_falFalsBit_13];

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_message_read_response_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        # Response code
        info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$messageReadMessageClearFalFalsReadCommand$response$responseCode];

        # Message type
        info_detail_log$command = OMRON_FINS_ENUMS::MESSAGE_NO_PARAMETER[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageType];

        # Message bit set
        info_detail_log$message_no_0 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$message_read_response$messageNoBit_0];
        info_detail_log$message_no_1 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$message_read_response$messageNoBit_1];
        info_detail_log$message_no_2 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$message_read_response$messageNoBit_2];
        info_detail_log$message_no_3 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$message_read_response$messageNoBit_3];
        info_detail_log$message_no_4 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$message_read_response$messageNoBit_4];
        info_detail_log$message_no_5 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$message_read_response$messageNoBit_5];
        info_detail_log$message_no_6 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$message_read_response$messageNoBit_6];
        info_detail_log$message_no_7 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$message_read_response$messageNoBit_7];

        # Messages
        info_detail_log$message_0    = finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$message_read_response$messageNo_0;
        info_detail_log$message_1    = finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$message_read_response$messageNo_1;
        info_detail_log$message_2    = finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$message_read_response$messageNo_2;
        info_detail_log$message_3    = finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$message_read_response$messageNo_3;
        info_detail_log$message_4    = finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$message_read_response$messageNo_4;
        info_detail_log$message_5    = finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$message_read_response$messageNo_5;
        info_detail_log$message_6    = finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$message_read_response$messageNo_6;
        info_detail_log$message_7    = finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$message_read_response$messageNo_7;

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_message_clear_response_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        # Response code
        info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$messageReadMessageClearFalFalsReadCommand$response$responseCode];

        # Message type
        info_detail_log$command = OMRON_FINS_ENUMS::MESSAGE_NO_PARAMETER[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageType];

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_fal_fals_read_response_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        # Response code
        info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$messageReadMessageClearFalFalsReadCommand$response$responseCode];

        # Message type
        info_detail_log$command = OMRON_FINS_ENUMS::MESSAGE_NO_PARAMETER[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageType];

        # Message bit set
        info_detail_log$fal_fals_no_0  = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNoBit_0];
        info_detail_log$fal_fals_no_1  = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNoBit_1];
        info_detail_log$fal_fals_no_2  = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNoBit_2];
        info_detail_log$fal_fals_no_3  = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNoBit_3];
        info_detail_log$fal_fals_no_4  = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNoBit_4];
        info_detail_log$fal_fals_no_5  = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNoBit_5];
        info_detail_log$fal_fals_no_6  = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNoBit_6];
        info_detail_log$fal_fals_no_7  = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNoBit_7];
        info_detail_log$fal_fals_no_8  = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNoBit_8];
        info_detail_log$fal_fals_no_9  = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNoBit_9];
        info_detail_log$fal_fals_no_10 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNoBit_10];
        info_detail_log$fal_fals_no_11 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNoBit_11];
        info_detail_log$fal_fals_no_12 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNoBit_12];
        info_detail_log$fal_fals_no_13 = OMRON_FINS_ENUMS::ENABLED[finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNoBit_13];

        # Messages
        info_detail_log$fal_fals_0  = finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNo_0;
        info_detail_log$fal_fals_1  = finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNo_1;
        info_detail_log$fal_fals_2  = finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNo_2;
        info_detail_log$fal_fals_3  = finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNo_3;
        info_detail_log$fal_fals_4  = finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNo_4;
        info_detail_log$fal_fals_5  = finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNo_5;
        info_detail_log$fal_fals_6  = finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNo_6;
        info_detail_log$fal_fals_7  = finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNo_7;
        info_detail_log$fal_fals_8  = finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNo_8;
        info_detail_log$fal_fals_9  = finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNo_9;
        info_detail_log$fal_fals_10 = finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNo_10;
        info_detail_log$fal_fals_11 = finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNo_11;
        info_detail_log$fal_fals_12 = finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNo_12;
        info_detail_log$fal_fals_13 = finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageRead_FalFalsRead$fal_fals_read_response$falFalsNo_13;

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_message_read_message_clear_fal_fals_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            switch (finsCommand$messageReadMessageClearFalFalsReadCommand$command$messageNoParameter$messageType) {
                case OMRON_FINS_ENUMS::MessageNoParameter_MESSAGE_READ:
                    process_message_read_command_detail(c, finsCommand, link_id);
                    break;
                case OMRON_FINS_ENUMS::MessageNoParameter_MESSAGE_CLEAR:
                    process_message_clear_command_detail(c, finsCommand, link_id);
                    break;
                case OMRON_FINS_ENUMS::MessageNoParameter_FAL_FALS_READ:
                    process_fal_fals_read_command_detail(c, finsCommand, link_id);
                    break;
            }

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            switch (finsCommand$messageReadMessageClearFalFalsReadCommand$response$messageType) {
                case OMRON_FINS_ENUMS::MessageNoParameter_MESSAGE_READ:
                    process_message_read_response_detail(c, finsCommand, link_id);
                    break;
                case OMRON_FINS_ENUMS::MessageNoParameter_MESSAGE_CLEAR:
                    process_message_clear_response_detail(c, finsCommand, link_id);
                    break;
                case OMRON_FINS_ENUMS::MessageNoParameter_FAL_FALS_READ:
                    process_fal_fals_read_response_detail(c, finsCommand, link_id);
                    break;
            }
        }
    }
