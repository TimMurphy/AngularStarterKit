// gulp (webserver) - start web application and open browser.
// gulp vet         - validate source code & style.

/*jslint node:true*/
'use strict';

var gulp = require('gulp');
var plugins = require('gulp-load-plugins')();

gulp.task('vet', function () {
    return gulp
        .src([
            './src/**/*.js',
            './*.js'
        ])        
        .pipe(plugins.jscs())
        .pipe(plugins.jshint())
        .pipe(plugins.jshint.reporter('jshint-stylish', {verbose: true}))
        .pipe(plugins.jshint.reporter('fail'));
});

gulp.task('webserver', function () {
    return gulp.src('src/website')
        .pipe(plugins.webserver({
            livereload: true,
            directoryListing: false,
            open: true
        }));
});

gulp.task('default', ['webserver']);

function y() {
    x=1;
}
