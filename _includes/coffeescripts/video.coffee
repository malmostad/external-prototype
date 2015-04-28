jQuery ($) ->
  $movies = $('section.movies')
  $videoBox = $movies.find('.bc-video-box')

  bcPlayer = false
  bcLoaded = false

  $movies.find(".show-inline").click ->
    $videoId = $(@).attr('data-video-id')
    if bcLoaded
      showVideo $videoId
    else
      $.ajax
        dataType: 'script'
        cache: true
        url: '//players.brightcove.net/745456160001/ac887454-ec8b-4ffc-a530-4af5c1c8e8c7_default/index.min.js'
        success: ->
          bcLoaded = true
          showVideo $videoId
          return
    return

  showVideo = ($videoId) ->
    $('#bc-video').attr('data-video-id', $videoId)
    $videoBox.show()
    console.log $('#bc-video')
    videojs('bc-video', { 'video-id': 4116313334001 }).ready ->
      console.log 'Y'
      bcPlayer = @
      bcPlayer.play()
      window.bc = bcPlayer

      # videoId = $videoId.attr('data-video-id')
      # bcPlayer.play()
      return
    # videojs('bc-video', { 'video-id': 4116313334001, "autoplay": true }, ->
    #   console.log @
    #   # @play()
    # )

  return
