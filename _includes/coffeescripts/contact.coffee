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
      updateVCard $(@).val()

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
              value: item.name
              district: item.towndistrict
      minLength: 2
      select: (event, ui) ->
        district = ui.item.district.toLowerCase()
        $("#contact-district").val(ui.item.district.toLowerCase())
        $("#district-search").val()
        updateVCard district

  updateVCard = (district) ->
    $("aside.contact-us.multi-district .vcard").hide()
    $("#district-#{district}").show()

    # Set selected district in cookie
    $.cookie('city-district', district)
    $("#district-search").val("")
