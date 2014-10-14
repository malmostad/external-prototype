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

  # District selector for Contact us triggered:
  #   * on page load from cookie
  #   * when user selects from menu
  #   * when user enter an address search
  if $("aside.contact-us.multi-district").length
    $.cookie.json = true
    $contactDistrict = $("#contact-district")

    $("aside.contact-us.multi-district .vcard").hide()

    # District selector is changed by user or address search
    $contactDistrict.change ->
      # Hide all contact cards
      $("aside.contact-us.multi-district .vcard").hide()
      # Show selected districts contact card
      $("#district-#{$(@).val()}").show()

      # Set selected district in cookie
      $.cookie('city-district', $(@).val())

    # Get selected district from cookie if any
    selectedDistrict = $.cookie('city-district')
    if selectedDistrict
      $contactDistrict.val selectedDistrict
      $contactDistrict.change()

    # User types an address and select
    $("#district-search").autocomplete
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
        $contactDistrict.val(ui.item.district.toLowerCase()).change()
