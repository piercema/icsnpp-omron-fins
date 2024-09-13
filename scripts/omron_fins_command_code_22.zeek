module OMRON_FINS;

    function process_file_name_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {

        local info_file_log : detail_file_log;

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            c = set_session_file_log(c);

            info_file_log = c$omron_fins_file_log;
            info_file_log$omron_fins_link_id = link_id;
            info_file_log = process_command_and_datatype_file(info_file_log, finsCommand);

            info_file_log$disk_no = finsCommand$fileNameReadCommand$command$diskNo;
            info_file_log$beginning_file_position = finsCommand$fileNameReadCommand$command$beginningFilePosition;
            info_file_log$no_of_files = finsCommand$fileNameReadCommand$command$noOfFiles;

            # Fire the event and tidy up
            OMRON_FINS::emit_omron_fins_file_log(c);
            delete c$omron_fins_file_log;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            c = set_session_file_log(c);

            info_file_log = c$omron_fins_file_log;
            info_file_log$omron_fins_link_id = link_id;
            info_file_log = process_command_and_datatype_file(info_file_log, finsCommand);

            info_file_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$fileNameReadCommand$response$responseCode];
            info_file_log$volume_label = finsCommand$fileNameReadCommand$response$diskData$volumeLabel;
            info_file_log$year = finsCommand$fileNameReadCommand$response$diskData$dateTime$dateTime$year + 1980;
            info_file_log$month = finsCommand$fileNameReadCommand$response$diskData$dateTime$dateTime$month;
            info_file_log$day = finsCommand$fileNameReadCommand$response$diskData$dateTime$dateTime$day;
            info_file_log$hour = finsCommand$fileNameReadCommand$response$diskData$dateTime$dateTime$hour;
            info_file_log$minute = finsCommand$fileNameReadCommand$response$diskData$dateTime$dateTime$minute;
            info_file_log$second = finsCommand$fileNameReadCommand$response$diskData$dateTime$dateTime$second * 2;
            info_file_log$total_capacity = finsCommand$fileNameReadCommand$response$diskData$totalCapacity;
            info_file_log$unused_capacity = finsCommand$fileNameReadCommand$response$diskData$unusedCapacity;
            info_file_log$total_no_files = finsCommand$fileNameReadCommand$response$diskData$totalNoFiles;
            info_file_log$no_files_read = finsCommand$fileNameReadCommand$response$noOfFiles$filesRead;

            # Fire the event and tidy up
            OMRON_FINS::emit_omron_fins_file_log(c);
            delete c$omron_fins_file_log;

            # Loop over the file data
            for (i in finsCommand$fileNameReadCommand$response$fileData) {
                # Setup detail file log
                c = set_session_file_log(c);

                info_file_log = c$omron_fins_file_log;
                info_file_log$omron_fins_link_id = link_id;
                info_file_log = process_command_and_datatype_file(info_file_log, finsCommand);

                info_file_log$file_name = finsCommand$fileNameReadCommand$response$fileData[i]$fileName;
                info_file_log$year = finsCommand$fileNameReadCommand$response$fileData[i]$dateTime$dateTime$year + 1980;
                info_file_log$month = finsCommand$fileNameReadCommand$response$fileData[i]$dateTime$dateTime$month;
                info_file_log$day = finsCommand$fileNameReadCommand$response$fileData[i]$dateTime$dateTime$day;
                info_file_log$hour = finsCommand$fileNameReadCommand$response$fileData[i]$dateTime$dateTime$hour;
                info_file_log$minute = finsCommand$fileNameReadCommand$response$fileData[i]$dateTime$dateTime$minute;
                info_file_log$second = finsCommand$fileNameReadCommand$response$fileData[i]$dateTime$dateTime$second * 2;
                info_file_log$file_capacity = finsCommand$fileNameReadCommand$response$fileData[i]$fileCapacity;

                # Fire the event and tidy up
                OMRON_FINS::emit_omron_fins_file_log(c);
                delete c$omron_fins_file_log;
            }
        }
    }

    function process_single_file_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_file_log(c);

        local info_file_log = c$omron_fins_file_log;
        info_file_log$omron_fins_link_id = link_id;
        info_file_log = process_command_and_datatype_file(info_file_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            print "process_single_file_read_detail -> COMMAND";

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_file_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$singleFileReadCommand$response$responseCode];
            print "process_single_file_read_detail -> RESPONSE";
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_file_log(c);
        delete c$omron_fins_file_log;
    }

    function process_single_file_write_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_file_log(c);

        local info_file_log = c$omron_fins_file_log;
        info_file_log$omron_fins_link_id = link_id;
        info_file_log = process_command_and_datatype_file(info_file_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            print "process_single_file_write_detail -> COMMAND";

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_file_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$singleFileWriteCommand$response$responseCode];
            print "process_single_file_write_detail -> RESPONSE";
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_file_log(c);
        delete c$omron_fins_file_log;

    }

    function process_memory_card_format_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            print "process_memory_card_format_detail -> COMMAND";

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            #info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaReadCommand$response$responseCode];
            print "process_memory_card_format_detail -> RESPONSE";
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }
    
    function process_file_delete_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            print "process_file_delete_detail -> COMMAND";

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            #info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaReadCommand$response$responseCode];
            print "process_file_delete_detail -> RESPONSE";
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_volume_label_create_delete_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            print "process_volume_label_create_delete_detail -> COMMAND";

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            #info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaReadCommand$response$responseCode];
            print "process_volume_label_create_delete_detail -> RESPONSE";
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_file_copy_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            print "process_file_copy_detail -> COMMAND";

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            #info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaReadCommand$response$responseCode];
            print "process_file_copy_detail -> RESPONSE";
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_file_name_change_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            print "process_file_name_change_detail -> COMMAND";

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            #info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaReadCommand$response$responseCode];
            print "process_file_name_change_detail -> RESPONSE";
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_file_data_check_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            print "process_file_data_check_detail -> COMMAND";

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            #info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaReadCommand$response$responseCode];
            print "process_file_data_check_detail -> RESPONSE";
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_memory_area_file_transfer_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            print "process_memory_area_file_transfer_detail -> COMMAND";

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            #info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaReadCommand$response$responseCode];
            print "process_memory_area_file_transfer_detail -> RESPONSE";
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_parameter_area_file_transfer_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            print "process_parameter_area_file_transfer_detail -> COMMAND";

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            #info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaReadCommand$response$responseCode];
            print "process_parameter_area_file_transfer_detail -> RESPONSE";
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_program_area_file_transfer_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            print "process_program_area_file_transfer_detail -> COMMAND";

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            #info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaReadCommand$response$responseCode];
            print "process_program_area_file_transfer_detail -> RESPONSE";
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_file_memory_index_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            print "process_file_memory_index_read_detail -> COMMAND";

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            #info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaReadCommand$response$responseCode];
            print "process_file_memory_index_read_detail -> RESPONSE";
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_file_memory_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            print "process_file_memory_read_detail -> COMMAND";

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            #info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaReadCommand$response$responseCode];
            print "process_file_memory_read_detail -> RESPONSE";
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_file_memory_write_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            print "process_file_memory_write_detail -> COMMAND";

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            #info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaReadCommand$response$responseCode];
            print "process_file_memory_write_detail -> RESPONSE";
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }
