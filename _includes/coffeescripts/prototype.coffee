jQuery ($) ->
  $("article.body-copy form").submit (event) ->
    event.preventDefault()
    if window.confirm('Vill du se design av valideringsmeddelanden?')
      document.location='https://malmostad.github.io/wag-v4/forms_buttons_and_messages/#form-validation'
