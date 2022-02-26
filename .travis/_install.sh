#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

pipenv install

# install hexo commands
npm install -g hexo-cli
npm install

