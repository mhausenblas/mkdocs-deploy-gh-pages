# Zuar's Fork of mkdocs-deploy-gh-pages

Forked from https://github.com/mhausenblas/mkdocs-deploy-gh-pages.
See the README there for basic information.

`mkdocs-deploy-gh-pages` is a repo containing a GitHub action that builds documentation
using Material for MkDocs and publishes the HTML content as GitHub pages.  The action is
invoked via a workflow defined in a repo's `.github` directory.

The parent repo was forked and renamed to `zmkdocs-deploy`.  The only change made to the
repos is to use `zmkdocs` Docker image to build content instead of the `mkdocs-material`
image.  Doing this causes documentation to be built with Zuar's customized version of
MkDocs Material.

If you wish to use this in a new GitHub repo, you can create a repo from this template:
https://github.com/zuarbase/zmkdocs-template

Instructions on using the template can be found at:
https://github.com/zuarbase/zmkdocs-template/blob/master/docs/instructions.md
