jQuery ($) ->
  $movies = $('section.movies')
  $videoBox = $movies.find('.bc-video-box')
  bcPlayer = false

  $movies.find(".show-inline").click ->
    $videoId = $(@).attr('data-video-id')
    if bcPlayer
      showVideo $videoId
    else
      $.ajax
        dataType: 'script'
        cache: true
        url: '//players.brightcove.net/745456160001/ac887454-ec8b-4ffc-a530-4af5c1c8e8c7_default/index.min.js'
        success: ->
          bcPlayer = videojs('bc-video')
          showVideo $videoId
          return
    return

  showVideo = ($videoId) ->
    $videoBox.slideDown 200
    $('html, body').animate
      scrollTop: $(".movies").offset().top - 45
    , 200

    # FIXME: use $videoId to set video and let BC select media type
    bcPlayer.src([
      {
        "type":"video/mp4",
        "src": "http://brightcove.vo.llnwd.net/v1/uds/pd/745456160001/201503/1629/745456160001_4144200317001_4144112584001.mp4"
      }
    ])
    bcPlayer.play()
    return
  return
