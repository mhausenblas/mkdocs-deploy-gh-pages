#!/bin/bash

set -e

mkdocs gh-deploy --config-file "${GITHUB_WORKSPACE}/${SITE_DIR}mkdocs.yml"
