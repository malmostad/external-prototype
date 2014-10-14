jQuery ($) ->
  $("aside.feedback .trigger").click ->
    $(@).hide()
    $("aside.feedback form").slideDown(100)
    $('html, body').animate
      scrollTop: $("aside.feedback").offset().top - 45
    , 100

  $("aside.contact-us .write-to-us").click (event) ->
    event.preventDefault()
    $form = $(@).hide().closest(".vcard").find(".write-to-us-form")
    $form.slideDown(100)
    $('html, body').animate
      scrollTop: $form.offset().top - 35
    , 100


  # District selector for Contact us
  if $("aside.contact-us.multi-district").length
    $("aside.contact-us.multi-district .vcard").hide()

    $.cookie.json = true
    # Get selected district
    selectedDistrict = $.cookie('city-district')
    if selectedDistrict
      $("#contact-district").val selectedDistrict
      $("#district-#{selectedDistrict}").show()

    # User selects a district
    $("#contact-district").change ->
      $("aside.contact-us.multi-district .vcard").hide()
      $("#district-#{$(@).val()}").show()

      # Set selected district in cookie
      $.cookie('city-district', $(@).val())
