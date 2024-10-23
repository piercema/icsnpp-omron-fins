# ICSNPP-OMRON-FINS
Industrial Control Systems Network Protocol Parsers (ICSNPP) - Omron FINS (Factory Interface Network Service)

## Overview
ICSNPP-Omron-FINS is a Spicy based Zeek plugin for parsing and logging fields within the Omron FINS protocol.

Omron FINS is a protocol created by Omron Corporation for commuincation between Omron programamable logic controllers (PLCs), human-machine interfaces (HMIs), and other devices in industrial automation systems.  It is widely used in manufacturing, process control, and other industrial applications.

The FINS protocol can be addressed to Omron CV-Series PCs (programmable controllers), C-Series PCS, SYSMAC NET Link Units, SYSMAC LINK Support Boards, and CPU Bus Units, such as Personal Computer Units and BASIC Units.  This parser targets the FINS commands available to the CV-Series, C-Series, SYSMAC LINK, and SYSMAC NET PCs transported UDP.

## Installation

### Package Manager

This script is available as a package for [Zeek Package Manager](https://docs.zeek.org/projects/package-manager/en/stable/index.html). It requires [Spicy](https://docs.zeek.org/projects/spicy/en/latest/) and the [Zeek Spicy plugin](https://docs.zeek.org/projects/spicy/en/latest/zeek.html).

```bash
$ zkg refresh
$ zkg install icsnpp-omron-fins
```

If this package is installed from ZKG, it will be added to the available plugins. This can be tested by running `zeek -NN`. If installed correctly, users will see `ANALYZER_SPICY_OMRON_FINS` under the list of `Zeek::Spicy` analyzers.

If users have ZKG configured to load packages (see `@load packages` in the [ZKG Quickstart Guide](https://docs.zeek.org/projects/package-manager/en/stable/quickstart.html)), this plugin and these scripts will automatically be loaded and ready to go.


## Compilation
* `cmake -DMAKE_BUILD_TYPE=Debug .`
* `make clean all`

## Executation
* `rm *.log; zeek Spicy::enable_print=T -Cr ../testing/traces/omron.pcap ../omron_fins.hlto ../scripts/*.zeek local `

## Logging Capabilities

### OMRON FINS Log (omron_fins_general.log)

#### Overview

This log summarizes the header data used for FINS commands and responses.

#### Fields Captured
| Field                       | Type            | Description                                                                        |
| ----------------------------|-----------------|------------------------------------------------------------------------------------|
| ts                          | time            | Timestamp (network time)                                                           |
| uid                         | string          | Uinque ID for this connection                                                      |
| id                          | conn_id         | Default Zeek connection info (IP Addresses, Ports, etc.)                           |
| proto                       | string          | Transport protocol                                                                 |
| omron_fins_link_id          | string          | Link id to link one log file to another                                            |
| icf_gateway                 | string          | Gateway usage (0 don't use; 1 use); set to 1.                                      |
| icf_data_type               | string          | Data type (0: command; 1: response)                                                |
| icf_response_setting        | string          | Response setting (0: response required; 1: response not required)                  |
| gateway_count               | count           | Gateway Count.  Set to 02                                                          |
| destination_network_address | count           | Destination network address                                                        |
| destination_node_number     | count           | Destination node number                                                            |
| destination_unit_address    | count           | Destination unit address                                                           |
| source_network_address      | count           | Source network address                                                             |
| source_node_number          | count           | Source node number                                                                 |
| source_unit_address         | count           | Source unit address                                                                |
| service_id                  | string          | Service ID.  Used to identify the processing generating the transmission           |
| command_code                | string          | The command to execute                                                             |
| response_code               | string          | The response from executing the command                                            |

### OMRON FINS Detail Log (omron_fins_detail.log)

#### Overview

This log captures the detailed data used with the FINS commands and responses.

#### Fields Captured
| Field                              | Type             | Description                                                                        |
| -----------------------------------|------------------|------------------------------------------------------------------------------------|
| ts                                 | time             | Timestamp (network time)                                                           |
| uid                                | string           | Uinque ID for this connection                                                      |
| id                                 | conn_id          | Default Zeek connection info (IP Addresses, Ports, etc.)                           |
| omron_fins_link_id                 | string           | Link id to link one log file to another                                            |
| command_code                       | string           | The command to execute                                                             |
| icf_data_type                      | string           | Data type (0: command; 1: response)                                                |
| memory_area_code                   | string           | The data area to read/write
| beginning_address                  | string           | The address of the first word/bit/flag to read/write
| number_of_items                    | count            | The number of items to read/write
| parameter_area_code                | string           | The parameter area to read/write
| beginning_word                     | string           | The first word to read/write
| number_of_words                    | count            | The number of words to read/write
| last_word_bit                      | count            | Last word bit (0: OFF; 1: ON)
| response_code                      | string           | The response from executing the command
| data                               | string           | The data to be read/written
| year                               | count            | Clock read/write: Year
| month                              | count            | Clock read/write: Month
| date                               | count            | Clock read/write: Date
| hour                               | count            | Clock read/write: Hour
| minute                             | count            | Clock read/write: Minute
| second                             | count            | Clock read/write: Second
| day                                | string           | Clock read/write: Day
| intelligent_id_no                  | string           | Data Link Table Read/Write - designate S (53) and N (4E) in ASCII.
| first_word                         | string           | Data Link Table Read/Write - set to 0000
| read_length                        | string           | Data Link Table Read - regardless of the value set, the data link tables for the number of link nodes that has been set will be read.
| data_length                        | string           | The number of bytes to read/write/transfer/compare
| num_of_link_nodes                  | count            | Data Link Table Read/Write - the number of link nodes
| block_record_data_link_status      | string           | Data Link Table Read - data Link Status (0: normal; 1: warning)
| block_record_num_of_link_nodes     | count            | Data Link Table Read - number of link nodes
| block_record_node_num              | count            | Data Link Table Write - the data link node number 
| block_record_cio_area_first_word   | string           | Data Link Table Read/Write - the first word in a data link in the CIO Area
| block_record_kind_of_dm            | string           | Data Link Table Read/Write - kind of DM; Set to 00
| block_record_dm_area_first_word    | string           | Data Link Table Read/Write - the first word in a data link in the DM Area
| block_record_num_of_total_words    | count            | Data Link Table Read/Write - the total number of words used for data links in the CIO and DM Area
| program_no                         | count            | Set to 0000
| protect_code                       | count            | Set to 00
| password                           | string           | Program Area Protect/Clear - password
| last_word                          | string           | Program Area Protect/Clear - Set to 00000000
| clear_code                         | string           | Program Area Clear - Set to 00
| number_of_bytes                    | count            | The number of data bytes
| run_mode                           | string           | Run mode (00: Program; 01: Debug; 02: Monitor; 04: Run)
| controller_data_to_read            | string           | Controller Data Read - the specified data to read
| controller_model                   | string           | Controller Data Read - model
| controller_version                 | string           | Controller Data Read - version
| for_system_use                     | string           | Controller Data Read - reserved for system use
| program_area_size                  | count            | Controller Data Read - the size of PC Setup and program area
| iom_size                           | count            | Controller Data Read - the size of the area in which bit/word commands can be used
| no_of_dm_words                     | count            | Controller Data Read - total words in the DM area
| timer_size                         | count            | Controller Data Read - maxium no. of timers/counters available
| expansion_dm_size                  | count            | Controller Data Read - banks in the expansion DM area
| no_of_steps_transitions            | count            | Controller Data Read - maximum no. of steps/transitions available
| kind_of_memory_card                | string           | Controller Data Read - kind of memory card (00: No memory card; 01: SPRAM; 02: EPROM; 03: EEPROM)
| memory_card_size                   | count            | Controller Data Read - size of the memory card. K byte (1 word - 2 bytes)
| cpu_bus_unit_config                | vector of count  | Controller Data Read - CPU Bus unit numbers
| no_of_sysmac_bus_master_mounted    | count            | Controller Data Read - no of SYSMAC BUS Masters mounted
| no_of_sysmac_bus2_master_mounted   | count            | Controller Data Read - no of SYSMAC BUS Masters mounted
| peripheral_device_connected        | count            | Controller Data Read - peripheral device connected (0: no; 1: yes)
| built_in_host_interface            | count            | Controller Data Read - with built-in host insterface (always 1)
| no_of_racks_connected              | count            | Controller Data Read - no of Racks connected to the PC
| no_of_units                        | count            | The number of data units read/returned
| unit_address                       | string           | Connection Data Read - the unit address of the first Unit whos model number is to be read.
| model_number                       | string           | Connection Data Read - the model number read
|                                    |                  |
| # Controller Status Data Read details                 |
| controller_status_data_read_status | string           |
| controller_status_data_read_mode   | string           |
| fatal_error                        | vector of string |
| non_fatal_error                    | vector of string |
| message_yes_no                     | vector of string |
| fal_fals_no                        | count            |
| error_message                      | string           |
|                                    |                  |
| # Cycle Time Read                  |                  |
| cycle_time_read_parameter          | string           |
| average_cycle_time                 | double           |
| max_cycle_time                     | double           |
| min_cycle_time                     | double           |
|                                    |                  |
| # Loopback Test                    |                  |
| test_data                          | string           |
|                                    |                  |
| # Broadcast Test Results Read      |                  |
| number_of_receptions               | count            |
|                                    |                  |
| # Message Read | Message Clear | FAL/FALS Read        |
| command                            | string           |
| message_no_0                       | string           |
| message_no_1                       | string           |
| message_no_2                       | string           |
| message_no_3                       | string           |
| message_no_4                       | string           |
| message_no_5                       | string           |
| message_no_6                       | string           |
| message_no_7                       | string           |
| message_0                          | string           |
| message_1                          | string           |
| message_2                          | string           |
| message_3                          | string           |
| message_4                          | string           |
| message_5                          | string           |
| message_6                          | string           |
| message_7                          | string           |
|                                    |                  |
| fal_fals_no_0                      | string           |
| fal_fals_no_1                      | string           |
| fal_fals_no_2                      | string           |
| fal_fals_no_3                      | string           |
| fal_fals_no_4                      | string           |
| fal_fals_no_5                      | string           |
| fal_fals_no_6                      | string           |
| fal_fals_no_7                      | string           |
| fal_fals_no_8                      | string           |
| fal_fals_no_9                      | string           |
| fal_fals_no_10                     | string           |
| fal_fals_no_11                     | string           |
| fal_fals_no_12                     | string           |
| fal_fals_no_13                     | string           |
| fal_fals_0                         | string           |
| fal_fals_1                         | string           |
| fal_fals_2                         | string           |
| fal_fals_3                         | string           |
| fal_fals_4                         | string           |
| fal_fals_5                         | string           |
| fal_fals_6                         | string           |
| fal_fals_7                         | string           |
| fal_fals_8                         | string           |
| fal_fals_9                         | string           |
| fal_fals_10                        | string           |
| fal_fals_11                        | string           |
| fal_fals_12                        | string           |
| fal_fals_13                        | string           |
|                                    |                  |
| # Access Right Acquire             |                  |
| acquire_network_address            | count            |
| acquire_node_number                | count            |
| acquire_unit_address               | count            |
|                                    |                  |
| # Set/Reset details                |                  |
| no_of_bits                         | count            |
| set_reset_specification            | string           |
| bit_flag                           | count            |
|
|