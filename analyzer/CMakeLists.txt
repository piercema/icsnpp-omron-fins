spicy_add_analyzer(
    NAME omron_fins
    PACKAGE_NAME omron_fins
    SOURCES zeek_omron_fins.spicy  
            omron_fins_functions.spicy  
            omron_fins_functions.cc  
            omron_fins.spicy  
            omron_fins.evt  
            omron_fins_enums.spicy  
            omron_fins_command_code_01.spicy  
            omron_fins_command_code_02.spicy  
            omron_fins_command_code_03.spicy  
            omron_fins_command_code_04.spicy  
            omron_fins_command_code_07.spicy  
            omron_fins_command_code_26.spicy
    SCRIPTS __load__.zeek 
            main.zeek 
            omron_fins_enums.zeek 
            omron_fins_processing.zeek 
            omron_fins_event_processing.zeek 
            omron_fins_types.zeek 
            omron_fins_utilities.zeek 
            omron_fins_command_code_01.zeek 
            omron_fins_command_code_02.zeek 
            omron_fins_command_code_03.zeek 
            omron_fins_command_code_04.zeek 
            omron_fins_command_code_07.zeek  
            omron_fins_command_code_26.zeek
)