#!/bin/bash

rand_num=$RANDOM

echo Checkout...
git checkout main

echo Pull...
git pull

echo New branch...
git checkout -b feat/new-branch-${rand_num}

echo Updating...
echo Some text ${rand_num} >> ./docs/index.md

echo Adding any changes in the project...
git add .

echo Adding commit message...
git commit -m "feat: update index.md"

echo Pushing changes to remote branch... 
git push origin feat/new-branch-$rand_num

echo Create a new PR
gh pr create --title "feat: add new doc" --body "Everything works again"

echo Making a squash/merge...
gh pr merge -t 'feat: add new doc' --body 'merge pr' --squash --delete-branch

