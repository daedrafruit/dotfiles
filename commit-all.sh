#!/bin/bash
BRANCHES=(
	catppuccin95
	poolsuite95
	win95
	neo-catppuccin
)

ORIGINALBRANCH=$(git symbolic-ref --short HEAD)
git commit -m "$1" &&
CHERRYCOMMIT=$(git log -n1 --pretty=format:%H) &&
git push &&

for BRANCH in "${BRANCHES[@]}"; do
    git checkout "$BRANCH" &&
    git pull &&
    git cherry-pick "$CHERRYCOMMIT" &&
    git push &&
    git checkout "$ORIGINALBRANCH"
done
