#!/bin/bash

set -e
set -o pipefail

echo 'Installing MkDocs'
pip install mkdocs

echo 'Building the MkDocs site'
./mkdocs gh-deploy --config-file ${GITHUB_WORKSPACE}/${INPUT_SITE_DIR}/mkdocs.yml
