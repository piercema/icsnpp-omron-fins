# @TEST-EXEC: touch omron_fins_detail.log
# @TEST-EXEC: touch omron_fins_general.log
# @TEST-EXEC: zeek -C -r ${TRACES}/omron_fins_tcp_commands_responses.pcap ${PACKAGE} %INPUT
# @TEST-EXEC: zeek-cut -n uid omron_fins_link_id < omron_fins_detail.log > log.tmp && mv log.tmp omron_fins_detail.log
# @TEST-EXEC: zeek-cut -n uid omron_fins_link_id < omron_fins_general.log > log.tmp && mv log.tmp omron_fins_general.log
# @TEST-EXEC: btest-diff omron_fins_detail.log
# @TEST-EXEC: btest-diff omron_fins_general.log
#
# @TEST-DOC: Test omron-fins analyzer with omron_fins_tcp_commands_responses.pcap
