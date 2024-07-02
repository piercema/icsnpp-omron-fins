## main.zeek
##
## ICSNPP-OMRON_FINS
##
## Zeek script type/record definitions describing the information
## that will be written to the log files.
##

module OMRON_FINS;

export {
    redef enum Log::ID += { LOG_GENERAL_LOG, LOG_DETAIL_LOG };

    # Log policies for log filtering
    global log_policy_general: Log::PolicyHook;
    global log_policy_detail:  Log::PolicyHook;

    global log_general_log: event(rec: general_log);
    global log_detail_log: event(rec: detail_log);
    global emit_omron_fins_general_log: function(c: connection);
    global emit_omron_fins_detail_log: function(c: connection);

}

# redefine connection record to contain one of each of the omron_fins records
redef record connection += {
    omron_fins_proto: string &optional;
    omron_fins_general_log: general_log &optional;
    omron_fins_detail_log: detail_log &optional;
};

#Put protocol detection information here
event zeek_init() &priority=5 {
    # initialize logging streams for all omron_fins logs
    Log::create_stream(OMRON_FINS::LOG_GENERAL_LOG,
                      [$columns=general_log,
                      $ev=log_general_log,
                      $path="omron_fins_general",
                      $policy=log_policy_general]);

    Log::create_stream(OMRON_FINS::LOG_DETAIL_LOG,
                      [$columns=detail_log,
                      $ev=log_detail_log,
                      $path="omron_fins_detail",
                      $policy=log_policy_detail]);
}

function emit_omron_fins_general_log(c: connection) {
    if (! c?$omron_fins_general_log )
        return;
    if ( c?$omron_fins_proto )
        c$omron_fins_general_log$proto = c$omron_fins_proto;
    Log::write(OMRON_FINS::LOG_GENERAL_LOG, c$omron_fins_general_log);
}

function emit_omron_fins_detail_log(c: connection) {
    if (! c?$omron_fins_detail_log )
        return;

    Log::write(OMRON_FINS::LOG_DETAIL_LOG, c$omron_fins_detail_log);
}

