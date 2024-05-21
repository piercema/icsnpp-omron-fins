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
        [OMRON_FINS_ENUMS::DataType_COMMAND]  = "Command",
        [OMRON_FINS_ENUMS::DataType_RESPONSE] = "Response"
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
        [OMRON_FINS_ENUMS::GatewayUsage_DONT_USE] = "Don't Use",
        [OMRON_FINS_ENUMS::GatewayUsage_USE]      = "Use"
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
        [OMRON_FINS_ENUMS::ResponseSetting_RESPONSE_REQ]     = "Response-Required",
        [OMRON_FINS_ENUMS::ResponseSetting_RESPONSE_NOT_REQ] = "Response-Not-Required"
    }&default = "Unknown";

    #
    # Appendix A: FINS Command List
    #
    const COMMAND = {
        [OMRON_FINS_ENUMS::CommandCode_MEMORY_AREA_READ]              = "Memory Area Read",
        [OMRON_FINS_ENUMS::CommandCode_MEMORY_AREA_WRITE]             = "Memory Area Write",
        [OMRON_FINS_ENUMS::CommandCode_MEMORY_AREA_FILL]              = "Memory Area Fill",
        [OMRON_FINS_ENUMS::CommandCode_MULTIPLE_MEMORY_AREA_READ]     = "Multiple Memory Area Read",
        [OMRON_FINS_ENUMS::CommandCode_MULTIPLE_MEMORY_AREA_TRANSFER] = "Multiple Memory Area Transfer",

        [OMRON_FINS_ENUMS::CommandCode_PARAMETER_AREA_READ]           = "Parameter Area Read",
        [OMRON_FINS_ENUMS::CommandCode_PARAMETER_AREA_WRITE]          = "Parameter Area Write",
        [OMRON_FINS_ENUMS::CommandCode_PARAMETER_AREA_CLEAR]          = "Parameter Area Clear",
        [OMRON_FINS_ENUMS::CommandCode_DATA_LINK_TABLE_READ]          = "Data Link Table Read",
        [OMRON_FINS_ENUMS::CommandCode_DATA_LINK_TABLE_WRITE]         = "Data Link Table Write",

        [OMRON_FINS_ENUMS::CommandCode_PROGRAM_AREA_PROTECT]          = "Program Area Protect",
        [OMRON_FINS_ENUMS::CommandCode_PROGRAM_AREA_PROTECT_CLEAR]    = "Program Area Protect Clear",
        [OMRON_FINS_ENUMS::CommandCode_PROGRAM_AREA_READ]             = "Program Area Read",
        [OMRON_FINS_ENUMS::CommandCode_PROGRAM_AREA_WRITE]            = "Program Area Write",
        [OMRON_FINS_ENUMS::CommandCode_PROGRAM_AREA_CLEAR]            = "Program Area Clear",

        [OMRON_FINS_ENUMS::CommandCode_RUN]                           = "Run",
        [OMRON_FINS_ENUMS::CommandCode_STOP]                          = "Stop",
        [OMRON_FINS_ENUMS::CommandCode_RESET]                         = "Reset",

        [OMRON_FINS_ENUMS::CommandCode_CONTROLLER_DATA_READ]          = "Controller Data Read",
        [OMRON_FINS_ENUMS::CommandCode_CONNECTION_DATA_READ]          = "Connection Data Read",

        [OMRON_FINS_ENUMS::CommandCode_CONTROLLER_STATUS_READ]        = "Controller Status Read",
        [OMRON_FINS_ENUMS::CommandCode_NETWORK_STATUS_READ]           = "Network Status Read" ,
        [OMRON_FINS_ENUMS::CommandCode_DATA_LINK_STATUS_READ]         = "Data Link Status Read",
        [OMRON_FINS_ENUMS::CommandCode_CYCLE_TIME_READ]               = "Cycle Time Read",

        [OMRON_FINS_ENUMS::CommandCode_CLOCK_READ]                    = "Clock Read",
        [OMRON_FINS_ENUMS::CommandCode_CLOCK_WRITE]                   = "Clock Write",

        [OMRON_FINS_ENUMS::CommandCode_LOOP_BACK_TEST]                = "Loop Back Test",
        [OMRON_FINS_ENUMS::CommandCode_BROADCAST_TEST_RESULTS_READ]   = "Broadcast Test Results Read",
        [OMRON_FINS_ENUMS::CommandCode_BROADCAST_TEST_DATA_SEND]      = "Broadcast Test Data Send" ,

        [OMRON_FINS_ENUMS::CommandCode_MESSAGE_READ_MESSAGE_WRITE_FAL_FALS_READ] = "Message Read | Message Clear | FAL/FALS Read",

        [OMRON_FINS_ENUMS::CommandCode_ACCESS_RIGHT_ACQUIRE]          = "Access Right Acquire",
        [OMRON_FINS_ENUMS::CommandCode_ACCESS_RIGHT_FORCED_ACQUIRE]   = "Access Right Forced Acquire",
        [OMRON_FINS_ENUMS::CommandCode_ACCESS_RIGHT_RELEASE]          = "Access Right Release",

        [OMRON_FINS_ENUMS::CommandCode_ERROR_CLEAR]                   = "Error Clear",
        [OMRON_FINS_ENUMS::CommandCode_ERROR_LOG_READ]                = "Error Log Read",
        [OMRON_FINS_ENUMS::CommandCode_ERROR_LOG_CLEAR]               = "Error Log Clear",

        [OMRON_FINS_ENUMS::CommandCode_FILE_NAME_READ]                = "File Name Read",
        [OMRON_FINS_ENUMS::CommandCode_SINGLE_FILE_READ]              = "Single File Name Read",
        [OMRON_FINS_ENUMS::CommandCode_SINGLE_FILE_WRITE]             = "Single File Name Write",
        [OMRON_FINS_ENUMS::CommandCode_MEMORY_CARD_FORMAT]            = "Memory Card Format",
        [OMRON_FINS_ENUMS::CommandCode_FILE_DELETE]                   = "File Delete",
        [OMRON_FINS_ENUMS::CommandCode_VOLUME_LABEL_CREATE_DELETE]    = "Volume Label Create Delete",
        [OMRON_FINS_ENUMS::CommandCode_FILE_COPY]                     = "File Copy",
        [OMRON_FINS_ENUMS::CommandCode_FILE_NAME_CHANGE]              = "File Name Change",
        [OMRON_FINS_ENUMS::CommandCode_FILE_DATA_CHECK]               = "File Data Check",
        [OMRON_FINS_ENUMS::CommandCode_MEMORY_AREA_FILE_TRANSER]      = "Memory Area File Transfer",
        [OMRON_FINS_ENUMS::CommandCode_PARAMETER_AREA_FILE_TRANSFER]  = "Parameter Area File Transer",
        [OMRON_FINS_ENUMS::CommandCode_PROGRAM_AREA_FILE_TRANSFER]    = "Program Area File Transfer",
        [OMRON_FINS_ENUMS::CommandCode_FILE_MEMORY_INDEX_READ]        = "File Memory Index Read",
        [OMRON_FINS_ENUMS::CommandCode_FILE_MEMORY_READ]              = "File Memory Read",
        [OMRON_FINS_ENUMS::CommandCode_FILE_MEMORY_WRITE]             = "File Memory Write",

        [OMRON_FINS_ENUMS::CommandCode_FORCED_SET_RESET]              = "Forced Set Reset",
        [OMRON_FINS_ENUMS::CommandCode_FORCED_SET_RESET_CANCEL]       = "Forced Set Reset Cancel",
        [OMRON_FINS_ENUMS::CommandCode_MULTIPOINT_FORCED_STATUS_READ] = "Multipoint Foreced Status Read",

        [OMRON_FINS_ENUMS::CommandCode_NAME_SET]                      = "Name Set",
        [OMRON_FINS_ENUMS::CommandCode_NAME_DELETE]                   = "Name Delete",
        [OMRON_FINS_ENUMS::CommandCode_NAME_READ]                     = "Name Read"
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
}
