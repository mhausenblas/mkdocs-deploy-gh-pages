#!/bin/bash

set -e
set -o pipefail

if [[ -n "$TOKEN" ]]; then
	GITHUB_TOKEN=$TOKEN
fi

if [[ -z "$GITHUB_TOKEN" ]]; then
	echo "Need GITHUB_TOKEN environment variable to proceed"
	exit 1
fi

if [[ -z "$TARGET_REPO" ]]; then
	echo "Need TARGET_REPO environment variable to proceed"
	exit 1
fi

if [[ -z "$SITE_DIR" ]]; then
	SITE_DIR=docs
fi

echo 'Installing MkDocs'
pip install mkdocs

echo 'Building the MkDocs site'
cd $SITE_DIR
./mkdocs gh-deploy
