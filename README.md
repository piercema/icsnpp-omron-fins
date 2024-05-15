# ICSNPP-OMRON-FINS
Industrial Control Systems Network Protocol Parsers (ICSNPP) - Omron FINS (Factory Interface Network Service)

## Overview
ICSNPP-Omron-FINS is a Spicy based Zeek plugin for parsing and logging fields within the Omron FINS protocol.

Omron FINS is a protocol created by Omron Corporation for commuincation between Omron programamable logic controllers (PLCs), human-machine interfaces (HMIs), and other devices in industrial automation systems.  It is widely used in manufacturing, process control, and other industrial applications.

The FINS protocol can be addressed to Omron CV-Series PCs (programmable controllers), C-Series PCS, SYSMAC NET Link Units, SYSMAC LINK Support Boards, and CPU Bus Units, such as Personal Computer Units and BASIC Units.  This parser targets the FINS commands available to the CV-Series PCs.

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