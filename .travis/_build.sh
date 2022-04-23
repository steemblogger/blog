#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_USERNAME}"

git clone --depth 1 --branch master --single-branch https://${GITHUB_PAT}@github.com/${BLOG_REPO}.git site
if [ -d "./site/.source/" ];then
  mkdir .source
  cp -r ./site/.source/* ./.source/
fi

d=`date +%Y-%m-%d`
echo -e "RunTime: $d" >update.txt

invoke blog.build-all -h github --production

# if it's cron job, deploy to netlify in the same time
# [ "${TRAVIS_EVENT_TYPE}" != "cron" ] && exit 0
# pipenv run invoke blog.deploy -h netlify
