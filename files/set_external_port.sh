#!bin/bash

external_port=$(ovs-vsctl list-ifaces br-ex);
/opt/onos/bin/onos "externalportname-set -n ${external_port}"
