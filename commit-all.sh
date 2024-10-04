#!/bin/bash
BRANCHES=(
	catppuccin95
	poolsuite95
	win95
)

ORIGINALBRANCH=$(git symbolic-ref --short HEAD)
git commit -m "$1" &&
git push &&
CHERRYCOMMIT=$(git log -n1 --pretty=format:%H) &&

for BRANCH in "${BRANCHES[@]}"; do
    git stash &&
    git checkout "$BRANCH" &&
    git cherry-pick "$CHERRYCOMMIT" &&
		git push &&
    git checkout "$ORIGINALBRANCH" &&
    git stash pop
done
