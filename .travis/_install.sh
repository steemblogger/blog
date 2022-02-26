#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

pip install beem unicodecsv pandas bs4 markdown zmail

# install hexo commands
npm install -g hexo-cli
npm install

