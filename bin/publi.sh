#!/bin/sh
# change the branch names appropriately
set -x

rm -rf _site/
jekyll build
git worktree add -B gh-pages _site origin/gh-pages

cd _site
git add --all
git commit -m "`date`"
git push origin gh-pages
cd ..

git worktree remove _site

