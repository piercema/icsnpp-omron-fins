## main.zeek
##
## ICSNPP-OMRON_FINS
##
## Zeek script type/record definitions describing the information
## that will be written to the log files.
##

module OMRON_FINS;

export {
    redef enum Log::ID += { LOG_GENERAL_LOG };

    global log_general_log: event(rec: general_log);
    global emit_omron_fins_general_log: function(c: connection);

}

# redefine connection record to contain one of each of the omron_fins records
redef record connection += {
    omron_fins_proto: string &optional;
    omron_fins_general_log: general_log &optional;
};

#Put protocol detection information here
event zeek_init() &priority=5 {
    # initialize logging streams for all omron_fins logs
                      Log::create_stream(OMRON_FINS::LOG_GENERAL_LOG,
                      [$columns=general_log,
                      $ev=log_general_log,
                      $path="omron_fins_general"]);
}

function emit_omron_fins_general_log(c: connection) {
    if (! c?$omron_fins_general_log )
        return;
    if ( c?$omron_fins_proto )
        c$omron_fins_general_log$proto = c$omron_fins_proto;
    Log::write(OMRON_FINS::LOG_GENERAL_LOG, c$omron_fins_general_log);
    delete c$omron_fins_general_log;
}


