#!/bin/bash

set -e
set -o pipefail

if [[ -z "$SITE_DIR" ]]; then
	SITE_DIR=docs
fi

echo 'Installing MkDocs'
pip install mkdocs

echo 'Building the MkDocs site'
cd $SITE_DIR
./mkdocs gh-deploy
