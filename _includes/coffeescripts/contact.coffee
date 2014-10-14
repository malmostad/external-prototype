jQuery ($) ->
  $("aside.feedback .trigger").click ->
    $(@).hide()
    $("aside.feedback form").slideDown(100)
    $('html, body').animate
      scrollTop: $("aside.feedback").offset().top - 45
    , 100

  $("aside.contact-us .write-to-us").click (event) ->
    event.preventDefault()
    $trigger = $(@)

    # Clone form template and replace the link with it
    $form = $("#contact-us-form-template").clone()
    $form.removeAttr("id")

    # Inject the form after the trigger
    $trigger.hide().after($form.show())

    $form.submit (event) ->
      event.preventDefault()
      $form.find("input[type=submit]").val("Skickar meddelande...").attr("disabled", "disabled")
      $.ajax
        type: "POST"
        url: $trigger.attr('data-action') + "&contactid=#{$trigger.attr('data-contact-id')}"
        data: $form.serialize()
        success: (data) ->
          # Replace the form with the repsonce html
          # This is either
          #   * the success message
          #   * the form w/ validation messages
          $form.replaceWith(data)
        error: (x, y, z) ->
          $form.after('<div class="error">Ett fel inträffade, vänligen försök senare.</div>')

    # Scroll to top of form
    $('html, body').animate
      scrollTop: $form.offset().top - 45
    , 100

  # District selector for Contact us
  if $("aside.contact-us.multi-district").length
    $.cookie.json = true

    # The form
    $chooseDistrict = $("#choose-district")

    # Prevent the form for being submited
    $chooseDistrict.submit -> event.preventDefault()

    # Selectbox
    $selectDistrict = $chooseDistrict.find("select")

    showDistrictContanct = (district) ->
      # Hide all contact cards
      $("aside.contact-us.multi-district .vcard").hide()

      # Show selected contact card
      $("#district-#{district}").show()

      # Set district in select menu
      $selectDistrict.val district

      # Set selected district in cookie
      $.cookie('city-district', district)

    # Select district from cookie on load
    storedDistrict = $.cookie('city-district')
    if !!storedDistrict
      showDistrictContanct storedDistrict
    else
      $("aside.contact-us.multi-district .vcard").hide()

    # District selector is changed by user or address search
    $selectDistrict.change ->
      showDistrictContanct $(@).val()

    # Autocomplete for street addresses
    # Get address suggestions w/ districts from SBK's map service
    $chooseDistrict.find("input").autocomplete
      source: (request, response) ->
        $.ajax
          url: "//xyz.malmo.se/rest/1.0/addresses/"
          dataType: "jsonp"
          data:
            q: request.term
            items: 10
          success: (data) ->
            response $.map data.addresses, (item) ->
              label: "#{item.name} (#{item.towndistrict})"
              district: item.towndistrict
      minLength: 2
      select: (event, ui) ->
        showDistrictContanct ui.item.district.toLowerCase()
