### Purpose

The Sinatra Skeleton:

1. Provides a foundation for building challenges.
2. Demonstrates a reasonable set of practices around building Sinatra applications.
3. Eases the transition to Rails for Dev Bootcamp students
4. Demonstrates that it is not **required** that all models in `app/models` be
   `ActiveRecord` backed!
5. Gives bare-bones RSpec skeleton wherewith to start building the practice of testing

### Quickstart

1.  `bundle install`
2.  `shotgun config.ru`

### Heroku Warning

If you plan on pushing the skeleton to Heroku, the contents of this skeleton must
be a the "root level" of your local git repository.  For example, imagine I:

`git checkout https://github.com/my-cohort-year/awesome-challenge`

and then `cd awesome-challenge`.

I read the `README.md` and then decide to check out this skeleton:

`git checkout https://github.com/my-cohort-year/sinatra_skeleton_mvc`

While I can then `cd sinatra_skeleton_mvc` and then edit migrations, start
`shotgun`, etc., **WHEN I DEPLOY TO HEROKU THE APP WILL NOT WORK**.

Heroku
[**demands**](https://devcenter.heroku.com/articles/git#tracking-your-app-in-git)
that your application be in the **root** i.e. on the same level as the
`README.md`.

From the root directory you can run `git mv sinatra_skeleton_mvc/* .`
and commit that change.  There are a variety of `shell` and `git` ways to
get the skeleton into the "git root" (the place where a `.git` directory is),
but just make sure your skeleton is "rooted" there if you want your deploys to
Heroku to work.

If you clone the skeleton into an _existing git repo_, make sure to remove the
version control from the skeleton by running `rm -rf sinatra_skeleton_mvc/.git/`
, but remember, `rm -rf` is destructive, so use it with caution.

### Contributing

We would love for you to help make the skeleton more awesome, There are three ways to contribute:

1. Ask for a bug fix or enhancement!
2. Submit a pull request for a bug fix or enhancement!
3. Code review an open pull request!

Be prepared to give and receive specific, actionable, and kind feedback!
