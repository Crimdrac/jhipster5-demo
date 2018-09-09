#!/bin/bash

SCRIPTDIR=$(dirname $0)

$SCRIPTDIR/burpctl.js start $SCRIPTDIR/config.json

$SCRIPTDIR/burpctl.js crawl $SCRIPTDIR/config.json

$SCRIPTDIR/burpctl.js scan $SCRIPTDIR/config.json

$SCRIPTDIR/burpctl.js report $SCRIPTDIR/config.json -f $SCRIPTDIR/report.html

$SCRIPTDIR/burpctl.js stop $SCRIPTDIR/config.json
