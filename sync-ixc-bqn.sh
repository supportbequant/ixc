#!/bin/bash

# Set these variables to the specific values of your deployment
#

# BQN management IP address
BQN_OAM_IP=192.168.0.121
# Name of the REST user in the BQN server
BQN_REST_USER=myuser 
# Password of the REST user in the BQN server
BQN_REST_PW=mypassword
# Comment if dual stack groups are not created
IXC_DUAL_STACK=--dual-stack
# IP address or domain of the UIX server
IXC_SERVER=myserver.ixc.com
# REST API KEY of the IXC server
IXC_KEY=apikey

# Main part, do not modify
#

# Synchronize every 15 minutes and exit rest of the time
[ "`date +%M`" != "00" ] && [ "`date +%M`" != "15" ] && [ "`date +%M`" != "30" ] && [ "`date +%M`" != "45" ] && exit 0

cd /root/ixc
./sync-ixc-bqn -b ${BQN_OAM_IP} ${BQN_REST_USER} ${BQN_REST_PW} ${IXC_DUAL_STACK} --log-file /tmp/sync-ixc-bqn.log ${IXC_SERVER} ${IXC_KEY}