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
}
