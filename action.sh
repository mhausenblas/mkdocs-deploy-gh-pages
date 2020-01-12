#!/bin/bash

set -e

if [ -n "${GITHUB_TOKEN}" ]; then
    print_info "setup with GITHUB_TOKEN"
    remote_repo="https://x-access-token:${GITHUB_TOKEN}@github.com/${PUBLISH_REPOSITORY}.git"

elif [ -n "${PERSONAL_TOKEN}" ]; then
    print_info "setup with PERSONAL_TOKEN"
    remote_repo="https://x-access-token:${PERSONAL_TOKEN}@github.com/${PUBLISH_REPOSITORY}.git"
fi

if ! git config --get user.name; then
    git config --global user.name "${GITHUB_ACTOR}"
fi

if ! git config --get user.email; then
    git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"
fi

git remote rm origin
git remote add origin "${remote_repo}"

mkdocs gh-deploy --config-file "${GITHUB_WORKSPACE}/mkdocs.yml" --force
