gulp = require 'gulp'
gutil = require 'gulp-util'
jade = require 'gulp-jade'
coffee = require 'gulp-coffee'
mainBowerFiles = require 'main-bower-files'

gulp.task 'bower', () ->
  return gulp.src(mainBowerFiles())
  .pipe(gulp.dest('./www/lib'))

gulp.task 'jade', () ->
  gulp.src('./src/**/*.jade')
    .pipe(jade({}))
    .pipe(gulp.dest('./www/'))

gulp.task 'coffee', () ->
  gulp.src('./src/**/*.coffee')
    .pipe(coffee({
      bare: true
    }))
    .on('error', gutil.log)
    .pipe(gulp.dest('./www/'))

gulp.task 'watch', () ->
  gulp.watch './bower_components/**/*', ['bower']
  gulp.watch 'src/**/*.jade', ['jade']
  gulp.watch 'src/**/*.coffee', ['coffee']

gulp.task 'default', ['bower', 'jade', 'coffee']
