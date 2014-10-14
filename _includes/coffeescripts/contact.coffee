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
    $.cookie.json = true
    $chooseDistrict = $("#choose-district")
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

    # Get selected district from cookie if any
    selectedDistrict = $.cookie('city-district')
    if selectedDistrict
      showDistrictContanct selectedDistrict

    # District selector is changed by user or address search
    $selectDistrict.change ->
      showDistrictContanct $(@).val()

    # User types an address
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
