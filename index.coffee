command: 'curl -s "https://www.deejay.it/api/broadcast_airplay/?get=now"'

refreshFrequency: '1s'
style: """

// setup
// --------------------------------------------------
display: block
font-family system, -apple-system, "Helvetica Neue"
font-size: 10px
margin = 10px
position: absolute
top: 23px
left: 50%
margin-left: -100px
width: 200px


// variables
// --------------------------------------------------

borderRadius 3px
infoHeight 50px




// styles
// --------------------------------------------------
.container
  text-align: center
  color: #fff
  text-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);

.album-art
    width: 50px
    height: 50px
    margin: auto
    border-radius @borderRadius
    background-image: url(now-playing.widget/lib/default.png)
    background-size: cover
    margin-bottom: 10px
    box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
    
    

.track-info
    width: 100%
    height: @infoHeight
    position: relative
    float: left

.artist-name
    display: block

.track-title
    display: block
    margin: 5px 0

.onair-program
    display: block
    border-top: 1px solid rgba(255,255,255,0.3)
    margin-top: 5px
    padding-top: 5px





"""



render: () -> """
<div class="container">
    <div class="album-art"></div>

    <div class="track-info">
        <div class="artist-name"></div>
        <div class="track-title">title</div>
        <div class="onair-program"></div>
        <div class="console">
        </div>
    </div>
</div>
"""

update: (output, domEl) ->

  div = $(domEl)
  json = JSON.parse(output);
  artist = json.result.artist
  title = json.result.title
  program = json.result.programName
  coverUrl = json.result.coverUrl


  div.find('.artist-name').html(artist)
  div.find('.track-title').html(title)
  div.find('.onair-program').html(program)
  div.find('.album-art').css('background-image', 'url('+coverUrl+')')

