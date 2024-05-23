module OMRON_FINS_FUNCTIONS;

export {

    function process_memory_area_read(c: connection, fins_command: OMRON_FINS::Command): connection {
        print "MEMORY_AREA_READ";
        return c;
    }

}
