# GitHub Action to deploy an MkDocs site to GitHub Pages

![GitHub Badge](https://github.com/mhausenblas/mkdocs-deploy-gh-pages/workflows/Build/badge.svg)

This GitHub action will deploy your [MkDocs site](https://www.mkdocs.org/) as [GitHub Pages](https://pages.github.com/), using the [Metal](https://github.com/squidfunk/mkdocs-material) theme. It assumes that an `mkdocs.yml` file is present in the top-level directory and the source files (Markdown, etc.) are in the `docs/` folder. You can use [mhausenblas/mkdocs-template](https://github.com/mhausenblas/mkdocs-template) as a template.

> Before you start, make sure you enable GitHub pages via the repo settings.

## Example usage

```shell
name: Publish docs via GitHub Pages
on:
  push:
    branches:
      - master

jobs:
  build:
    name: Deploy docs
    runs-on: ubuntu-latest
    steps:
      - name: Checkout master
        uses: actions/checkout@v1

      - name: Deploy docs
        uses: mhausenblas/mkdocs-deploy-gh-pages@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

