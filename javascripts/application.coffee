# Dev: coffee -c -w javascripts/application.coffee
# Before pushing to Github: ./build.sh

$ ->
  # Dummy stuff
  $("section.feedback .trigger").click ->
    $("section.feedback form").show()
    $('html, body').animate
      scrollTop: $("section.feedback").offset().top - 45
    , 100
    $(@).hide()


  $("section.feedback form").submit (event) ->
    event.preventDefault()
    if window.confirm('Vill du se design av svarstexter till användaren?')
      document.location='http://malmostad.github.io/wag/messages/'

  $("article.body-copy form").submit (event) ->
    event.preventDefault()
    if window.confirm('Vill du se design av valideringsmeddelanden?')
      document.location='http://malmostad.github.io/wag/forms/#form-validation'
