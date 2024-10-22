module OMRON_FINS;

    function process_file_name_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string): string {
        # Local string to hold the response code for general logging
        local general_log_response_code : string;
        general_log_response_code = "";

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

            # Set the general logging response code
            general_log_response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$fileNameReadCommand$response$responseCode];

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

                info_file_log$file_name = finsCommand$fileNameReadCommand$response$fileData[i]$fileName$fileName;
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

        # Return the response code for general logging
        return general_log_response_code;
    }

    function process_single_file_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string): string {
        # Local string to hold the response code for general logging
        local general_log_response_code : string;
        general_log_response_code = "";

        c = set_session_file_log(c);
        local info_file_log = c$omron_fins_file_log;

        info_file_log$omron_fins_link_id = link_id;
        info_file_log = process_command_and_datatype_file(info_file_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_file_log$disk_no = finsCommand$singleFileReadCommand$command$diskNo;
            info_file_log$file_name = finsCommand$singleFileReadCommand$command$fileName$fileName;
            info_file_log$file_position = finsCommand$singleFileReadCommand$command$filePosition;
            info_file_log$data_length = finsCommand$singleFileReadCommand$command$dataLength;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_file_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$singleFileReadCommand$response$responseCode];
            info_file_log$file_capacity = finsCommand$singleFileReadCommand$response$fileCapacity;
            info_file_log$file_position = finsCommand$singleFileReadCommand$response$filePosition;
            info_file_log$data_length = finsCommand$singleFileReadCommand$response$dataLength;
            info_file_log$fuid = finsCommand$singleFileReadCommand$response$fuid;

            # Set the general logging response code
            general_log_response_code = info_file_log$response_code;
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_file_log(c);
        delete c$omron_fins_file_log;

        # Return the response code for general logging
        return general_log_response_code;
    }

    function process_single_file_write_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string): string {
        # Local string to hold the response code for general logging
        local general_log_response_code : string;
        general_log_response_code = "";

        c = set_session_file_log(c);
        local info_file_log = c$omron_fins_file_log;

        info_file_log$omron_fins_link_id = link_id;
        info_file_log = process_command_and_datatype_file(info_file_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_file_log$disk_no = finsCommand$singleFileWriteCommand$command$diskNo;
            info_file_log$parameter_code = OMRON_FINS_ENUMS::FILE_PARAMETER_CODE[finsCommand$singleFileWriteCommand$command$parameterCode];
            info_file_log$file_name = finsCommand$singleFileWriteCommand$command$fileName$fileName;
            info_file_log$file_position = finsCommand$singleFileWriteCommand$command$filePosition;
            info_file_log$data_length = finsCommand$singleFileWriteCommand$command$dataLength;
            info_file_log$fuid = finsCommand$singleFileWriteCommand$command$fuid;

            # Fire the event and tidy up
            OMRON_FINS::emit_omron_fins_file_log(c);
            delete c$omron_fins_file_log;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            #
            # Since there is only a response for this command, we capture the response_code in the general log file and 
            # not in the info_detail_log file.
            #

            # Set the general logging response code
            general_log_response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$singleFileWriteCommand$response$responseCode];
        }

        # Return the response code for general logging
        return general_log_response_code;
    }

    function process_memory_card_format_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string): string {
        # Local string to hold the response code for general logging
        local general_log_response_code : string;
        general_log_response_code = "";

        c = set_session_file_log(c);
        local info_file_log = c$omron_fins_file_log;

        info_file_log$omron_fins_link_id = link_id;
        info_file_log = process_command_and_datatype_file(info_file_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_file_log$disk_no = finsCommand$memoryCardFormatCommand$command$diskNo;

            # Fire the event and tidy up
            OMRON_FINS::emit_omron_fins_file_log(c);
            delete c$omron_fins_file_log;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            #
            # Since there is only a response for this command, we capture the response_code in the general log file and 
            # not in the info_detail_log file.
            #

            # Set the general logging response code
            general_log_response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryCardFormatCommand$response$responseCode];
        }

        # Return the response code for general logging
        return general_log_response_code;
    }
    
    function process_file_delete_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string): string {
        # Local string to hold the response code for general logging
        local general_log_response_code : string;
        general_log_response_code = "";

        local info_file_log : detail_file_log;

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            # Loop over the filenames generating a log record for each one
            for (i in finsCommand$fileDeleteCommand$command$fileNames) {
                c = set_session_file_log(c);
                info_file_log = c$omron_fins_file_log;
                info_file_log$omron_fins_link_id = link_id;
                info_file_log = process_command_and_datatype_file(info_file_log, finsCommand);

                info_file_log$disk_no     = finsCommand$fileDeleteCommand$command$diskNo;
                info_file_log$no_of_files = finsCommand$fileDeleteCommand$command$noOfFiles;
                info_file_log$file_name   = finsCommand$fileDeleteCommand$command$fileNames[i]$fileName;

                # Fire the event and tidy up
                OMRON_FINS::emit_omron_fins_file_log(c);
                delete c$omron_fins_file_log;
            }

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            c = set_session_file_log(c);
            info_file_log = c$omron_fins_file_log;
            info_file_log$omron_fins_link_id = link_id;
            info_file_log = process_command_and_datatype_file(info_file_log, finsCommand);

            info_file_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$fileDeleteCommand$response$responseCode];
            info_file_log$no_of_files   = finsCommand$fileDeleteCommand$response$noOfFiles;

            # Set the general logging response code
            general_log_response_code = info_file_log$response_code;

            # Fire the event and tidy up
            OMRON_FINS::emit_omron_fins_file_log(c);
            delete c$omron_fins_file_log;
        }

        # Return the response code for general logging
        return general_log_response_code;
    }

    function process_volume_label_create_delete_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string): string {
        # Local string to hold the response code for general logging
        local general_log_response_code : string;
        general_log_response_code = "";

        c = set_session_file_log(c);
        local info_file_log = c$omron_fins_file_log;

        info_file_log$omron_fins_link_id = link_id;
        info_file_log = process_command_and_datatype_file(info_file_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_file_log$disk_no = finsCommand$volumeLabelCreateDeleteCommand$command$diskNo;
            info_file_log$parameter_code = OMRON_FINS_ENUMS::VOLUME_PARAMETER_CODE[finsCommand$volumeLabelCreateDeleteCommand$command$parameterCode];
            info_file_log$volume_label = finsCommand$volumeLabelCreateDeleteCommand$command$volumeLabel;

            # Fire the event and tidy up
            OMRON_FINS::emit_omron_fins_file_log(c);
            delete c$omron_fins_file_log;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            #
            # Since there is only a response for this command, we capture the response_code in the general log file and 
            # not in the info_detail_log file.
            #
            
            # Set the general logging response code
            general_log_response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$volumeLabelCreateDeleteCommand$response$responseCode];
        }

        # Return the response code for general logging
        return general_log_response_code;
    }

    function process_file_copy_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string): string {
        # Local string to hold the response code for general logging
        local general_log_response_code : string;
        general_log_response_code = "";

        c = set_session_file_log(c);
        local info_file_log = c$omron_fins_file_log;

        info_file_log$omron_fins_link_id = link_id;
        info_file_log = process_command_and_datatype_file(info_file_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_file_log$src_disk_no = finsCommand$fileCopyCommand$command$srcDiskNo;
            info_file_log$src_file_name = finsCommand$fileCopyCommand$command$srcFileName$fileName;
            info_file_log$dst_disk_no = finsCommand$fileCopyCommand$command$dstDiskNo;
            info_file_log$dst_file_name = finsCommand$fileCopyCommand$command$dstFileName$fileName;

            # Fire the event and tidy up
            OMRON_FINS::emit_omron_fins_file_log(c);
            delete c$omron_fins_file_log;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            #
            # Since there is only a response for this command, we capture the response_code in the general log file and 
            # not in the info_detail_log file.
            #
            
            # Set the general logging response code
            general_log_response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$fileCopyCommand$response$responseCode];
        }
 
        # Return the response code for general logging
        return general_log_response_code;
   }

    function process_file_name_change_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string): string {
        # Local string to hold the response code for general logging
        local general_log_response_code : string;
        general_log_response_code = "";

        c = set_session_file_log(c);
        local info_file_log = c$omron_fins_file_log;

        info_file_log$omron_fins_link_id = link_id;
        info_file_log = process_command_and_datatype_file(info_file_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_file_log$disk_no = finsCommand$fileNameChangeCommand$command$diskNo;
            info_file_log$old_file_name = finsCommand$fileNameChangeCommand$command$oldFileName$fileName;
            info_file_log$new_file_name = finsCommand$fileNameChangeCommand$command$newFileName$fileName;

            # Fire the event and tidy up
            OMRON_FINS::emit_omron_fins_file_log(c);
            delete c$omron_fins_file_log;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            #
            # Since there is only a response for this command, we capture the response_code in the general log file and 
            # not in the info_detail_log file.
            #
            
            # Set the general logging response code
            general_log_response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$fileNameChangeCommand$response$responseCode];
        }
  
        # Return the response code for general logging
        return general_log_response_code;
   }

    function process_file_data_check_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string): string {
        # Local string to hold the response code for general logging
        local general_log_response_code : string;
        general_log_response_code = "";

        c = set_session_file_log(c);
        local info_file_log = c$omron_fins_file_log;

        info_file_log$omron_fins_link_id = link_id;
        info_file_log = process_command_and_datatype_file(info_file_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_file_log$disk_no = finsCommand$fileDataCheckCommand$command$diskNo;
            info_file_log$file_name = finsCommand$fileDataCheckCommand$command$fileName$fileName;

            # Fire the event and tidy up
            OMRON_FINS::emit_omron_fins_file_log(c);
            delete c$omron_fins_file_log;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            #
            # Since there is only a response for this command, we capture the response_code in the general log file and 
            # not in the info_detail_log file.
            #
             
            # Set the general logging response code
            general_log_response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$fileDataCheckCommand$response$responseCode];
       }
  
        # Return the response code for general logging
        return general_log_response_code;
    }

    function process_memory_area_file_transfer_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string): string {
        # Local string to hold the response code for general logging
        local general_log_response_code : string;
        general_log_response_code = "";

        c = set_session_file_log(c);
        local info_file_log = c$omron_fins_file_log;

        info_file_log$omron_fins_link_id = link_id;
        info_file_log = process_command_and_datatype_file(info_file_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_file_log$parameter_code = OMRON_FINS_ENUMS::FILE_TRANSFER_PARAMETER_CODE[finsCommand$memoryAreaFileTransferCommand$command$parameterCode];
            info_file_log$memory_area_code = OMRON_FINS_ENUMS::MEMORY_AREA[finsCommand$memoryAreaFileTransferCommand$command$memoryAreaCode];
            info_file_log$beginning_address = finsCommand$memoryAreaFileTransferCommand$command$beginningAddress;
            info_file_log$no_of_items = finsCommand$memoryAreaFileTransferCommand$command$noOfItems;
            info_file_log$disk_no = finsCommand$memoryAreaFileTransferCommand$command$diskNo;
            info_file_log$file_name = finsCommand$memoryAreaFileTransferCommand$command$fileName$fileName;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_file_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$memoryAreaFileTransferCommand$response$responseCode];
            info_file_log$no_of_items = finsCommand$memoryAreaFileTransferCommand$response$noOfItems;
             
            # Set the general logging response code
            general_log_response_code = info_file_log$response_code;
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_file_log(c);
        delete c$omron_fins_file_log;
  
        # Return the response code for general logging
        return general_log_response_code;
    }

    function process_parameter_area_file_transfer_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string): string {
        # Local string to hold the response code for general logging
        local general_log_response_code : string;
        general_log_response_code = "";

         c = set_session_file_log(c);
        local info_file_log = c$omron_fins_file_log;

        info_file_log$omron_fins_link_id = link_id;
        info_file_log = process_command_and_datatype_file(info_file_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_file_log$parameter_code = OMRON_FINS_ENUMS::FILE_TRANSFER_PARAMETER_CODE[finsCommand$parameterAreaFileTransferCommand$command$parameterCode];
            info_file_log$parameter_area_code = OMRON_FINS_ENUMS::PARAMETER_AREA_CODE[finsCommand$parameterAreaFileTransferCommand$command$parameterAreaCode];
            info_file_log$beginning_address = finsCommand$parameterAreaFileTransferCommand$command$beginningAddress;
            info_file_log$no_of_words = finsCommand$parameterAreaFileTransferCommand$command$noOfWords;
            info_file_log$disk_no = finsCommand$parameterAreaFileTransferCommand$command$diskNo;
            info_file_log$file_name = finsCommand$parameterAreaFileTransferCommand$command$fileName$fileName;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_file_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$parameterAreaFileTransferCommand$response$responseCode];
            info_file_log$no_of_words = finsCommand$parameterAreaFileTransferCommand$response$noOfWords;
             
            # Set the general logging response code
            general_log_response_code = info_file_log$response_code;
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_file_log(c);
        delete c$omron_fins_file_log;
  
        # Return the response code for general logging
        return general_log_response_code;
    }

    function process_program_area_file_transfer_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string): string {
        # Local string to hold the response code for general logging
        local general_log_response_code : string;
        general_log_response_code = "";

        c = set_session_file_log(c);
        local info_file_log = c$omron_fins_file_log;

        info_file_log$omron_fins_link_id = link_id;
        info_file_log = process_command_and_datatype_file(info_file_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_file_log$parameter_code = OMRON_FINS_ENUMS::FILE_TRANSFER_PARAMETER_CODE[finsCommand$programAreaFileTransferCommand$command$parameterCode];
            info_file_log$program_no = finsCommand$programAreaFileTransferCommand$command$programNo;
            info_file_log$beginning_address = finsCommand$programAreaFileTransferCommand$command$beginningWord;
            info_file_log$no_of_bytes = finsCommand$programAreaFileTransferCommand$command$noOfBytes;
            info_file_log$disk_no = finsCommand$programAreaFileTransferCommand$command$diskNo;
            info_file_log$file_name = finsCommand$programAreaFileTransferCommand$command$fileName$fileName;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_file_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$programAreaFileTransferCommand$response$responseCode];
            info_file_log$data_length = finsCommand$programAreaFileTransferCommand$response$dataLength;
             
            # Set the general logging response code
            general_log_response_code = info_file_log$response_code;
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_file_log(c);
        delete c$omron_fins_file_log;
  
        # Return the response code for general logging
        return general_log_response_code;
    }

    function process_file_memory_index_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string): string {
        # Local string to hold the response code for general logging
        local general_log_response_code : string;
        general_log_response_code = "";

        local info_file_log : detail_file_log;
        c = set_session_file_log(c);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            # Setup detail file log
            c = set_session_file_log(c);

            info_file_log = c$omron_fins_file_log;
            info_file_log$omron_fins_link_id = link_id;
            info_file_log = process_command_and_datatype_file(info_file_log, finsCommand);

            info_file_log$beginning_block_no = finsCommand$fileMemoryIndexReadCommand$command$beginningBlockNo;
            info_file_log$no_of_blocks = finsCommand$fileMemoryIndexReadCommand$command$noOfBlocks;

            # Fire the event and tidy up
            OMRON_FINS::emit_omron_fins_file_log(c);
            delete c$omron_fins_file_log;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            # Set the general logging response code
            general_log_response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$fileMemoryIndexReadCommand$response$responseCode];

            for (i in finsCommand$fileMemoryIndexReadCommand$response$dataTypeControlData) {
                # Setup detail file log
                c = set_session_file_log(c);

                info_file_log = c$omron_fins_file_log;
                info_file_log$omron_fins_link_id = link_id;
                info_file_log = process_command_and_datatype_file(info_file_log, finsCommand);

                info_file_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$fileMemoryIndexReadCommand$response$responseCode];
                info_file_log$remaining_blocks = finsCommand$fileMemoryIndexReadCommand$response$noOfBlocksRemaining;
                info_file_log$total_no_of_blocks = finsCommand$fileMemoryIndexReadCommand$response$totalNoOfBLocks;
                info_file_log$memory_type = OMRON_FINS_ENUMS::MEMORY_TYPE[finsCommand$fileMemoryIndexReadCommand$response$memoryType];
                info_file_log$data_type = OMRON_FINS_ENUMS::CONTROL_DATA_TYPE[finsCommand$fileMemoryIndexReadCommand$response$dataTypeControlData[i]$dataType$dataType];
                info_file_log$last_block = OMRON_FINS_ENUMS::ENABLED[finsCommand$fileMemoryIndexReadCommand$response$dataTypeControlData[i]$dataType$lastBlock];
                info_file_log$protected = OMRON_FINS_ENUMS::ENABLED[finsCommand$fileMemoryIndexReadCommand$response$dataTypeControlData[i]$dataType$protected];
                info_file_log$control_data = finsCommand$fileMemoryIndexReadCommand$response$dataTypeControlData[i]$controlData;

                # Fire the event and tidy up
                OMRON_FINS::emit_omron_fins_file_log(c);
                delete c$omron_fins_file_log;
            }
        }
  
        # Return the response code for general logging
        return general_log_response_code;
    }

    function process_file_memory_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string): string {
        # Local string to hold the response code for general logging
        local general_log_response_code : string;
        general_log_response_code = "";

        c = set_session_file_log(c);
        local info_file_log = c$omron_fins_file_log;

        info_file_log$omron_fins_link_id = link_id;
        info_file_log = process_command_and_datatype_file(info_file_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_file_log$block_no = finsCommand$fileMemoryReadCommand$command$blockNo;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_file_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$fileMemoryReadCommand$response$responseCode];
            info_file_log$data_type = OMRON_FINS_ENUMS::CONTROL_DATA_TYPE[finsCommand$fileMemoryReadCommand$response$dataTypeControlData$dataType$dataType];
            info_file_log$last_block = OMRON_FINS_ENUMS::ENABLED[finsCommand$fileMemoryReadCommand$response$dataTypeControlData$dataType$lastBlock];
            info_file_log$protected = OMRON_FINS_ENUMS::ENABLED[finsCommand$fileMemoryReadCommand$response$dataTypeControlData$dataType$protected];
            info_file_log$control_data = finsCommand$fileMemoryReadCommand$response$dataTypeControlData$controlData;
            info_file_log$memory_data = finsCommand$fileMemoryReadCommand$response$data;
             
            # Set the general logging response code
            general_log_response_code = info_file_log$response_code;
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_file_log(c);
        delete c$omron_fins_file_log;
  
        # Return the response code for general logging
        return general_log_response_code;
    }

    function process_file_memory_write_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string): string {
        # Local string to hold the response code for general logging
        local general_log_response_code : string;
        general_log_response_code = "";

        c = set_session_file_log(c);
        local info_file_log = c$omron_fins_file_log;

        info_file_log$omron_fins_link_id = link_id;
        info_file_log = process_command_and_datatype_file(info_file_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_file_log$data_type = OMRON_FINS_ENUMS::CONTROL_DATA_TYPE[finsCommand$fileMemoryWriteCommand$command$dataTypeControlData$dataType$dataType];
            info_file_log$last_block = OMRON_FINS_ENUMS::ENABLED[finsCommand$fileMemoryWriteCommand$command$dataTypeControlData$dataType$lastBlock];
            info_file_log$protected = OMRON_FINS_ENUMS::ENABLED[finsCommand$fileMemoryWriteCommand$command$dataTypeControlData$dataType$protected];
            info_file_log$control_data = finsCommand$fileMemoryWriteCommand$command$dataTypeControlData$controlData;
            info_file_log$block_no = finsCommand$fileMemoryWriteCommand$command$blockNo;
            info_file_log$memory_data = finsCommand$fileMemoryWriteCommand$command$data;

            # Fire the event and tidy up
            OMRON_FINS::emit_omron_fins_file_log(c);
            delete c$omron_fins_file_log;

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            #
            # Since there is only a response for this command, we capture the response_code in the general log file and 
            # not in the info_detail_log file.
            #
             
            # Set the general logging response code
            general_log_response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$fileMemoryWriteCommand$response$responseCode];
        }
  
        # Return the response code for general logging
        return general_log_response_code;
    }
