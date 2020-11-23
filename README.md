# GitHub Action to deploy an MkDocs site to GitHub Pages

![GitHub Badge](https://github.com/mhausenblas/mkdocs-deploy-gh-pages/workflows/Build/badge.svg)

This GitHub action will deploy your [MkDocs site](https://www.mkdocs.org/) as [GitHub Pages](https://pages.github.com/), using the [Material](https://github.com/squidfunk/mkdocs-material) theme. It assumes that an `mkdocs.yml` file is present in the top-level directory and the source files (Markdown, etc.) are in the `docs/` folder. You can use [mhausenblas/mkdocs-template](https://github.com/mhausenblas/mkdocs-template) as a template.

> Before you start, make sure you enable GitHub pages via the repo settings.

There are two methods for generating and building your `gh-pages` branch: use either a `PERSONAL_TOKEN` which is loaded with a personal access token containing *repo* privileges, or using `GITHUB_TOKEN` which is a token provided by the GITHUB API with sufficient privileges to perform repo-related operations.

### Building with `PERSONAL_TOKEN`

[Generate a personal access token (scope `repo`)](https://github.com/settings/tokens) and [create a secret](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets) in your repository settings with the name `PERSONAL_TOKEN` and the value of the token generated.

Note that this is an account-level token that has access to update **any** repo owned by you, so be sure to avoid sharing it.

### Building with `GITHUB_TOKEN`

This action supports building and deploying with a `GITHUB_TOKEN`. This token is automatically generated by Github Actions when a workflow runs so it is convenient.

It is more **secure** than a personal token, since you never actually see the value of the `GITHUB_TOKEN` and also the `GITHUB_TOKEN` is scoped to only work for a **single** repo.

Note that for this approach, Github Pages will be enabled in Settings but you will _not_ have a URL displayed or environment tab yet. So change the Github Pages settings to another target and then back again to `gh-pages` (if that is your branch to serve) - then you will see a URL. This step is only needed on the _first_ deploy and no action is needed later on.

### Custom domain for github pages

MkDocs can be deployed to github pages using a custom domain, if you populate a `CUSTOM_DOMAIN` environment variable. This will generate a CNAME file, which will be placed inside the `/docs` folder.

https://www.mkdocs.org/user-guide/deploying-your-docs/#custom-domains

## Example usage

```shell
name: Publish docs via GitHub Pages
on:
  push:
    branches:
      - main

jobs:
  build:
    name: Deploy docs
    runs-on: ubuntu-latest
    steps:
      - name: Checkout main
        uses: actions/checkout@v1

      - name: Deploy docs
        uses: mhausenblas/mkdocs-deploy-gh-pages@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          CUSTOM_DOMAIN: optionaldomain.com
```
