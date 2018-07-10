#!/bin/sh
# change the branch names appropriately
set -x

rm -rf _site/
jekyll build
git push origin master
git worktree add -B gh-pages _site origin/gh-pages

cd gh-pages 
git add --all
git commit -m "`date`"
git push origin gh-pages
cd ..

git worktree remove gh-pages

