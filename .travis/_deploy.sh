#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_USERNAME}"
cd site
cp -r ../public/* ./
if [ -d "/_posts/" ];then
  git rm -r -f --ignore-unmatch _posts/
fi
ls
NOW=$(date +"%Y-%m-%d %H:%M:%S %z")
git add .
git commit -m "Site updated: ${NOW}" || true
git push -q origin master

cd ../.source

if [ -d .git ]; then
  git push -q origin source
fi

cd ..
