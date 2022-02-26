#!/bin/sh

set -e

pip install beem unicodecsv pandas bs4 markdown zmail invoke

# install hexo commands
npm install -g hexo-cli
npm install

cd themes/icarus
npm install
cd ../..

