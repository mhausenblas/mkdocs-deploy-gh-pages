#!/bin/bash

set -e

mkdocs gh-deploy --config-file "${GITHUB_WORKSPACE}/mkdocs.yml"
