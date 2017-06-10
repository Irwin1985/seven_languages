#!/bin/sh

## A quick hack to deploy a generated website onto a Github repository, to be served as static content by github pages.  This is an example of a very bad shell script.

# This should only be run from the root of the gitbook project
# Replace the remote Github URL to use this on a different project

# Trigger a clean and new build
gitbook build .

# Deploy new build
cd _book && rm -rf .git && git init && git add . && git commit -m "Update from Gitbook - manual script by jr0cket (RJM EDIT)" && git branch -m master gh-pages && git remote add practicalli git@github.com:rmetcalf9/seven_languages.git && git push -f practicalli gh-pages

