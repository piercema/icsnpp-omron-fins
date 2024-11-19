module OMRON_FINS;

event OMRON_FINS::UDP_MessagesEvt(c: connection, is_orig: bool, udpMessages: OMRON_FINS::UDP_Messages) {
    for (i in udpMessages$finsHeader) {
        process_fins_header(c, udpMessages$finsHeader[i]);
    }
}
