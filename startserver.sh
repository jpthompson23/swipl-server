#!/bin/sh

PL_PORT=5000
PL_PASSWORD="xyzzy"
PL_LOGFILE="5000.log"

swipl -f swipl-server.pl -g "start_server($PL_PORT, $PL_PASSWORD, '$PL_LOGFILE')" &
