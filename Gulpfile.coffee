gulp = require 'gulp'
paths =
    coffee: ['src/coffee/*.coffee']
    stylus: ['src/stylus/*.stylus']
    jade  : ['src/views/*.jade']
gulp.task 'coffee', () ->
    gulp.src [
        "src/coffee/*.coffee"
    ]
