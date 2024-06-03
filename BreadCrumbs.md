# Bread Crumbs

This document is an attempt to leave some bread crumbs for picking up development after a "funding pause".  

The latest devlopment [commit](https://github.com/kkvarfordt/omron-fins/commit/ee6abe18a9186646353d3349e78e662d336b2df4) is an early pass at processing the MEMORY_AREA_READ response information to include the data.  Reviewing the `omron.pcap`, there appears to be only 1 MEMORY_AREA_READ response that contains a "Normal completion (0x0000)" response code.  All the others indicate some sort of error condition.  Oddly, the 1 MEMORY_AREA_READ response that has a "Normal completion (0x0000)" response code does NOT contain any data in the response which makes testing the `bytesToHexString` function difficult.

Next steps would be to sanity check the MEMORY_AREA_READ response capability, then implement the `MultipleMemoryAreaRead_Command` and `MultipleMemoryAreaRead_Response` functionality.  Some of the MULTIPLE_MEMORY_AREA_READ response commands have returned data.