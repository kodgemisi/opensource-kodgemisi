#!/bin/bash

# see: http://stackoverflow.com/a/4346420/878361
set -e

clear

# Fail if executed as root
if [ "$EUID" -eq 0 ]; then
  echo "DO NOT run as root!"
  echo
  echo "Aborted!"
  exit -2
fi

# Fail if there are uncommitted changes
if [[ -n $(git status -s) ]]; then
  echo "You have uncommitted changes!"
  git status -s
  echo
  echo "Aborted!"
  exit -1
fi

# thanks: https://gist.github.com/earthgecko/3089509
TEMP_FOLDER_NAME="opensource.kodgemisi.com_"`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1`

# Building the site
export JEKYLL_ENV=production
bundle exec jekyll build --config _config.yml
unset JEKYLL_ENV

mkdir ../$TEMP_FOLDER_NAME
cp -r _site ../$TEMP_FOLDER_NAME

git checkout master
echo '• now on master branch'

echo '• git pull'
git pull origin master
echo '✔ git pull'

rm -rf _site

echo '• copying generated files from ../$TEMP_FOLDER_NAME'
mv ../$TEMP_FOLDER_NAME/_site .
echo '✔ generated files copied'

rm -rf ../$TEMP_FOLDER_NAME
echo "🚮 ../$TEMP_FOLDER_NAME deleted"

rm _site/publi.sh _site/README.md

echo '• git add'
git add .
echo '✔ git add'

echo '• git commit'
git commit -am 'update content'
echo '✔ git commit'

git status

echo '• git push'
git push origin master
echo '✔ git push'

echo '• returning back to jekyll branch'
git checkout jekyll
echo '✔ on jekyll branch'

echo
echo '✔ Publishing successful!'

