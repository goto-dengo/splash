module.exports = (grunt) ->

  path = require('path')
  exec = require('child_process').exec
  tasks = ['coffee', 'sass', 'cssmin', 'uglify']

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-cssmin')
  grunt.loadNpmTasks('grunt-contrib-sass')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-uglify')

  grunt.initConfig

    pkg: '<json:package.json>'

    coffee:
      all:
        expand: true
        flatten: true
        cwd: 'coffee'
        src: ['*.coffee']
        dest: 'js/'
        ext: '.js'

    sass:
      all:
        files: [{
          expand: true
          cwd: 'sass'
          src: ['*.sass']
          dest: 'css'
          ext: '.css'
        }]

    cssmin:
      all:
        files:
          'styles.css': [
            'css/foundation.css'
            'css/font-awesome.css'
            'css/main.css'
          ]

    uglify:
      all:
        files:
          'scripts.js': [
            'js/jquery.js'
            'js/scroll_to.js'
            'js/main.js'
          ]

    watch:
      app:
        files: ['./sass/*.sass', './coffee/*.coffee']
        tasks: tasks

  grunt.registerTask 'default', tasks
