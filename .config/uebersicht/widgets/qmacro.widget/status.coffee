refreshFrequency: 5000 # ms

render: (output) ->
  """
    <div class="compstatus"></div>
  """

style: """
  right: 30px;
  top: 5px;
  height: 15px;
  color: lightgreen;
  font-family: "Iosevka Custom", Helvetica;
  font-weight: bold;
  font-size: 18px;
  """

update: (output, domEl) ->

  now = new Date().toLocaleTimeString("en", { hour12: false, hour: '2-digit', minute: '2-digit' })
  htmlString = "#{now} <span>&nbsp;&#x1F551</span>"

  $(domEl).find('.compstatus').html(htmlString)
