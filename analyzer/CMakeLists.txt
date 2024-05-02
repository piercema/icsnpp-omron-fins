spicy_add_analyzer(
    NAME omron_fins
    PACKAGE_NAME omron_fins
    SOURCES zeek_omron_fins.spicy omron_fins_conversion.spicy omron_fins_conversion.cc omron_fins.spicy omron_fins.evt
    SCRIPTS __load__.zeek main.zeek omron_fins_types.zeek omron_fins_processing.zeek
)
