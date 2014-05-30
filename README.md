# Heroku deploy

```bash

$ heroku create
$ heroku config:set BUILDPACK_URL=https://github.com/timdp/heroku-buildpack-nodejs-gulp.git
$ heroku config:set NODE_ENV=production
$ git push heroku master