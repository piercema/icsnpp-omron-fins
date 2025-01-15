module OMRON_FINS;

    function set_session_general_log(c: connection): connection {
        if ( ! c?$omron_fins_general_log )
            c$omron_fins_general_log = general_log(
                $ts=network_time(),
                $uid=c$uid,
                $id=c$id,
                $proto=get_conn_transport_proto(c$id));
        
        return c;
    }

    function set_session_detail_log(c: connection): connection {
        if ( ! c?$omron_fins_detail_log )
            c$omron_fins_detail_log = detail_log(
                $ts=network_time(),
                $uid=c$uid,
                $id=c$id);

        return c;
    }

    function set_session_file_log(c: connection): connection {
        if ( ! c?$omron_fins_file_log )
            c$omron_fins_file_log = detail_file_log(
                $ts=network_time(),
                $uid=c$uid,
                $id=c$id);

        return c;
    }

    function process_command_and_datatype_detail(info_detail_log: detail_log, finsCommand: OMRON_FINS::Command): detail_log {

        info_detail_log$command_code  = OMRON_FINS_ENUMS::COMMAND[finsCommand$commandCode];
        info_detail_log$icf_data_type = OMRON_FINS_ENUMS::DATA_TYPE[finsCommand$icfDataType];

        return info_detail_log;
    }

    function process_command_and_datatype_file(info_file_log: detail_file_log, finsCommand: OMRON_FINS::Command): detail_file_log {

        info_file_log$command_code  = OMRON_FINS_ENUMS::COMMAND[finsCommand$commandCode];
        info_file_log$icf_data_type = OMRON_FINS_ENUMS::DATA_TYPE[finsCommand$icfDataType];

        return info_file_log;
    }

    function convert_enabled_to_boolean(enabledValue: string) : bool
    {
        local boolean_value: bool;
        if (enabledValue == "True (1)"){
            boolean_value = T;
        }
        else {
           boolean_value = F;
        }

        return boolean_value;
    }
