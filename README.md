# omron-fins
Repository for initial implementation of a omraon-fins parser

## Compilation
* `cmake -DMAKE_BUILD_TYPE=Debug .`
* `make clean all`

## Executation
* `rm *.log; zeek Spicy::enable_print=T -Cr ../testing/traces/omron.pcap ../omron_fins.hlto ../scripts/*.zeek local `