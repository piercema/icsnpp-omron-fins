module OMRON_FINS_ENUMS;

export{

    const DATA_TYPE = {
        [OMRON_FINS_ENUMS::DataType_COMMAND]  = "Command",
        [OMRON_FINS_ENUMS::DataType_RESPONSE] = "Response"
    }&default = "Unknown";

    const GATEWAY_USAGE = {
        [OMRON_FINS_ENUMS::GatewayUsage_DONT_USE] = "Don't Use",
        [OMRON_FINS_ENUMS::GatewayUsage_USE]      = "Use"
    }&default = "Unknown";

    const RESPONSE_SETTING = {
        [OMRON_FINS_ENUMS::ResponseSetting_RESPONSE_REQ]     = "Response-Required",
        [OMRON_FINS_ENUMS::ResponseSetting_RESPONSE_NOT_REQ] = "Response-Not-Required"
    }&default = "Unknown";

    const COMMAND = {
        [OMRON_FINS_ENUMS::Command_MEMORY_AREA_READ]              = "Memory Area Read",
        [OMRON_FINS_ENUMS::Command_MEMORY_AREA_WRITE]             = "Memory Area Write",
        [OMRON_FINS_ENUMS::Command_MEMORY_AREA_FILL]              = "Memory Area Fill",
        [OMRON_FINS_ENUMS::Command_MULTIPLE_MEMORY_AREA_READ]     = "Multiple Memory Area Read",
        [OMRON_FINS_ENUMS::Command_MULTIPLE_MEMORY_AREA_TRANSFER] = "Multiple Memory Area Transfer",

        [OMRON_FINS_ENUMS::Command_PARAMETER_AREA_READ]           = "Parameter Area Read",
        [OMRON_FINS_ENUMS::Command_PARAMETER_AREA_WRITE]          = "Parameter Area Write",
        [OMRON_FINS_ENUMS::Command_PARAMETER_AREA_CLEAR]          = "Parameter Area Clear",
        [OMRON_FINS_ENUMS::Command_DATA_LINK_TABLE_READ]          = "Data Link Table Read",
        [OMRON_FINS_ENUMS::Command_DATA_LINK_TABLE_WRITE]         = "Data Link Table Write",

        [OMRON_FINS_ENUMS::Command_PROGRAM_AREA_PROTECT]          = "Program Area Protect",
        [OMRON_FINS_ENUMS::Command_PROGRAM_AREA_PROTECT_CLEAR]    = "Program Area Protect Clear",
        [OMRON_FINS_ENUMS::Command_PROGRAM_AREA_READ]             = "Program Area Read",
        [OMRON_FINS_ENUMS::Command_PROGRAM_AREA_WRITE]            = "Program Area Write",
        [OMRON_FINS_ENUMS::Command_PROGRAM_AREA_CLEAR]            = "Program Area Clear",

        [OMRON_FINS_ENUMS::Command_RUN]                           = "Run",
        [OMRON_FINS_ENUMS::Command_STOP]                          = "Stop",
        [OMRON_FINS_ENUMS::Command_RESET]                         = "Reset",

        [OMRON_FINS_ENUMS::Command_CONTROLLER_DATA_READ]          = "Controller Data Read",
        [OMRON_FINS_ENUMS::Command_CONNECTION_DATA_READ]          = "Connection Data Read",

        [OMRON_FINS_ENUMS::Command_CONTROLLER_STATUS_READ]        = "Controller Status Read",
        [OMRON_FINS_ENUMS::Command_NETWORK_STATUS_READ]           = "Network Status Read" ,
        [OMRON_FINS_ENUMS::Command_DATA_LINK_STATUS_READ]         = "Data Link Status Read",
        [OMRON_FINS_ENUMS::Command_CYCLE_TIME_READ]               = "Cycle Time Read",

        [OMRON_FINS_ENUMS::Command_CLOCK_READ]                    = "Clock Read",
        [OMRON_FINS_ENUMS::Command_CLOCK_WRITE]                   = "Clock Write",

        [OMRON_FINS_ENUMS::Command_LOOP_BACK_TEST]                = "Loop Back Test",
        [OMRON_FINS_ENUMS::Command_BROADCAST_TEST_RESULTS_READ]   = "Broadcast Test Results Read",
        [OMRON_FINS_ENUMS::Command_BROADCAST_TEST_DATA_SEND]      = "Broadcast Test Data Send" ,

        [OMRON_FINS_ENUMS::Command_MESSAGE_READ_MESSAGE_WRITE_FAL_FALS_READ] = "Message Read | Message Clear | FAL/FALS Read",

        [OMRON_FINS_ENUMS::Command_ACCESS_RIGHT_ACQUIRE]          = "Access Right Acquire",
        [OMRON_FINS_ENUMS::Command_ACCESS_RIGHT_FORCED_ACQUIRE]   = "Access Right Forced Acquire",
        [OMRON_FINS_ENUMS::Command_ACCESS_RIGHT_RELEASE]          = "Access Right Release",

        [OMRON_FINS_ENUMS::Command_ERROR_CLEAR]                   = "Error Clear",
        [OMRON_FINS_ENUMS::Command_ERROR_LOG_READ]                = "Error Log Read",
        [OMRON_FINS_ENUMS::Command_ERROR_LOG_CLEAR]               = "Error Log Clear",

        [OMRON_FINS_ENUMS::Command_FILE_NAME_READ]                = "File Name Read",
        [OMRON_FINS_ENUMS::Command_SINGLE_FILE_READ]              = "Single File Name Read",
        [OMRON_FINS_ENUMS::Command_SINGLE_FILE_WRITE]             = "Single File Name Write",
        [OMRON_FINS_ENUMS::Command_MEMORY_CARD_FORMAT]            = "Memory Card Format",
        [OMRON_FINS_ENUMS::Command_FILE_DELETE]                   = "File Delete",
        [OMRON_FINS_ENUMS::Command_VOLUME_LABEL_CREATE_DELETE]    = "Volume Label Create Delete",
        [OMRON_FINS_ENUMS::Command_FILE_COPY]                     = "File Copy",
        [OMRON_FINS_ENUMS::Command_FILE_NAME_CHANGE]              = "File Name Change",
        [OMRON_FINS_ENUMS::Command_FILE_DATA_CHECK]               = "File Data Check",
        [OMRON_FINS_ENUMS::Command_MEMORY_AREA_FILE_TRANSER]      = "Memory Area File Transfer",
        [OMRON_FINS_ENUMS::Command_PARAMETER_AREA_FILE_TRANSFER]  = "Parameter Area File Transer",
        [OMRON_FINS_ENUMS::Command_PROGRAM_AREA_FILE_TRANSFER]    = "Program Area File Transfer",
        [OMRON_FINS_ENUMS::Command_FILE_MEMORY_INDEX_READ]        = "File Memory Index Read",
        [OMRON_FINS_ENUMS::Command_FILE_MEMORY_READ]              = "File Memory Read",
        [OMRON_FINS_ENUMS::Command_FILE_MEMORY_WRITE]             = "File Memory Write",

        [OMRON_FINS_ENUMS::Command_FORCED_SET_RESET]              = "Forced Set Reset",
        [OMRON_FINS_ENUMS::Command_FORCED_SET_RESET_CANCEL]       = "Forced Set Reset Cancel",
        [OMRON_FINS_ENUMS::Command_MULTIPOINT_FORCED_STATUS_READ] = "Multipoint Foreced Status Read",

        [OMRON_FINS_ENUMS::Command_NAME_SET]                      = "Name Set",
        [OMRON_FINS_ENUMS::Command_NAME_DELETE]                   = "Name Delete",
        [OMRON_FINS_ENUMS::Command_NAME_READ]                     = "Name Read"
    }&default = "Unknown";
}
