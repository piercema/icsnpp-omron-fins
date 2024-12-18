module OMRON_FINS;

event OMRON_FINS::UDP_MessageEvt(c: connection, is_orig: bool, udpMessage: OMRON_FINS::UDP_Message) {
    # Set sesssion general log object
    c = set_session_general_log(c);

    # Process the FINS Heade data
    c = process_fins_header(c, c$omron_fins_general_log, udpMessage$finsHeader);

    # Fire the event and tidy up
    OMRON_FINS::emit_omron_fins_general_log(c);
    delete c$omron_fins_general_log;
    
}

event OMRON_FINS::TCP_FINS_HeaderEvt(c: connection, is_orig: bool, tcpFinsHeader: OMRON_FINS::TCP_FINS_Header) {

    # Set sesssion general log object
    c = set_session_general_log(c);

    # Process the FINS Heade data
    c = process_tcp_fins_header(c, c$omron_fins_general_log, tcpFinsHeader);

    # Fire the event and tidy up
    OMRON_FINS::emit_omron_fins_general_log(c);
    delete c$omron_fins_general_log;
}
