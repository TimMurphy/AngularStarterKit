# Installing & running a local Web Server

Obviously we will need a local web server to run our website. IIS or IIS Express could be used but bulkier than we require. There are couple of lightweight web servers that run on Node.

## Node

[Introduction to Angular Starter Kit](installing-and-running-a-local-web-server "Introduction to Angular Starter Kit") provided instructions to install node. Now we must create and configure Node's `package.json`. `package.json` provides details required to npm to download and install the node packages this project requires.

	npm init

### Adding npm Packages

When installing npm packages use the `--save` option to add them package.json:

	npm install <package name> --save

The `--save-dev` is used with npm packages that are only required for development:

	npm install <package name> --save-dev

## [gulp](http://gulpj[s.com "Gulp")

Gulp is a front-end build system. Gulp will be used for several functions including running our Node webserver.

Interestingly Gulp needs to be installed globally & locally. `InstallDependencies.cmd` has installed Gulp globally. To install Gulp locally:

	npm install gulp --save-dev

### [gulp-webserver](https://www.npmjs.com/package/gulp-webserver "gulp-webserver")

gulp-webserver is a Gulp plugin to run a local webserver with LiveReload. To install gulp-webserver:

	npm install gulp-webserver --save-dev

### gulpfile.js

Now `gulp` & `gulp-webserver` has been installed we need to create `gulpfile.js`. `gulpfile.js` defines the build tasks for our client side application. To follow is the gulp file to run `gulp-webserver`:

    var gulp = require('gulp');
    var webserver = require('gulp-webserver');

    gulp.task('webserver', function() {
      gulp.src('src/website')
        .pipe(webserver({
          livereload: true,
          directoryListing: false,
          open: true
        }));
    });
    
Now we can run the webserver with:

    gulp webserver