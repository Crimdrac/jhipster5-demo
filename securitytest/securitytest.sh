#!/bin/sh

SCRIPTDIR=$(dirname $0)

cd $SCRIPTDIR

echo Installing NPM in $SCRIPTDIR

npm install

echo Running Scan

./burpctl.js start

echo curl -k -m 180 https://crimdrac-jhipster-5-demo.herokuapp.com

./crawl.js

./burpctl.js crawl

./burpctl.js scan

./burpctl.js report -f report.html

./burpctl.js stop

cd ..
