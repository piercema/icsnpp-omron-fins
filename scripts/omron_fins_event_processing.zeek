module OMRON_FINS;

event OMRON_FINS::UDP_MessagesEvt(c: connection, is_orig: bool, udpMessages: OMRON_FINS::UDP_Messages) {
    for (i in udpMessages$finsHeader) {
        # Set sesssion general log object
        c = set_session_general_log(c);

        # Process the FINS Heade data
        c = process_fins_header(c, c$omron_fins_general_log, udpMessages$finsHeader[i]);
    
        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_general_log(c);
        delete c$omron_fins_general_log;
    }
}

event OMRON_FINS::TCP_MessagesEvt(c: connection, is_orig: bool, tcpMessages: OMRON_FINS::TCP_Messages) {
    for (i in tcpMessages$tcpFinsHeader) {

        # Set sesssion general log object
        c = set_session_general_log(c);

        # Process the FINS Heade data
        c = process_tcp_fins_header(c, c$omron_fins_general_log, tcpMessages$tcpFinsHeader[i]);
    
        # Fire the event and tidy up
        OMRON_FINS::emit_omron_fins_general_log(c);
        delete c$omron_fins_general_log;
    }
}
