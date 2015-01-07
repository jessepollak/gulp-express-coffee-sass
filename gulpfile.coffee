gulp = require 'gulp'
browserify = require 'gulp-browserify'
sass = require 'gulp-sass'
prefix = require 'gulp-autoprefixer'
spawn = require('child_process').spawn
server = require('tiny-lr')()
rename = require 'gulp-rename'
changed = require 'gulp-changed'
imagemin = require 'gulp-imagemin'
livereload = require 'gulp-livereload'


gulp.task 'scss', ->
  gulp.src ['./static/src/scss/**/*.scss', '!static/src/scss/foundation/**/*']
  .pipe sass()
  .pipe prefix("> 1%")
  .pipe gulp.dest('./static/dist/css')
  .pipe livereload()

gulp.task 'browserify', ->
  gulp.src './static/src/coffee/app.coffee'
    .pipe browserify
      insertGlobals: true
      debug: true
      transform: ['coffeeify']
      extensions: ['.coffee']
    .pipe rename('app.js')
    .pipe gulp.dest('./static/dist/js')
    .pipe livereload()

gulp.task 'images', ->
  output = './static/dist/img'
  gulp.src './static/src/img/**/*'
    .pipe changed(output)
    .pipe gulp.dest(output)
    .pipe imagemin()
    .pipe gulp.dest(output)

gulp.task 'server', ->
  spawn 'nodemon', ['app.coffee'], stdio: 'inherit'

gulp.task 'watch', ->
  livereload.listen()
  gulp.start 'server'
  gulp.watch './static/src/scss/**/*.scss', ['scss']
  gulp.watch './static/src/coffee/**/*.coffee', ['browserify']
  gulp.watch './static/src/img/**/*', ['images']

# Default task call every tasks created so far.
gulp.task 'build', ['scss', 'browserify', 'images']
gulp.task 'heroku:production', ['build']
gulp.task 'default', ['build']