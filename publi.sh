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
  echo -e "You have uncommitted changes!\n"
  git status -s
  echo
  echo "Aborted!"
  exit -1
fi

# Fail if there are unpushed changes
# Note that we shouldn't push unpushed changes from this script to make the user
# explicitly aware of the situation. We intentionally avoid magic here.
if [[ -n $(git log origin/jekyll..jekyll) ]]; then
  clear
  echo -e "You have unpushed changes!\n"
  git log origin/jekyll..jekyll
  echo
  echo "Aborted!"
  exit -1
fi

# thanks for current folder name: ${PWD##*/} https://stackoverflow.com/a/1371283/878361
# thanks for alphanumeric radom string: https://gist.github.com/earthgecko/3089509
TEMP_FOLDER_NAME=${PWD##*/}'_'`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1`

# Building the site
# =================
export JEKYLL_ENV=production
bundle exec jekyll build --config _config.yml
unset JEKYLL_ENV

# Now the generated site is under _site folder

mkdir ../$TEMP_FOLDER_NAME
cp -r _site/. ../$TEMP_FOLDER_NAME

git checkout master
echo '• now on master branch'

echo '• git pull'
git pull origin master
echo '✔ git pull'

# remove all files and directories except .git.
# tail removes '.' which cannot be removed and crashes the script
find . | grep -v "\.git" | tail -n +2 | xargs rm -rf

# Use copying instead of moving because it sometimes gives device busy error when moving
echo '• copy generated files from ../$TEMP_FOLDER_NAME'
cp -r ../$TEMP_FOLDER_NAME/. .
echo '✔ generated files are copied'

rm -rf ../$TEMP_FOLDER_NAME
echo "🚮 ../$TEMP_FOLDER_NAME deleted"

rm publi.sh

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

