#!/bin/sh

set -e

if [[ -z "${SITE_DIR}" ]]; then
	SITE_DIR=docs/
fi

mkdocs gh-deploy --config-file "${GITHUB_WORKSPACE}/${SITE_DIR}mkdocs.yml"
