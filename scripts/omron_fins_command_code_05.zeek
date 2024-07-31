module OMRON_FINS;

    function process_controller_data_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {
            info_detail_log$controller_data_to_read = OMRON_FINS_ENUMS::CONTROLLER_DATA[finsCommand$controllerDataReadCommand$command$controllerData];

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$controllerDataReadCommand$response$responseCode];

            info_detail_log$controller_model        = finsCommand$controllerDataReadCommand$response$controllerModel;
            info_detail_log$controller_version      = finsCommand$controllerDataReadCommand$response$controllerVersion;
            info_detail_log$for_system_use          = finsCommand$controllerDataReadCommand$response$forSystemUse;
            info_detail_log$program_area_size       = finsCommand$controllerDataReadCommand$response$programAreaSize;
            info_detail_log$iom_size                = finsCommand$controllerDataReadCommand$response$iomSize;
            info_detail_log$no_of_dm_words          = finsCommand$controllerDataReadCommand$response$noOfDMWords;
            info_detail_log$timer_size              = finsCommand$controllerDataReadCommand$response$timerSize;
            info_detail_log$expansion_dm_size       = finsCommand$controllerDataReadCommand$response$expansionDMSize;
            info_detail_log$no_of_steps_transitions = finsCommand$controllerDataReadCommand$response$noOfStepsTransitions;
            info_detail_log$kind_of_memory_card     = OMRON_FINS_ENUMS::KIND_OF_MEMORYCARD[finsCommand$controllerDataReadCommand$response$kindOfMemoryCard];
            info_detail_log$memory_card_size        = finsCommand$controllerDataReadCommand$response$memoryCardSize;

            info_detail_log$cpu_bus_unit_config              = finsCommand$controllerDataReadCommand$response$cpuBusUnitConfig;
            info_detail_log$no_of_sysmac_bus_master_mounted  = finsCommand$controllerDataReadCommand$response$noOfSysmacBusMastersMounted;
            info_detail_log$no_of_sysmac_bus2_master_mounted = finsCommand$controllerDataReadCommand$response$noOfSysmacBus2MastersMounted;
            info_detail_log$pc_status                        = finsCommand$controllerDataReadCommand$response$pcStatus;
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }

    function process_connection_data_read_detail(c: connection, finsCommand: OMRON_FINS::Command, link_id: string) {
        c = set_session_detail_log(c);

        local info_detail_log = c$omron_fins_detail_log;
        info_detail_log$omron_fins_link_id = link_id;
        info_detail_log = process_command_and_datatype_detail(info_detail_log, finsCommand);

        if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_COMMAND) {

        } else if (finsCommand$icfDataType == OMRON_FINS_ENUMS::DataType_RESPONSE) {
            info_detail_log$response_code = OMRON_FINS_ENUMS::RESPONSE_CODE[finsCommand$connectionDataReadCommand$response$responseCode];
        }

        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_detail_log(c);
        delete c$omron_fins_detail_log;
    }
