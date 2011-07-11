# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('form#new_poll').submit ->
    $('.alternative', this).each ->
      if $('input[type=text]', this).val() == ''
        # Remove this alternative from the DOM
        $('input[type=text]', this).parent().parent().remove()