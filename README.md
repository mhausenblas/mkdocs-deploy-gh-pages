# GitHub Action to deploy an MkDocs site to GitHub Pages

![GitHub Badge](https://github.com/mhausenblas/mkdocs-deploy-gh-pages/workflows/Build/badge.svg)

This GitHub action will deploy your [MkDocs site](https://www.mkdocs.org/) as [GitHub Pages](https://pages.github.com/).

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

