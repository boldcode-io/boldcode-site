#!/bin/sh
# change the branch names appropriately
set -x
set -u
set -e

TARGET=github

# Cleanup
git worktree remove -f _site || true
rm -rf _site/ || true

# Link to branch
git worktree add -B gh-pages _site origin/gh-pages

# Build
JEKYLL_ENV=production bundle exec jekyll build

# Commit new changes
cd _site
git add --all
git commit -m "`date`"
git push $TARGET gh-pages
cd ..


