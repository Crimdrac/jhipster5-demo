#!/bin/sh

SCRIPTDIR=$(dirname $0)

cd $SCRIPTDIR

rm report.html

echo Running Scan

burpctl start

./crawl.js

burpctl crawl

burpctl scan

burpctl report -f report.html

burpctl stop

cd ..
