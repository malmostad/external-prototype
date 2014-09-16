---
---
$ ->
  # Dummy stuff
  $("aside.feedback .trigger").click ->
    $(@).hide()
    $("aside.feedback form").slideDown(100)
    $('html, body').animate
      scrollTop: $("aside.feedback").offset().top - 45
    , 100

  $("aside.contact-us .write-to-us").click (event) ->
    event.preventDefault()
    $(@).hide()
    $("aside.contact-us form").slideDown(100)
    $('html, body').animate
      scrollTop: $("aside.contact-us form").offset().top - 35
    , 100

  $(".feedback form, aside.contact-us form").submit (event) ->
    event.preventDefault()
    if window.confirm('Vill du se design av svarstexter till användaren?')
      document.location='http://malmostad.github.io/wag/messages/'

  $("article.body-copy form").submit (event) ->
    event.preventDefault()
    if window.confirm('Vill du se design av valideringsmeddelanden?')
      document.location='http://malmostad.github.io/wag/forms/#form-validation'

