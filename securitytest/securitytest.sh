#!/bin/sh

SCRIPTDIR=$(dirname $0)

cd $SCRIPTDIR

echo Installing NPM in $SCRIPTDIR

npm install

echo Running Scan

./burpctl.js start

./burpctl.js crawl

./burpctl.js scan

./burpctl.js report -f report.html

./burpctl.js stop

cd ..
