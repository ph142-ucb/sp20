# PH 142

This repo hosts the source files for PH142's Spring 2020 [website](https://ph142-ucb.github.io/sp20/).

This site is built from Kevin Lin's [Just the Class](https://github.com/kevinlin1/just-the-class).

## Getting Started

Getting started with Just the Class is simple.

1. Create a [new repository based on Just the Class](https://github.com/kevinlin1/just-the-class/generate).
1. Configure a [publishing source for GitHub Pages](https://help.github.com/en/articles/configuring-a-publishing-source-for-github-pages). Your course website is now live!
1. Update [`_config.yml`](_config.yml) with your course information.
1. Edit and create `.md` [Markdown files](https://guides.github.com/features/mastering-markdown/) to add your content.

Continue reading to learn how to setup a development environment on your local computer. This allows you to make incremental changes without directly modifying the live website.

### Local development environment

Just the Class is built for [Jekyll](https://jekyllrb.com), a static site generator. View the [quick start guide](https://jekyllrb.com/docs/) for more information. Just the Docs requires no special Jekyll plugins and can run on GitHub Pages' standard Jekyll compiler.

1. Follow the GitHub documentation for [Setting up your GitHub Pages site locally with Jekyll](https://help.github.com/en/articles/setting-up-your-github-pages-site-locally-with-jekyll).
1. Start your local Jekyll server.
```bash
$ bundle exec jekyll serve
```
1. Point your web browser to [http://localhost:4000](http://localhost:4000)
1. Reload your web browser after making a change to preview its effect.

For more information, refer to [Just the Docs](https://pmarsceill.github.io/just-the-docs/).
