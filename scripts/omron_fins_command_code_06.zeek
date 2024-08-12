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

                network_status_vector += network_status_read_2;

            }

            local network_status_read : network_status_read_log;
            local node_count = 0;
            for (i in finsCommand$networkStatusReadCommand$response$cyclicNonFatalErrors$nodes) {
                if (i == 0) {
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

                } else if (i == 7) {
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

                } else {
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

