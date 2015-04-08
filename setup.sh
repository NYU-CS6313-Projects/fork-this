#!/bin/bash

set -eu

for i in `seq 1 25`; do
  if [ $i -ne 4 ]; then
    git remote add "group-${i}" "git@github.com:NYU-CS6313-Projects/sp2015-group${i}.git"
    git checkout master
    sed -i "" "s/TODO point to project gh page/http:\/\/NYU-CS6313-Projects.github.io\/sp2015-group${i}\//g" README.md
    git add README.md
    git commit -m "update gh-pages link"
    git push "group-${i}" master
    git checkout gh-pages
    git merge master
    git push "group-${i}" gh-pages
    git reset --hard HEAD~1
    git checkout master
    git reset --hard HEAD~1
  fi
done
