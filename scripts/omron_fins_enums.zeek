module OMRON_FINS_ENUMS;

export{

    #
    # Section 1-3 Command/Response Transmission Data 
    #   Information Control Field (ICF) Details:
    #
    #   Bitfield:
    #     [7]   - Gateway usage (0: don't use; 1: use); set to 1.
    #     [6]   - Data type (0: command; 1: response)
    #     [5-1] - Reserved.  Set to 0.
    #     [0]   - Response setting (0: response required; 1: response not required)
    #
    const DATA_TYPE = {
        [OMRON_FINS_ENUMS::DataType_COMMAND]  = "Command (0)",
        [OMRON_FINS_ENUMS::DataType_RESPONSE] = "Response (1)"
    }&default = "Unknown";

    #
    # Section 1-3 Command/Response Transmission Data 
    #   Information Control Field (ICF) Details:
    #
    #   Bitfield:
    #     [7]   - Gateway usage (0: don't use; 1: use); set to 1.
    #     [6]   - Data type (0: command; 1: response)
    #     [5-1] - Reserved.  Set to 0.
    #     [0]   - Response setting (0: response required; 1: response not required)
    #
    const GATEWAY_USAGE = {
        [OMRON_FINS_ENUMS::GatewayUsage_DONT_USE] = "Don't Use (0)",
        [OMRON_FINS_ENUMS::GatewayUsage_USE]      = "Use (1)"
    }&default = "Unknown";

    #
    # Section 1-3 Command/Response Transmission Data 
    #   Information Control Field (ICF) Details:
    #
    #   Bitfield:
    #     [7]   - Gateway usage (0: don't use; 1: use); set to 1.
    #     [6]   - Data type (0: command; 1: response)
    #     [5-1] - Reserved.  Set to 0.
    #     [0]   - Response setting (0: response required; 1: response not required)
    #
    const RESPONSE_SETTING = {
        [OMRON_FINS_ENUMS::ResponseSetting_RESPONSE_REQ]     = "Response-Required (0)",
        [OMRON_FINS_ENUMS::ResponseSetting_RESPONSE_NOT_REQ] = "Response-Not-Required (1)"
    }&default = "Unknown";

    #
    # Appendix A: FINS Command List
    #
    const COMMAND = {
        [OMRON_FINS_ENUMS::CommandCode_MEMORY_AREA_READ]              = "Memory Area Read (0x0101)",
        [OMRON_FINS_ENUMS::CommandCode_MEMORY_AREA_WRITE]             = "Memory Area Write (0x0102)",
        [OMRON_FINS_ENUMS::CommandCode_MEMORY_AREA_FILL]              = "Memory Area Fill (0x0103)",
        [OMRON_FINS_ENUMS::CommandCode_MULTIPLE_MEMORY_AREA_READ]     = "Multiple Memory Area Read (0x0104)",
        [OMRON_FINS_ENUMS::CommandCode_MEMORY_AREA_TRANSFER]          = "Memory Area Transfer (0x0105)",

        [OMRON_FINS_ENUMS::CommandCode_PARAMETER_AREA_READ]           = "Parameter Area Read (0x0201)",
        [OMRON_FINS_ENUMS::CommandCode_PARAMETER_AREA_WRITE]          = "Parameter Area Write (0x0202)",
        [OMRON_FINS_ENUMS::CommandCode_PARAMETER_AREA_CLEAR]          = "Parameter Area Clear (0x0203)",
        [OMRON_FINS_ENUMS::CommandCode_DATA_LINK_TABLE_READ]          = "Data Link Table Read (0x0220)",
        [OMRON_FINS_ENUMS::CommandCode_DATA_LINK_TABLE_WRITE]         = "Data Link Table Write (0x0221)",

        [OMRON_FINS_ENUMS::CommandCode_PROGRAM_AREA_PROTECT]          = "Program Area Protect (0x0301)",
        [OMRON_FINS_ENUMS::CommandCode_PROGRAM_AREA_PROTECT_CLEAR]    = "Program Area Protect Clear (0x0302)",
        [OMRON_FINS_ENUMS::CommandCode_PROGRAM_AREA_READ]             = "Program Area Read (0x0303)",
        [OMRON_FINS_ENUMS::CommandCode_PROGRAM_AREA_WRITE]            = "Program Area Write (0x0304)",
        [OMRON_FINS_ENUMS::CommandCode_PROGRAM_AREA_CLEAR]            = "Program Area Clear (0x0305)",

        [OMRON_FINS_ENUMS::CommandCode_RUN]                           = "Run (0x0401)",
        [OMRON_FINS_ENUMS::CommandCode_STOP]                          = "Stop (0x0402)",
        [OMRON_FINS_ENUMS::CommandCode_RESET]                         = "Reset (0x0403)",

        [OMRON_FINS_ENUMS::CommandCode_CONTROLLER_DATA_READ]          = "Controller Data Read (0x0501)",
        [OMRON_FINS_ENUMS::CommandCode_CONNECTION_DATA_READ]          = "Connection Data Read (0x0502)",

        [OMRON_FINS_ENUMS::CommandCode_CONTROLLER_STATUS_READ]        = "Controller Status Read (0x0601)",
        [OMRON_FINS_ENUMS::CommandCode_NETWORK_STATUS_READ]           = "Network Status Read (0x0602)" ,
        [OMRON_FINS_ENUMS::CommandCode_DATA_LINK_STATUS_READ]         = "Data Link Status Read (0x0603)",
        [OMRON_FINS_ENUMS::CommandCode_CYCLE_TIME_READ]               = "Cycle Time Read (0x0620)",

        [OMRON_FINS_ENUMS::CommandCode_CLOCK_READ]                    = "Clock Read (0x0701)",
        [OMRON_FINS_ENUMS::CommandCode_CLOCK_WRITE]                   = "Clock Write (0x0702)",

        [OMRON_FINS_ENUMS::CommandCode_LOOP_BACK_TEST]                = "Loop Back Test (0x0801)",
        [OMRON_FINS_ENUMS::CommandCode_BROADCAST_TEST_RESULTS_READ]   = "Broadcast Test Results Read (0x0802)",
        [OMRON_FINS_ENUMS::CommandCode_BROADCAST_TEST_DATA_SEND]      = "Broadcast Test Data Send (0x0803)" ,

        [OMRON_FINS_ENUMS::CommandCode_MESSAGE_READ_MESSAGE_CLEAR_FAL_FALS_READ] = "Message Read | Message Clear | FAL/FALS Read (0x0920)",

        [OMRON_FINS_ENUMS::CommandCode_ACCESS_RIGHT_ACQUIRE]          = "Access Right Acquire (0x0C01)",
        [OMRON_FINS_ENUMS::CommandCode_ACCESS_RIGHT_FORCED_ACQUIRE]   = "Access Right Forced Acquire (0x0C02)",
        [OMRON_FINS_ENUMS::CommandCode_ACCESS_RIGHT_RELEASE]          = "Access Right Release (0x0C03)",

        [OMRON_FINS_ENUMS::CommandCode_ERROR_CLEAR]                   = "Error Clear (0x2101)",
        [OMRON_FINS_ENUMS::CommandCode_ERROR_LOG_READ]                = "Error Log Read (0x2102)",
        [OMRON_FINS_ENUMS::CommandCode_ERROR_LOG_CLEAR]               = "Error Log Clear (0x2103)",

        [OMRON_FINS_ENUMS::CommandCode_FILE_NAME_READ]                = "File Name Read (0x2201)",
        [OMRON_FINS_ENUMS::CommandCode_SINGLE_FILE_READ]              = "Single File Name Read (0x2202)",
        [OMRON_FINS_ENUMS::CommandCode_SINGLE_FILE_WRITE]             = "Single File Name Write (0x2203)",
        [OMRON_FINS_ENUMS::CommandCode_MEMORY_CARD_FORMAT]            = "Memory Card Format (0x2204)",
        [OMRON_FINS_ENUMS::CommandCode_FILE_DELETE]                   = "File Delete (0x2205)",
        [OMRON_FINS_ENUMS::CommandCode_VOLUME_LABEL_CREATE_DELETE]    = "Volume Label Create Delete (0x2206)",
        [OMRON_FINS_ENUMS::CommandCode_FILE_COPY]                     = "File Copy (0x2207)",
        [OMRON_FINS_ENUMS::CommandCode_FILE_NAME_CHANGE]              = "File Name Change (0x2208)",
        [OMRON_FINS_ENUMS::CommandCode_FILE_DATA_CHECK]               = "File Data Check (0x2209)",
        [OMRON_FINS_ENUMS::CommandCode_MEMORY_AREA_FILE_TRANSER]      = "Memory Area File Transfer (0x220A)",
        [OMRON_FINS_ENUMS::CommandCode_PARAMETER_AREA_FILE_TRANSFER]  = "Parameter Area File Transer (0x220B)",
        [OMRON_FINS_ENUMS::CommandCode_PROGRAM_AREA_FILE_TRANSFER]    = "Program Area File Transfer (0x220C)",
        [OMRON_FINS_ENUMS::CommandCode_FILE_MEMORY_INDEX_READ]        = "File Memory Index Read (0x220F)",
        [OMRON_FINS_ENUMS::CommandCode_FILE_MEMORY_READ]              = "File Memory Read (0x2210)",
        [OMRON_FINS_ENUMS::CommandCode_FILE_MEMORY_WRITE]             = "File Memory Write (0x2211)",

        [OMRON_FINS_ENUMS::CommandCode_FORCED_SET_RESET]              = "Forced Set Reset (0x2301)",
        [OMRON_FINS_ENUMS::CommandCode_FORCED_SET_RESET_CANCEL]       = "Forced Set Reset Cancel (0x2302)",
        [OMRON_FINS_ENUMS::CommandCode_MULTIPOINT_FORCED_STATUS_READ] = "Multipoint Foreced Status Read (0x230A)",

        [OMRON_FINS_ENUMS::CommandCode_NAME_SET]                      = "Name Set (0x2601)",
        [OMRON_FINS_ENUMS::CommandCode_NAME_DELETE]                   = "Name Delete (0x2602)",
        [OMRON_FINS_ENUMS::CommandCode_NAME_READ]                     = "Name Read (0x2603)"
    }&default = "Unknown";

    #
    # Section 2-2 Memory Area Designations
    #
    const MEMORY_AREA = {
        [OMRON_FINS_ENUMS::MemoryArea_CIO_TR_CPU_BUS_LINK_AND_AUXILIARY__BIT_STATUS]                  = "CIO, TR, CPU Bus Link, and Auxiliary: Bit Status (0x00)",
        [OMRON_FINS_ENUMS::MemoryArea_CIO_TR_CPU_BUS_LINK_AND_AUXILIARY__BIT_STATUS_FORCED_STATUS]    = "CIO, TR, CPU Bus Link, and Auxiliary: Bit Status Forced Status (0x40)",
        [OMRON_FINS_ENUMS::MemoryArea_CIO_TR_CPU_BUS_LINK_AND_AUXILIARY__WORD_CONTENTS]               = "CIO, TR, CPU Bus Link, and Auxiliary: Word Contents (0x80)",
        [OMRON_FINS_ENUMS::MemoryArea_CIO_TR_CPU_BUS_LINK_AND_AUXILIARY__WORD_CONTENTS_FORCED_STATUS] = "CIO, TR, CPU Bus Link, and Auxiliary: Word Contents Forced Status (0x0C)",
        [OMRON_FINS_ENUMS::MemoryArea_TIMER_COUNTER__COMPLETION_FLAG_STATUS]                          = "Timer/Counter: Completion Flag Status (0x01)",
        [OMRON_FINS_ENUMS::MemoryArea_TIMER_COUNTER__COMPLETION_FLAG_STATUS_FORCED_STATUS]            = "Timer/Counter: Completion Flag Status Forced Status (0x41)",
        [OMRON_FINS_ENUMS::MemoryArea_TIMER_COUNTER__PV]                                              = "Timer/Counter: PV (0x81)",
        [OMRON_FINS_ENUMS::MemoryArea_DM__WORD_CONTENTS]                                              = "DM: Word Contents (0x82)",

        [OMRON_FINS_ENUMS::MemoryArea_TRANSITION__FLAG_STATUS]                                        = "Transition: Flag Status (0x03)",
        [OMRON_FINS_ENUMS::MemoryArea_TRANSITION__FLAG_STATUS_FORCED_STATUS]                          = "Transition: Flag Status Forced Status (0x43)",
        [OMRON_FINS_ENUMS::MemoryArea_STEP__FLAG_STATUS]                                              = "Step: Flag Status (0x04)",
        [OMRON_FINS_ENUMS::MemoryArea_STEP__STATUS]                                                   = "Step: Status (0x44)",
        [OMRON_FINS_ENUMS::MemoryArea_STEP__STEP_TIME_PV]                                             = "Step: Step Time PV (0x84)",
        [OMRON_FINS_ENUMS::MemoryArea_FORCED_STATUS__BIT_STATUS]                                      = "Forced Status: Bit Status (0x05)",
        [OMRON_FINS_ENUMS::MemoryArea_FORCED_STATUS__WORD_CONTENTS]                                   = "Forced Status: Word Contents (0x85)",
        [OMRON_FINS_ENUMS::MemoryArea_ACTION__FLAG_STATUS]                                            = "Action: Flag Status (0x1b)",
        [OMRON_FINS_ENUMS::MemoryArea_REGISTER__REGISTER_CONTENTS]                                    = "Register: Register Contents (0x9C)",
        [OMRON_FINS_ENUMS::MemoryArea_INTERRUPT__SCHEDULED_INTERRUPT_INTERVAL]                        = "Interrupt: Scheduled Interrupt Interval (0xDD)",
        [OMRON_FINS_ENUMS::MemoryArea_EXPANSION_DM__WORD_CONTENTS_90]                                 = "Expansion DM: Word Contents, bank E0 (0x90)",
        [OMRON_FINS_ENUMS::MemoryArea_EXPANSION_DM__WORD_CONTENTS_91]                                 = "Expansion DM: Word Contents, bank E1 (0x91)",
        [OMRON_FINS_ENUMS::MemoryArea_EXPANSION_DM__WORD_CONTENTS_92]                                 = "Expansion DM: Word Contents, bank E2 (0x92)",
        [OMRON_FINS_ENUMS::MemoryArea_EXPANSION_DM__WORD_CONTENTS_93]                                 = "Expansion DM: Word Contents, bank E3 (0x93)",
        [OMRON_FINS_ENUMS::MemoryArea_EXPANSION_DM__WORD_CONTENTS_94]                                 = "Expansion DM: Word Contents, bank E4 (0x94)",
        [OMRON_FINS_ENUMS::MemoryArea_EXPANSION_DM__WORD_CONTENTS_95]                                 = "Expansion DM: Word Contents, bank E5 (0x95)",
        [OMRON_FINS_ENUMS::MemoryArea_EXPANSION_DM__WORD_CONTENTS_96]                                 = "Expansion DM: Word Contents, bank E6 (0x96)",
        [OMRON_FINS_ENUMS::MemoryArea_EXPANSION_DM__WORD_CONTENTS_97]                                 = "Expansion DM: Word Contents, bank E7 (0x97)",
        [OMRON_FINS_ENUMS::MemoryArea_EXPANSION_DM__WORD_CONTENTS_98]                                 = "Expansion DM: Word Contents, current bank (0x98)",
    }&default = "Unknown";

    #
    # Section 8-3 Response Code
    #
    const RESPONSE_CODE = {
        [OMRON_FINS_ENUMS::ResponseCode_NORMAL_COMPLETION]                                             = "Normal completion (0x0000)",
        [OMRON_FINS_ENUMS::ResponseCode_SERVICE_WAS_INTERRUPTED]                                       = "Service was interrupted (0x0001)",
        [OMRON_FINS_ENUMS::ResponseCode_LOCAL_NODE_NOT_PART_OF_NETWORK]                                = "Local node not part of Network (0x0101)",
        [OMRON_FINS_ENUMS::ResponseCode_TOKEN_TIMEOUT_NODE_NUMBER_TOO_LARGE]                           = "Token time-out, node number to large (0x0102)",
        [OMRON_FINS_ENUMS::ResponseCode_NUMVER_OF_TRANSMIT_RETRIES_EXCEEDED]                           = "Number of transmit retries exceeded (0x0103)",
        [OMRON_FINS_ENUMS::ResponseCode_MAXIMUM_NUMBER_OF_FRAMES_EXCEEDED]                             = "Maximum number of frames exceeded (0x0104)",
        [OMRON_FINS_ENUMS::ResponseCode_NODE_NUMBER_SETTING_ERROR_RANGE]                               = "Node number setting error (range) (0x0105)",
        [OMRON_FINS_ENUMS::ResponseCode_NODE_NUMBER_DUPLICATION_ERROR]                                 = "Node number duplication error (0x0106)",

        [OMRON_FINS_ENUMS::ResponseCode_DESTINATION_NODE_NOT_PART_OF_NETWORK]                          = "Destination node not part of Network (0x0201)",
        [OMRON_FINS_ENUMS::ResponseCode_NO_NODE_WITH_SPECIFIED_NODE_NUMBER]                            = "No node with the specified node number (0x0202)",
        [OMRON_FINS_ENUMS::ResponseCode_THIRD_NODE_NOT_PART_OF_NETWORK_BROADCASTING_WAS_SPECIFIED]     = "Third node not part of Network ",
        [OMRON_FINS_ENUMS::ResponseCode_BUSY_ERROR_DESTINATION_NODE_BUSY]                              = "Busy error, destination node busy (0x0204)",
        [OMRON_FINS_ENUMS::ResponseCode_RESPONSE_TIMEOUT]                                              = "Response time-out (0x0205)",

        [OMRON_FINS_ENUMS::ResponseCode_ERROR_OCCURRED_ERC_INDICATOR_IS_LIT]                           = "Error occurred (0x0301)",
        [OMRON_FINS_ENUMS::ResponseCode_CPU_ERROR_OCCURRED_IN_PC_AT_DETINATION_NODE]                   = "CPU error occurred in the PC at the destination node (0x0302)",
        [OMRON_FINS_ENUMS::ResponseCode_CONTROLLER_ERROR_HAS_PREVENTED_NORMAL_RESPONSE]                = "A controller error has prevented a normal response (0x0303)",
        [OMRON_FINS_ENUMS::ResponseCode_NODE_NUMBER_SETTING_ERROR]                                     = "Node number setting error (0x0304)",

        [OMRON_FINS_ENUMS::ResponseCode_UNDEFINED_COMMAND_USED]                                        = "An undefined command has been used (0x0401)",
        [OMRON_FINS_ENUMS::ResponseCode_SPECIFIED_MODEL_OR_VERSION_WRONG]                              = "Cannot process command because the specified unit model or version is wrong (0x0402)",

        [OMRON_FINS_ENUMS::ResponseCode_DESTINATION_NODE_NUMBER_NOT_SET_IN_ROUTING_TABLE]              = "Destination node number is not set in the routing table (0x0501)",
        [OMRON_FINS_ENUMS::ResponseCode_ROUTING_TABLE_NOT_REGISTERED]                                  = "Routing table isn't registered (0x0502)",
        [OMRON_FINS_ENUMS::ResponseCode_ROUTING_TABLE_ERROR]                                           = "Routing table error (0x0503)",
        [OMRON_FINS_ENUMS::ResponseCode_MAX_RELAY_NODES_EXCEEDED]                                      = "Max relay nodes (2) was exceeded (0x0504)",

        [OMRON_FINS_ENUMS::ResponseCode_COMMAND_LONGER_THAN_MAX_LENGTH]                                = "The command is longer than the max permissible length (0x1001)",
        [OMRON_FINS_ENUMS::ResponseCode_COMMAND_SHORTER_THAN_MIN_LENGTH]                               = "The command is shorter than the min permissible length (0x1002)",
        [OMRON_FINS_ENUMS::ResponseCode_NUMBER_OF_DATA_ITEMS_DIFFERS_FROM_ACTUAL_NUMBER]               = "The designated number of data items differs from the actual number (0x1003)",
        [OMRON_FINS_ENUMS::ResponseCode_INCORRECT_COMMAND_FORMAT]                                      = "An incorrect command format has been used (0x1004)",
        [OMRON_FINS_ENUMS::ResponseCode_INCORRECT_HEADER_USED]                                         = "An incorrect header has been used (0x1005)",

        [OMRON_FINS_ENUMS::ResponseCode_MEMORY_AREA_CODE_INVALID_OR_DM_NOT_AVAILABLE]                  = "Memory area code invalid or DM is not available (0x1101)",
        [OMRON_FINS_ENUMS::ResponseCode_ACCESS_SIZE_IS_WRONG_IN_COMMAND]                               = "Access size is wrong in command (0x1102)",
        [OMRON_FINS_ENUMS::ResponseCode_FIRST_ADDRESS_IN_INACCESSIBLE_AREA]                            = "First address in inaccessible area (0x1103)",
        [OMRON_FINS_ENUMS::ResponseCode_END_SPECIFIED_WORD_RANGE_EXCEEDS_ACCEPTABLE_RANGE]             = "The end of specified word range exceeds acceptable range (0x1104)",
        [OMRON_FINS_ENUMS::ResponseCode_PARAMETER_NON_EXISTENT_PROGRAM_NUMBER]                         = "A non-existent program number (0x1106)",
        [OMRON_FINS_ENUMS::ResponseCode_SIZES_OF_DATA_ITEMS_IN_COMMAND_BLOCK_WRONG]                    = "The size of data items in command block are wrong (0x1109)",
        [OMRON_FINS_ENUMS::ResponseCode_IOM_BREAK_FUNCTION_CANNOT_EXECUTE]                             = "The IOM break function cannot be executed (0x110a)",
        [OMRON_FINS_ENUMS::ResponseCode_RESPONSE_BLOCK_IS_LONGER_THAN_MAX_LENGTH]                      = "The response block is longer than the max length (0x110b)",
        [OMRON_FINS_ENUMS::ResponseCode_INCORRECT_PARAMETER_CODE_SPECIFIED]                            = "An incorrect parameter code has been specified (0x110c)",

        [OMRON_FINS_ENUMS::ResponseCode_READ_DATA_IS_PROTECTED]                                        = "The data is protected (0x2002)",
        [OMRON_FINS_ENUMS::ResponseCode_READ_REGISTERED_TABLE_DOES_NOT_EXIST]                          = "Registered table does not exist (0x2003)",
        [OMRON_FINS_ENUMS::ResponseCode_READ_SEARCH_DATA_DOES_NOT_EXIST]                               = "Search data does not exist (0x2004)",
        [OMRON_FINS_ENUMS::ResponseCode_READ_NON_EXISTENT_PROGRAM_NUMBER]                              = "Non-existent program number (0x2005)",
        [OMRON_FINS_ENUMS::ResponseCode_READ_NON_EXISTENT_FILE]                                        = "Non-existent file (0x2006)",
        [OMRON_FINS_ENUMS::ResponseCode_READ_VERIFICATION_ERROR]                                       = "Verification error (0x2007)",

        [OMRON_FINS_ENUMS::ResponseCode_WRITE_SPECIFIED_AREA_READ_ONLY]                                = "Specified area is read-only (0x2101)",
        [OMRON_FINS_ENUMS::ResponseCode_WRITE_DATA_PROTECTED]                                          = "The data is protected (0x2102)",
        [OMRON_FINS_ENUMS::ResponseCode_WRITE_TOO_MANY_FILES_OPEN]                                     = "Too many files open (0x2103)",
        [OMRON_FINS_ENUMS::ResponseCode_WRITE_NON_EXISTENT_PROGRAM_NUMBER]                             = "Non-existent program number (0x2105)",
        [OMRON_FINS_ENUMS::ResponseCode_WRITE_NON_EXISTENT_FILE]                                       = "Non-existent file (0x2106)",
        [OMRON_FINS_ENUMS::ResponseCode_WRITE_NON_FILE_EXISTS]                                         = "File already exists (0x2107)",
        [OMRON_FINS_ENUMS::ResponseCode_WRITE_DATA_CANNONT_BE_CHANGED]                                 = "Data cannot be changed (0x2108)",

        [OMRON_FINS_ENUMS::ResponseCode_MODE_IS_WRONG_EXECUTING]                                       = "The mode is wrong (executing) (0x2201)",
        [OMRON_FINS_ENUMS::ResponseCode_MODE_IS_WRONG_STOPPED]                                         = "The mode is wrong (stopped) (0x2202)",
        [OMRON_FINS_ENUMS::ResponseCode_PC_IN_PROGRAM_MODE]                                            = "The PC is in the PROGRAM mode (0x2203)",
        [OMRON_FINS_ENUMS::ResponseCode_PC_IN_DEBUG_MODE]                                              = "The PC is in the DEBUG mode (0x2204)",
        [OMRON_FINS_ENUMS::ResponseCode_PC_IN_MONITOR_MODE]                                            = "The PC is in the MONITOR mode (0x2205)",
        [OMRON_FINS_ENUMS::ResponseCode_PC_IN_RUN_MODE]                                                = "The PC is in the RUN mode (0x2206)",
        [OMRON_FINS_ENUMS::ResponseCode_SPECIFIED_NODE_IS_NOT_CONTROL_NODE]                            = "The specified node is not the control node (0x2207)",
        [OMRON_FINS_ENUMS::ResponseCode_MODE_IS_WRONG_STEP_CANNOT_EXECUTE]                             = "The mode is wrong and the step cannot be executed (0x2208)",

        [OMRON_FINS_ENUMS::ResponseCode_FILE_DEVICE_DOES_NOT_EXIST_WHERE_SPECIFIED]                    = "The file device does not exist where specified (0x2301)",
        [OMRON_FINS_ENUMS::ResponseCode_SPECIFIED_MEMORY_DOES_NOT_EXIST]                               = "The specified memory does not exist (0x2302)",
        [OMRON_FINS_ENUMS::ResponseCode_NO_CLOCK_EXISTS]                                               = "No clock exists (0x2303)",
        [OMRON_FINS_ENUMS::ResponseCode_DATA_LINK_TABLE_IS_INCORRECT]                                  = "Data link table is incorrect (0x2401)",

        [OMRON_FINS_ENUMS::ResponseCode_PARITY_CHECKSUM_ERROR_OCCURRED]                                = "Parity / checksum error occurred (0x2502)",
        [OMRON_FINS_ENUMS::ResponseCode_IO_SETTING_ERROR]                                              = "I/O setting error (0x2503)",
        [OMRON_FINS_ENUMS::ResponseCode_TO_MANY_IO_POINTS]                                             = "Too many I/O points (0x2504)",
        [OMRON_FINS_ENUMS::ResponseCode_CPU_BUS_ERROR]                                                 = "CPU bus error (0x2505)",
        [OMRON_FINS_ENUMS::ResponseCode_IO_DUPLICATION_ERROR]                                          = "I/O duplication error (0x2506)",
        [OMRON_FINS_ENUMS::ResponseCode_IO_BUS_ERROR]                                                  = "I/O bus error (0x2507)",
        [OMRON_FINS_ENUMS::ResponseCode_SYSMCA_BUS_2_ERROR]                                            = "SYSMAC BUS/2 error (0x2509)",
        [OMRON_FINS_ENUMS::ResponseCode_SPECIAL_IO_UNIT_ERROR]                                         = "Special I/O Unit error (0x250a)",
        [OMRON_FINS_ENUMS::ResponseCode_DUPLICATION_SYSMAC_BUS_WORD_ALLOCATION]                        = "Duplication in SYSMAC BUS word allocation (0x250d)",
        [OMRON_FINS_ENUMS::ResponseCode_MEMORY_ERROR_HAS_OCCURRED]                                     = "A memory error has occurred (0x250f)",
        [OMRON_FINS_ENUMS::ResponseCode_TERMINATOR_NOT_CONNECTED_IN_SYSMAC_BUS_SYSTEM]                 = "Terminator not connected in SYSMAC BUS system (0x2510)",

        [OMRON_FINS_ENUMS::ResponseCode_SPECIFIED_AREA_NOT_PROTECTED]                                  = "The specified area is not protected (0x2601)",
        [OMRON_FINS_ENUMS::ResponseCode_INCORRECT_PASSWORD_SPECIFIED]                                  = "An incorrect password has been specified (0x2602)",
        [OMRON_FINS_ENUMS::ResponseCode_SPECIFIED_AREA_IS_PROTECTED]                                   = "The specified area is protected (0x2604)",
        [OMRON_FINS_ENUMS::ResponseCode_SERVICE_IS_BEING_EXECUTED]                                     = "The service is being executed (0x2605)",
        [OMRON_FINS_ENUMS::ResponseCode_SERVICE_IS_NOT_BEING_EXECUTED]                                 = "The service is not being executed (0x2606)",
        [OMRON_FINS_ENUMS::ResponseCode_SERVICE_CANNOT_BE_EXECUTED_FROM_LOCAL_NODE]                    = "Service cannot be execute from local node (0x2607)",
        [OMRON_FINS_ENUMS::ResponseCode_SERVICE_CANNOT_BE_EXECUTED_SETTINGS_INCORRECT]                 = "Service cannot be executed settings are incorrect (0x2608)",
        [OMRON_FINS_ENUMS::ResponseCode_SERVICE_CANNOT_BE_EXECUTED_INCORRECT_SETTINGS_IN_COMMAND_DATA] = "Service cannot be executed incorrect settings in command data (0x2609)",
        [OMRON_FINS_ENUMS::ResponseCode_SPECIFIED_ACTION_ALREADY_REGISTERED]                           = "The specified action has already been registered (0x260a)",
        [OMRON_FINS_ENUMS::ResponseCode_CANNOT_CLEAR_ERROR_ERROR_STILL_EXISTS]                         = "Cannot clear error, error still exists (0x260b)",

        [OMRON_FINS_ENUMS::ResponseCode_ACCESS_RIGHT_HELD_BY_ANOTHER_DEVICE]                           = "The access right is held by another device (0x3001)",

        [OMRON_FINS_ENUMS::ResponseCode_COMMAND_ABORTED_WITH_ABORT_COMMAND]                            = "Command aborted with ABORT command (0x4001)",
    }&default = "Unknown";

    #
    # Section 2-23 Clock Read command
    #
    const DAY_OF_WEEK = {
        [OMRON_FINS_ENUMS::DayOfWeek_SUN]  = "Sun (0)",
        [OMRON_FINS_ENUMS::DayOfWeek_MON]  = "Mon (1)",
        [OMRON_FINS_ENUMS::DayOfWeek_TUES] = "Tue (2)",
        [OMRON_FINS_ENUMS::DayOfWeek_WED]  = "Wed (3)",
        [OMRON_FINS_ENUMS::DayOfWeek_THUR] = "Thu (4)",
        [OMRON_FINS_ENUMS::DayOfWeek_FRI]  = "Fri (5)",
        [OMRON_FINS_ENUMS::DayOfWeek_SAT]  = "Sat (6)",
    }&default = "Unknown";

    #
    # Parameter Area Codes
    #
    const PARAMETER_AREA_CODE = {
        [OMRON_FINS_ENUMS::ParameterAreaCode_PC_SETUP]                  = "PC Setup (0x8010)",
        [OMRON_FINS_ENUMS::ParameterAreaCode_PERIPHRAL_DEVICE_SETTINGS] = "Peripheral Device Settings (0x8011)",
        [OMRON_FINS_ENUMS::ParameterAreaCode_IO_TABLE]                  = "I/O Tables (0x8012)",
        [OMRON_FINS_ENUMS::ParameterAreaCode_ROUTING_TABLES]            = "Routing Tables (0x8013)",
        [OMRON_FINS_ENUMS::ParameterAreaCode_CPU_BUS_UNIT_SETTINGS]     = "CPU Bus Unit Settings (0x8002)",
    }&default = "Unknown";

    #
    # Data Link Status
    #
    const DATA_LINK_STATUS = {
        [OMRON_FINS_ENUMS::DataLinkStatus_NORMAL]  = "Normal (0)",
        [OMRON_FINS_ENUMS::DataLinkStatus_WARNING] = "Warning (1)",
    }&default = "Unknown";


    #
    # RunMode 
    #
    const RUN_MODE = {
        [OMRON_FINS_ENUMS::RunMode_DEBUG]   = "Debug (1)",
        [OMRON_FINS_ENUMS::RunMode_MONITOR] = "Monitor (2)",
        [OMRON_FINS_ENUMS::RunMode_RUN]     = "Run (4)",
    }&default = "Not Set: Default to Monitor (2)";

    #
    # Controller Data
    #
    const CONTROLLER_DATA = {
        [OMRON_FINS_ENUMS::ControllerData_CONTROLLER_MODEL] = "Controller model Controller version Area data (00)",
        [OMRON_FINS_ENUMS::ControllerData_CPU_BUS_UNIT]     = "CPU Bus Unit configuration Remote I/O data PC status (01)",
    }&default = "Unknown";

    #
    # Kind of Memory Card
    #
    const KIND_OF_MEMORYCARD = {
        [OMRON_FINS_ENUMS::KindOfMemoryCard_NO_MEMORY_CARD] = "No Memory Card (00)",
        [OMRON_FINS_ENUMS::KindOfMemoryCard_SPRAM]          = "SPRAM (01)",
        [OMRON_FINS_ENUMS::KindOfMemoryCard_EPROM]          = "EPROM (02)",
        [OMRON_FINS_ENUMS::KindOfMemoryCard_EEPROM]         = "EEPROM (03)",
    }&default = "Unknown";

    #
    # Controller Status Read Status
    #
    const CONTROLLER_STATUS_READ_STATUS = {
        [OMRON_FINS_ENUMS::ControllerStatusReadStatus_STOP] = "Stop (Program Not Executing)",
        [OMRON_FINS_ENUMS::ControllerStatusReadStatus_RUN]  = "Run (Program Executing)",
        [OMRON_FINS_ENUMS::ControllerStatusReadStatus_CPU]  = "CPU (On Standby)",
    }&default = "Unknown";

    #
    # Controller Status Read Mode
    #
    const CONTROLLER_STATUS_READ_MODE = {
        [OMRON_FINS_ENUMS::ControllerStatusReadMode_PROGRAM] = "PROGRAM",
        [OMRON_FINS_ENUMS::ControllerStatusReadMode_DEBUG]   = "DEBUG",
        [OMRON_FINS_ENUMS::ControllerStatusReadMode_MONITOR] = "MONITOR",
        [OMRON_FINS_ENUMS::ControllerStatusReadMode_RUN]     = "RUN",
    }&default = "Unknown";

    #
    # Cycle Time Read Parameter
    #
    const CYCLE_TIME_READ_PARAMETER = {
        [OMRON_FINS_ENUMS::CycleTimeReadParameter_INIT] = "Initialize cycle time",
        [OMRON_FINS_ENUMS::CycleTimeReadParameter_READ] = "Read the cycle time",
    }&default = "Unknown";

    #
    # Network Status: In Network
    #
    const IN_NETWORK = {
        [OMRON_FINS_ENUMS::InNetwork_NOT_IN_NETWORK] = "Not in network",
        [OMRON_FINS_ENUMS::InNetwork_IN_NETWORK]     = "In network",
    }&default = "Unknown";

    #
    # Network Status: Exit Status
    #
    const EXIT_STATUS = {
        [OMRON_FINS_ENUMS::ExitStatus_NORMAL] = "Normal exit",
        [OMRON_FINS_ENUMS::ExitStatus_ERROR]  = "Exited due to error",
    }&default = "Unknown";

    #
    # Network Status: Polling
    #
    const POLLING = {
        [OMRON_FINS_ENUMS::Polling_RESPONDS_TO_POLLING]          = "Responds to polling",
        [OMRON_FINS_ENUMS::Polling_DOES_NOT_RESPOND_TO_POLLING]  = "Does not respond to polling",
    }&default = "Unknown";

    #
    # Network Status: Cyclic Operation
    #
    const CYCLIC_OPERATION = {
        [OMRON_FINS_ENUMS::CyclicOperation_STOPPED] = "Stopped",
        [OMRON_FINS_ENUMS::CyclicOperation_ACTIVE]  = "Active",
    }&default = "Unknown";

    #
    # Network Status: Cyclic Transmission Status
    #
    const CYCLIC_TRANSMISSION_STATUS = {
        [OMRON_FINS_ENUMS::CyclicTransmissionStatus_NO_TRANSMISSSION] = "No Transmission",
        [OMRON_FINS_ENUMS::CyclicTransmissionStatus_TRANSMISSION]     = "Transmission",
    }&default = "Unknown";

    #
    # Network Status: Non Fatal Error Status
    #
    const NON_FATAL_ERROR_STATUS = {
        [OMRON_FINS_ENUMS::NonFatalErrorStatus_NON_FATAL_ERROR_OFF] = "Off",
        [OMRON_FINS_ENUMS::NonFatalErrorStatus_NON_FATAL_ERROR_ON]  = "On",
    }&default = "Unknown";

    #
    # Data Link Status Read: Master/Slave
    #
    const DATA_LINK_STATUS_READ_MASTER_SLAVE = {
        [OMRON_FINS_ENUMS::DataLinkStatusReadMasterSlave_SLAVE]  = "Slave",
        [OMRON_FINS_ENUMS::DataLinkStatusReadMasterSlave_MASTER] = "Master",
    }&default = "Unknown";

    #
    # Data Link Status Read: Data Links
    #
    const DATA_LINK_STATUS_READ_DATA_LINKS = {
        [OMRON_FINS_ENUMS::DataLinkStatusReadDataLinks_NOT_ACTIVE] = "Not active",
        [OMRON_FINS_ENUMS::DataLinkStatusReadDataLinks_ACTIVE]     = "Active",
    }&default = "Unknown";

    #
    # Data Link Status Read: Error
    #
    const DATA_LINK_STATUS_READ_ERROR = {
        [OMRON_FINS_ENUMS::DataLinkStatusReadError_NORMAL] = "Normal",
        [OMRON_FINS_ENUMS::DataLinkStatusReadError_ERROR]  = "Error",
    }&default = "Unknown";

    #
    # Data Link Status Read: Mode
    #
    const DATA_LINK_STATUS_READ_MODE = {
        [OMRON_FINS_ENUMS::DataLinkStatusReadMode_STOP] = "Stop",
        [OMRON_FINS_ENUMS::DataLinkStatusReadMode_RUN]  = "Run",
    }&default = "Unknown";

    #
    # Data Link Status Read: Warning
    #
    const DATA_LINK_STATUS_READ_WARNING = {
        [OMRON_FINS_ENUMS::DataLinkStatusReadWarning_NORMAL]  = "Normal",
        [OMRON_FINS_ENUMS::DataLinkStatusReadWarning_WARNING] = "Warning",
    }&default = "Unknown";

    #
    # Message Read, Message Clear, Fal/Fals Read: Message no. parameter
    #
    const MESSAGE_NO_PARAMETER = {
        [OMRON_FINS_ENUMS::MessageNoParameter_MESSAGE_READ]  = "Message Read",
        [OMRON_FINS_ENUMS::MessageNoParameter_MESSAGE_CLEAR] = "Message Clear",
        [OMRON_FINS_ENUMS::MessageNoParameter_FAL_FALS_READ] = "FAL/FALS Read",
    }&default = "Unknown";

    const ENABLED = {
        [OMRON_FINS_ENUMS::Enabled_TRUE]  = "True",
        [OMRON_FINS_ENUMS::Enabled_FALSE] = "False",
    }&default = "Unknown";
}
