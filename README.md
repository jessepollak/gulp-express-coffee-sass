# Getting started

```bash
$ git clone https://github.com/jessepollak/gulp-express-coffee-sass.git example
$ cd example
$ git submodule init && git submodule update
$ gulp watch
```
# Heroku deploy

Visit http://localhost:3000 in your browser and you should be good to go.

```bash

$ heroku create
$ heroku config:set BUILDPACK_URL=https://github.com/timdp/heroku-buildpack-nodejs-gulp.git NODE_ENV=production
$ git push heroku master
$ heroku open
```

Your browser should open up the heroku app in a new tab.