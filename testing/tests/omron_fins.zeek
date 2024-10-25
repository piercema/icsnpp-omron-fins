# @TEST-EXEC: touch omron_fins_data_link_status_read.log
# @TEST-EXEC: touch omron_fins_detail.log
# @TEST-EXEC: touch omron_fins_error.log
# @TEST-EXEC: touch omron_fins_file.log
# @TEST-EXEC: touch omron_fins_general.log
# @TEST-EXEC: touch omron_fins_network_status_read.log
# @TEST-EXEC: zeek -C -r ${TRACES}/omron.pcap ${PACKAGE} %INPUT
# @TEST-EXEC: zeek-cut -n uid omron_fins_link_id < omron_fins_data_link_status_read.log > log.tmp && mv log.tmp omron_fins_data_link_status_read.log
# @TEST-EXEC: zeek-cut -n uid omron_fins_link_id < omron_fins_detail.log > log.tmp && mv log.tmp omron_fins_detail.log
# @TEST-EXEC: zeek-cut -n uid omron_fins_link_id < omron_fins_error.log > log.tmp && mv log.tmp omron_fins_error.log
# @TEST-EXEC: zeek-cut -n uid omron_fins_link_id < omron_fins_file.log > log.tmp && mv log.tmp omron_fins_file.log
# @TEST-EXEC: zeek-cut -n uid omron_fins_link_id < omron_fins_general.log > log.tmp && mv log.tmp omron_fins_general.log
# @TEST-EXEC: zeek-cut -n uid omron_fins_link_id < omron_fins_network_status_read.log > log.tmp && mv log.tmp omron_fins_network_status_read.log
# @TEST-EXEC: btest-diff omron_fins_data_link_status_read.log
# @TEST-EXEC: btest-diff omron_fins_detail.log
# @TEST-EXEC: btest-diff omron_fins_error.log
# @TEST-EXEC: btest-diff omron_fins_file.log
# @TEST-EXEC: btest-diff omron_fins_general.log
# @TEST-EXEC: btest-diff omron_fins_network_status_read.log
#
# @TEST-DOC: Test omron-fins analyzer with omron.pcap
