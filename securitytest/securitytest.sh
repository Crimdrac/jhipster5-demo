#!/bin/sh

SCRIPTDIR=$(dirname $0)

cd $SCRIPTDIR

echo Installing NPM in $SCRIPTDIR

echo Running Scan

burpctl start

echo curl -k -m 180 https://crimdrac-jhipster-5-demo.herokuapp.com

./crawl.js

burpctl crawl

burpctl scan

burpctl report -f report.html

burpctl stop

cd ..
