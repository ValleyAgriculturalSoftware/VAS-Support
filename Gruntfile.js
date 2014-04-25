module.exports = function(grunt) {

grunt.initConfig({
  sass: {
    dev: {
      options: {
        style: 'expanded',
        loadPath: 'bower_components/bootstrap-sass-official/vendor/assets/stylesheets'
      },
      files: {
        'assets/css/main.min.css': 'scss/main.scss'
      }
    },
    dist: {
      options: {
        style: 'compressed',
        loadPath: 'bower_components/bootstrap-sass-official/vendor/assets/stylesheets'
      },
      files: {
        'assets/css/main.min.css': 'scss/main.scss'
      }
    }
  },
  exec: {
    build: {
      cmd: 'jekyll build'
    },
    serve: {
      cmd: 'jekyll serve --watch'
    },
    deploy: {
      cmd: 's3_website push'
    }
  }
});

grunt.loadNpmTasks('grunt-contrib-uglify');
grunt.loadNpmTasks('grunt-contrib-sass');
grunt.loadNpmTasks('grunt-contrib-copy');
grunt.loadNpmTasks('grunt-exec');

grunt.registerTask('default', [ 'sass:dist', 'exec:build' ]);
grunt.registerTask('test', [ 'sass:dev', 'exec:serve' ]);
grunt.registerTask('deploy', [ 'default', 'exec:deploy' ]);

};