#!/bin/sh
# change the branch names appropriately
set -x

# Cleanup
git worktree remove -f _site
rm -rf _site/

# Link to branch
git worktree add -B gh-pages _site origin/gh-pages

# Build
jekyll build

# Commit new changes
cd _site
git add --all
git commit -m "`date`"
git push origin gh-pages
cd ..


