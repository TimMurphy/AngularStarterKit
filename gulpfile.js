// gulp (webserver) - start web application and open browser
// gulp todo        - todo

/*jslint node:true*/
'use strict';

var gulp = require('gulp');
var plugins = require('gulp-load-plugins')();

gulp.task('webserver', function () {
    gulp.src('src/website')
        .pipe(plugins.webserver({
            livereload: true,
            directoryListing: false,
            open: true
        }));
});

gulp.task('default', ['webserver']);