module OMRON_FINS;

    function process_controller_status_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        # Note: For the Controller Status Read command,there is no data to process; therefore we only process the response

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$controllerStatusReadCommand$response$responseCode];

            info_detail_log$controller_status_data_read_status = OMRON_FINS_ENUMS::CONTROLLER_STATUS_READ_STATUS[finsCommand$controllerStatusReadCommand$response$status];
            info_detail_log$controller_status_data_read_mode   = OMRON_FINS_ENUMS::CONTROLLER_STATUS_READ_MODE[finsCommand$controllerStatusReadCommand$response$mode];
            info_detail_log$fatal_error                        = finsCommand$controllerStatusReadCommand$response$fatalErrorDataVec;
            info_detail_log$non_fatal_error                    = finsCommand$controllerStatusReadCommand$response$nonFatalErrorDataVec;
            info_detail_log$message_yes_no                     = finsCommand$controllerStatusReadCommand$response$messageYesNoVec; 
            info_detail_log$fal_fals_no                        = finsCommand$controllerStatusReadCommand$response$falFalsNo ;
            info_detail_log$error_message                      = finsCommand$controllerStatusReadCommand$response$errorMessage; 
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_network_status_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {

        # Note: For the Network Status Read command,there is no data to process; therefore we only process the response

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {

            #
            # Network Member Data.
            #
            # Format:
            # Four bits are allocated to each number to provide information on the status of notes in the network as shown
            # below.  The function of each of the 4 bits is shown in the diagram following the table.
            #     ---------------------------------------------
            #     | Byte  |  Bits 4 to 7     | Bits 0 to 3    |
            #     ---------------------------------------------
            #     | Byte 1 | Node number 2   | Node number 1  |
            #     | Byte 2 | Node number 4   | Node number 3  |
            #     |    .   |      .          |      .         |
            #     |    .   |      .          |      .         |
            #     |    .   |      .          |      .         |
            #     | Byte 31 | Node number 62 | Node number 61 |
            #     ---------------------------------------------
            #
            #     Bit  3/7   2/6  1/5  0/4
            #         --------------------
            #         |    |  0 |    |   |
            #         --------------------
            #           |         |    |--------> 1: In Network (0: Not in network)
            #           |         |-------------> 1: Exited because of error.  (0: Normal exit)
            #           |-----------------------> 1: Unit does not respond to polling
            #
            #     See the omron_fins_types.spicy file for the Spicy representation of the Cyclic non-fatal data.
            #
            # Processing:
            # Loop over the 31 Network Member Data nodes.  For each iteration of the loop, process both the odd numbered nodes
            # (bits 0 to 3) and the even numbered nodes (bits 4 to 7).  The odd numbered node information is represented by
            # the nodeData$inNetwork_1, nodeData$exitStatus_1, and nodeData$polling_1 fields while the even numbered node
            # information is represented by the nodeData$inNetwork_2, nodeData$exitStatus_2, and nodeData$polling_2 fields.
            # 
            # The resulting network status read information is temporarily stored in a vector for additional down stream
            # processing.
            #
            local network_status_vector : vector of network_status_read_log;
            local network_status_read_1 : network_status_read_log;
            local network_status_read_2 : network_status_read_log;
            for (i in finsCommand$networkStatusReadCommand$response$networkMemberData$nodes) {

                #
                # Odd numbered nodes
                #
                network_status_read_1 = network_status_read_log($ts=network_time(), $uid=c$uid, $id=c$id);

                network_status_read_1$omron_fins_link_id = link_id;
                network_status_read_1$command_code       = OMRON_FINS_ENUMS::COMMAND[finsCommand$commandCode];
                network_status_read_1$icf_data_type      = OMRON_FINS_ENUMS::DATA_TYPE[finsCommand$icfDataType];

                network_status_read_1$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$networkStatusReadCommand$response$responseCode];

                network_status_read_1$in_network  = OMRON_FINS_ENUMS::IN_NETWORK[finsCommand$networkStatusReadCommand$response$networkMemberData$nodes[i]$nodeData$inNetwork_1];
                network_status_read_1$exit_status = OMRON_FINS_ENUMS::EXIT_STATUS[finsCommand$networkStatusReadCommand$response$networkMemberData$nodes[i]$nodeData$exitStatus_1];
                network_status_read_1$polling     = OMRON_FINS_ENUMS::POLLING[finsCommand$networkStatusReadCommand$response$networkMemberData$nodes[i]$nodeData$polling_1];

                network_status_read_1$communication_cycle_time    = finsCommand$networkStatusReadCommand$response$communicationCycleTime;
                network_status_read_1$current_polling_node_number = finsCommand$networkStatusReadCommand$response$currentPollingNodeNumber;
                network_status_read_1$cyclic_operation            = OMRON_FINS_ENUMS::CYCLIC_OPERATION[finsCommand$networkStatusReadCommand$response$cyclicOperation];
                network_status_read_1$cyclic_transmission_status  = OMRON_FINS_ENUMS::CYCLIC_TRANSMISSION_STATUS[finsCommand$networkStatusReadCommand$response$cyclicTransmissionStatus];
                network_status_read_1$cyclic_error_count          = finsCommand$networkStatusReadCommand$response$cyclicErrorCounters[i];

                # Append results for the odd numbered node(s)
                network_status_vector += network_status_read_1;

                #
                # Even numbered nodes
                #
                network_status_read_2 = network_status_read_log($ts=network_time(), $uid=c$uid, $id=c$id);
                network_status_read_2$omron_fins_link_id = link_id;
                network_status_read_2$command_code       = OMRON_FINS_ENUMS::COMMAND[finsCommand$commandCode];
                network_status_read_2$icf_data_type      = OMRON_FINS_ENUMS::DATA_TYPE[finsCommand$icfDataType];

                network_status_read_2$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$networkStatusReadCommand$response$responseCode];

                network_status_read_2$in_network  = OMRON_FINS_ENUMS::IN_NETWORK[finsCommand$networkStatusReadCommand$response$networkMemberData$nodes[i]$nodeData$inNetwork_2];
                network_status_read_2$exit_status = OMRON_FINS_ENUMS::EXIT_STATUS[finsCommand$networkStatusReadCommand$response$networkMemberData$nodes[i]$nodeData$exitStatus_2];
                network_status_read_2$polling     = OMRON_FINS_ENUMS::POLLING[finsCommand$networkStatusReadCommand$response$networkMemberData$nodes[i]$nodeData$polling_2];

                network_status_read_2$communication_cycle_time    = finsCommand$networkStatusReadCommand$response$communicationCycleTime;
                network_status_read_2$current_polling_node_number = finsCommand$networkStatusReadCommand$response$currentPollingNodeNumber;
                network_status_read_2$cyclic_operation            = OMRON_FINS_ENUMS::CYCLIC_OPERATION[finsCommand$networkStatusReadCommand$response$cyclicOperation];
                network_status_read_2$cyclic_transmission_status  = OMRON_FINS_ENUMS::CYCLIC_TRANSMISSION_STATUS[finsCommand$networkStatusReadCommand$response$cyclicTransmissionStatus];
                network_status_read_2$cyclic_error_count          = finsCommand$networkStatusReadCommand$response$cyclicErrorCounters[i+1];

                # Append results for the even numbered node(s)
                network_status_vector += network_status_read_2;
            }

            #
            # Cyclic non-fatal errors
            #
            # Format:
            # These eight bytes indicate nodes in which non-fatal error occurred in cyclic transmission.  When a bit in the following matrix is ON, a
            # non-fatal error occurred in the corresponding node.  Bit 0 of the first byte and bit 7 of the eighth byte are always OFF
            #
            #             Bit    7    6    5    4    3    2    1    0
            #                 -----------------------------------------
            #      First byte |  7 |  6 |  5 |  4 |  3 |  2 |  1 |  - |
            #     Second byte | 15 | 14 | 13 | 12 | 11 | 10 |  9 |  8 |
            #      Third byte | 23 | 22 | 21 | 20 | 19 | 18 | 17 | 16 |
            #     Fourth byte | 31 | 30 | 29 | 28 | 27 | 26 | 25 | 24 |
            #      Fifth byte | 39 | 38 | 37 | 36 | 35 | 34 | 33 | 32 |
            #      Sixth byte | 47 | 46 | 45 | 44 | 43 | 42 | 41 | 40 |
            #    Seventh byte | 55 | 54 | 53 | 52 | 51 | 50 | 49 | 48 |
            #     Eighth byte |  - | 62 | 61 | 60 | 59 | 58 | 57 | 56 |
            #                 -----------------------------------------
            #
            #     See the omron_fins_types.spicy file for the Spicy representation of the Cyclic non-fatal data.
            #
            # Processing:
            # Loop over the cyclic non-fatal error nodes where each byte is represented by an 8 bit bitfield.  Note: If the index i is equal to 0 (First byte), then
            # we start processing data at bit 1 - skipping bit 0 of the first byte.  Similarily, if the index i is equal to 7 (Eighth byte), then we stop 
            # processing data at bit 6 - skipping bit 7 of the eighth byte.  For bytes 2 through 7, we process bits 0 to 7.
            # 
            local network_status_read : network_status_read_log;
            local node_count = 0;
            for (i in finsCommand$networkStatusReadCommand$response$cyclicNonFatalErrors$nodes) {
                if (i == 0) { # First byte
                    network_status_read = network_status_vector[node_count];
                    network_status_read$node_number = ++node_count;
                    network_status_read$non_fatal_error  = OMRON_FINS_ENUMS::NON_FATAL_ERROR_STATUS[finsCommand$networkStatusReadCommand$response$cyclicNonFatalErrors$nodes[i]$nodeData$nonFatalError_1];
                    c$omron_fins_network_status_read_log = network_status_read;
                    OMRON_FINS::emit_omron_fins_network_status_read_log(c);
                    delete c$omron_fins_network_status_read_log;

                    network_status_read = network_status_vector[node_count];
                    network_status_read$node_number = ++node_count;
                    network_status_read$non_fatal_error  = OMRON_FINS_ENUMS::NON_FATAL_ERROR_STATUS[finsCommand$networkStatusReadCommand$response$cyclicNonFatalErrors$nodes[i]$nodeData$nonFatalError_2];
                    c$omron_fins_network_status_read_log = network_status_read;
                    OMRON_FINS::emit_omron_fins_network_status_read_log(c);
                    delete c$omron_fins_network_status_read_log;

                    network_status_read = network_status_vector[node_count];
                    network_status_read$node_number = ++node_count;
                    network_status_read$non_fatal_error  = OMRON_FINS_ENUMS::NON_FATAL_ERROR_STATUS[finsCommand$networkStatusReadCommand$response$cyclicNonFatalErrors$nodes[i]$nodeData$nonFatalError_3];
                    c$omron_fins_network_status_read_log = network_status_read;
                    OMRON_FINS::emit_omron_fins_network_status_read_log(c);
                    delete c$omron_fins_network_status_read_log;

                    network_status_read = network_status_vector[node_count];
                    network_status_read$node_number = ++node_count;
                    network_status_read$non_fatal_error  = OMRON_FINS_ENUMS::NON_FATAL_ERROR_STATUS[finsCommand$networkStatusReadCommand$response$cyclicNonFatalErrors$nodes[i]$nodeData$nonFatalError_4];
                    c$omron_fins_network_status_read_log = network_status_read;
                    OMRON_FINS::emit_omron_fins_network_status_read_log(c);
                    delete c$omron_fins_network_status_read_log;

                    network_status_read = network_status_vector[node_count];
                    network_status_read$node_number = ++node_count;
                    network_status_read$non_fatal_error  = OMRON_FINS_ENUMS::NON_FATAL_ERROR_STATUS[finsCommand$networkStatusReadCommand$response$cyclicNonFatalErrors$nodes[i]$nodeData$nonFatalError_5];
                    c$omron_fins_network_status_read_log = network_status_read;
                    OMRON_FINS::emit_omron_fins_network_status_read_log(c);
                    delete c$omron_fins_network_status_read_log;

                    network_status_read = network_status_vector[node_count];
                    network_status_read$node_number = ++node_count;
                    network_status_read$non_fatal_error  = OMRON_FINS_ENUMS::NON_FATAL_ERROR_STATUS[finsCommand$networkStatusReadCommand$response$cyclicNonFatalErrors$nodes[i]$nodeData$nonFatalError_6];
                    c$omron_fins_network_status_read_log = network_status_read;
                    OMRON_FINS::emit_omron_fins_network_status_read_log(c);
                    delete c$omron_fins_network_status_read_log;

                    network_status_read = network_status_vector[node_count];
                    network_status_read$node_number = ++node_count;
                    network_status_read$non_fatal_error  = OMRON_FINS_ENUMS::NON_FATAL_ERROR_STATUS[finsCommand$networkStatusReadCommand$response$cyclicNonFatalErrors$nodes[i]$nodeData$nonFatalError_7];
                    c$omron_fins_network_status_read_log = network_status_read;
                    OMRON_FINS::emit_omron_fins_network_status_read_log(c);
                    delete c$omron_fins_network_status_read_log;

                } else if (i == 7) { # Eighth byte
                    network_status_read = network_status_vector[node_count];
                    network_status_read$node_number = ++node_count;
                    network_status_read$non_fatal_error  = OMRON_FINS_ENUMS::NON_FATAL_ERROR_STATUS[finsCommand$networkStatusReadCommand$response$cyclicNonFatalErrors$nodes[i]$nodeData$nonFatalError_0];
                    c$omron_fins_network_status_read_log = network_status_read;
                    OMRON_FINS::emit_omron_fins_network_status_read_log(c);
                    delete c$omron_fins_network_status_read_log;

                    network_status_read = network_status_vector[node_count];
                    network_status_read$node_number = ++node_count;
                    network_status_read$non_fatal_error  = OMRON_FINS_ENUMS::NON_FATAL_ERROR_STATUS[finsCommand$networkStatusReadCommand$response$cyclicNonFatalErrors$nodes[i]$nodeData$nonFatalError_1];
                    c$omron_fins_network_status_read_log = network_status_read;
                    OMRON_FINS::emit_omron_fins_network_status_read_log(c);
                    delete c$omron_fins_network_status_read_log;

                    network_status_read = network_status_vector[node_count];
                    network_status_read$node_number = ++node_count;
                    network_status_read$non_fatal_error  = OMRON_FINS_ENUMS::NON_FATAL_ERROR_STATUS[finsCommand$networkStatusReadCommand$response$cyclicNonFatalErrors$nodes[i]$nodeData$nonFatalError_2];
                    c$omron_fins_network_status_read_log = network_status_read;
                    OMRON_FINS::emit_omron_fins_network_status_read_log(c);
                    delete c$omron_fins_network_status_read_log;

                    network_status_read = network_status_vector[node_count];
                    network_status_read$node_number = ++node_count;
                    network_status_read$non_fatal_error  = OMRON_FINS_ENUMS::NON_FATAL_ERROR_STATUS[finsCommand$networkStatusReadCommand$response$cyclicNonFatalErrors$nodes[i]$nodeData$nonFatalError_3];
                    c$omron_fins_network_status_read_log = network_status_read;
                    OMRON_FINS::emit_omron_fins_network_status_read_log(c);
                    delete c$omron_fins_network_status_read_log;

                    network_status_read = network_status_vector[node_count];
                    network_status_read$node_number = ++node_count;
                    network_status_read$non_fatal_error  = OMRON_FINS_ENUMS::NON_FATAL_ERROR_STATUS[finsCommand$networkStatusReadCommand$response$cyclicNonFatalErrors$nodes[i]$nodeData$nonFatalError_4];
                    c$omron_fins_network_status_read_log = network_status_read;
                    OMRON_FINS::emit_omron_fins_network_status_read_log(c);
                    delete c$omron_fins_network_status_read_log;

                    network_status_read = network_status_vector[node_count];
                    network_status_read$node_number = ++node_count;
                    network_status_read$non_fatal_error  = OMRON_FINS_ENUMS::NON_FATAL_ERROR_STATUS[finsCommand$networkStatusReadCommand$response$cyclicNonFatalErrors$nodes[i]$nodeData$nonFatalError_5];
                    c$omron_fins_network_status_read_log = network_status_read;
                    OMRON_FINS::emit_omron_fins_network_status_read_log(c);
                    delete c$omron_fins_network_status_read_log;

                    network_status_read = network_status_vector[node_count];
                    network_status_read$node_number = ++node_count;
                    network_status_read$non_fatal_error  = OMRON_FINS_ENUMS::NON_FATAL_ERROR_STATUS[finsCommand$networkStatusReadCommand$response$cyclicNonFatalErrors$nodes[i]$nodeData$nonFatalError_6];
                    c$omron_fins_network_status_read_log = network_status_read;
                    OMRON_FINS::emit_omron_fins_network_status_read_log(c);
                    delete c$omron_fins_network_status_read_log;

                } else {  # Bytes 2 through 7
                    network_status_read = network_status_vector[node_count];
                    network_status_read$node_number = ++node_count;
                    network_status_read$non_fatal_error  = OMRON_FINS_ENUMS::NON_FATAL_ERROR_STATUS[finsCommand$networkStatusReadCommand$response$cyclicNonFatalErrors$nodes[i]$nodeData$nonFatalError_0];
                    c$omron_fins_network_status_read_log = network_status_read;
                    OMRON_FINS::emit_omron_fins_network_status_read_log(c);
                    delete c$omron_fins_network_status_read_log;

                    network_status_read = network_status_vector[node_count];
                    network_status_read$node_number = ++node_count;
                    network_status_read$non_fatal_error  = OMRON_FINS_ENUMS::NON_FATAL_ERROR_STATUS[finsCommand$networkStatusReadCommand$response$cyclicNonFatalErrors$nodes[i]$nodeData$nonFatalError_1];
                    c$omron_fins_network_status_read_log = network_status_read;
                    OMRON_FINS::emit_omron_fins_network_status_read_log(c);
                    delete c$omron_fins_network_status_read_log;

                    network_status_read = network_status_vector[node_count];
                    network_status_read$node_number = ++node_count;
                    network_status_read$non_fatal_error  = OMRON_FINS_ENUMS::NON_FATAL_ERROR_STATUS[finsCommand$networkStatusReadCommand$response$cyclicNonFatalErrors$nodes[i]$nodeData$nonFatalError_2];
                    c$omron_fins_network_status_read_log = network_status_read;
                    OMRON_FINS::emit_omron_fins_network_status_read_log(c);
                    delete c$omron_fins_network_status_read_log;

                    network_status_read = network_status_vector[node_count];
                    network_status_read$node_number = ++node_count;
                    network_status_read$non_fatal_error  = OMRON_FINS_ENUMS::NON_FATAL_ERROR_STATUS[finsCommand$networkStatusReadCommand$response$cyclicNonFatalErrors$nodes[i]$nodeData$nonFatalError_3];
                    c$omron_fins_network_status_read_log = network_status_read;
                    OMRON_FINS::emit_omron_fins_network_status_read_log(c);
                    delete c$omron_fins_network_status_read_log;

                    network_status_read = network_status_vector[node_count];
                    network_status_read$node_number = ++node_count;
                    network_status_read$non_fatal_error  = OMRON_FINS_ENUMS::NON_FATAL_ERROR_STATUS[finsCommand$networkStatusReadCommand$response$cyclicNonFatalErrors$nodes[i]$nodeData$nonFatalError_4];
                    c$omron_fins_network_status_read_log = network_status_read;
                    OMRON_FINS::emit_omron_fins_network_status_read_log(c);
                    delete c$omron_fins_network_status_read_log;

                    network_status_read = network_status_vector[node_count];
                    network_status_read$node_number = ++node_count;
                    network_status_read$non_fatal_error  = OMRON_FINS_ENUMS::NON_FATAL_ERROR_STATUS[finsCommand$networkStatusReadCommand$response$cyclicNonFatalErrors$nodes[i]$nodeData$nonFatalError_5];
                    c$omron_fins_network_status_read_log = network_status_read;
                    OMRON_FINS::emit_omron_fins_network_status_read_log(c);
                    delete c$omron_fins_network_status_read_log;

                    network_status_read = network_status_vector[node_count];
                    network_status_read$node_number = ++node_count;
                    network_status_read$non_fatal_error  = OMRON_FINS_ENUMS::NON_FATAL_ERROR_STATUS[finsCommand$networkStatusReadCommand$response$cyclicNonFatalErrors$nodes[i]$nodeData$nonFatalError_6];
                    c$omron_fins_network_status_read_log = network_status_read;
                    OMRON_FINS::emit_omron_fins_network_status_read_log(c);
                    delete c$omron_fins_network_status_read_log;

                    network_status_read = network_status_vector[node_count];
                    network_status_read$node_number = ++node_count;
                    network_status_read$non_fatal_error  = OMRON_FINS_ENUMS::NON_FATAL_ERROR_STATUS[finsCommand$networkStatusReadCommand$response$cyclicNonFatalErrors$nodes[i]$nodeData$nonFatalError_7];
                    c$omron_fins_network_status_read_log = network_status_read;
                    OMRON_FINS::emit_omron_fins_network_status_read_log(c);
                    delete c$omron_fins_network_status_read_log;
                }
            }
        }
    }

    function process_data_link_status_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$dataLinkStatusReadCommand$response$responseCode];

        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_cycle_time_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_detail_log$cycle_time_read_parameter = OMRON_FINS_ENUMS::CYCLE_TIME_READ_PARAMETER[finsCommand$cycleTimeReadCommand$command$parameter];

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code      = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$cycleTimeReadCommand$response$responseCode];
            info_detail_log$average_cycle_time = finsCommand$cycleTimeReadCommand$response$averageCycleTime;
            info_detail_log$max_cycle_time     = finsCommand$cycleTimeReadCommand$response$maxCycleTime;
            info_detail_log$min_cycle_time     = finsCommand$cycleTimeReadCommand$response$minCycleTime;
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

