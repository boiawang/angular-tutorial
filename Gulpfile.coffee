gulp = require 'gulp'
gutil = require 'gulp-util'
jade = require 'gulp-jade'
coffee = require 'gulp-coffee'
karma = require 'gulp-karma'
mainBowerFiles = require 'main-bower-files'

testFiles = [
  'www/lib/angular.js'
  'www/lib/jquery.js',
  'www/lib/jasmine-jquery.js',
  'www/lib/angular-mocks.js'
  
  'www/**/app.js'
  'www/**/*Spec.js'
]

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

gulp.task 'test', () ->
  gulp.src(testFiles)
    .pipe(karma({
      configFile: 'karma.conf.js'
      action: 'run'
    }))
    .on('error', (err) ->
      throw err
    )

gulp.task 'test-watch', () ->
  gulp.src(testFiles)
    .pipe(karma({
      configFile: 'karma.conf.js'
      action: 'watch'
    }))
    .on('error', (err) ->
      throw err
    )

gulp.task 'watch', () ->
  gulp.watch './bower_components/**/*', ['bower']
  gulp.watch 'src/**/*.jade', ['jade']
  gulp.watch 'src/**/*.coffee', ['coffee']
  gulp.watch 'src/**/*.coffee', ['test']

gulp.task 'default', ['bower', 'jade', 'coffee']
