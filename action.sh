#!/bin/sh

set -e

mkdocs gh-deploy --config-file "${GITHUB_WORKSPACE}/${INPUT_SITE_DIR}/mkdocs.yml"
