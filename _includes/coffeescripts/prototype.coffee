jQuery ($) ->
  $(".feedback form, aside.contact-us form").submit (event) ->
    event.preventDefault()
    if window.confirm('Vill du se design av svarstexter till användaren?')
      document.location='http://malmostad.github.io/wag/messages/'

  $("article.body-copy form").submit (event) ->
    event.preventDefault()
    if window.confirm('Vill du se design av valideringsmeddelanden?')
      document.location='http://malmostad.github.io/wag/forms/#form-validation'

