#!/bin/bash

set -e


if ! git config --get user.name; then
    git config --global user.name "${GITHUB_ACTOR}"
fi

if ! git config --get user.email; then
    git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"
fi

mkdocs gh-deploy --config-file "${GITHUB_WORKSPACE}/mkdocs.yml"
