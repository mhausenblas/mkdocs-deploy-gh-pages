# GitHub Action to deploy an MkDocs site to GitHub Pages

![GitHub Badge](https://github.com/mhausenblas/mkdocs-deploy-gh-pages/workflows/Build/badge.svg)

This GitHub action will deploy your [MkDocs site](https://www.mkdocs.org/) as [GitHub Pages](https://pages.github.com/), using the [Material](https://github.com/squidfunk/mkdocs-material) theme. It assumes that an `mkdocs.yml` file is present in the top-level directory and the source files (Markdown, etc.) are in the `docs/` folder. You can use [mhausenblas/mkdocs-template](https://github.com/mhausenblas/mkdocs-template) as a template.  
  
> Before you start, make sure you enable GitHub pages via the repo settings.  
  
There are two methods for generating and building your gh-pages branch: use either a PERSONAL_TOKEN which is loaded with a personal access token containing *repo* privileges, or using GITHUB_TOKEN which is a token provided by the GITHUB api with sufficient privileges to perform repo related operations.  
  
It is important to note that GITHUB_TOKEN works only for **private** repositories. The GitHub team is currently investigating solutions to resolve this, but in the meantime a personal access token must be used in order to trigger builds for public repositories.
  
### Building with `PERSONAL_TOKEN`  
[Generate a personal access token (scope `repo`)](https://github.com/settings/tokens) and [create a secret](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets) in your repository settings with the name `PERSONAL_TOKEN` and the value of the token generated.

### Building with `GITHUB_TOKEN`  
This action supports building and deploying with a GITHUB_TOKEN but it has problems deploying to public repositories. In public repositories, your changes will be pushed to the gh-pages branch, but an automatic build will not be performed by GitHub Pages.

### Custom domain for github pages
MkDocs can be deployed to github pages using a custom domain, if you populate a `CUSTOM_DOMAIN` environment variable. This will generate a CNAME file, which will be placed inside the /docs folder.
https://www.mkdocs.org/user-guide/deploying-your-docs/#custom-domains

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
          CUSTOM_DOMAIN: optionaldomain.com
```

