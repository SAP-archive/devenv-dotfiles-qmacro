command: "sh $HOME/.config/uebersicht/widgets/qmacro.widget/scripts/screens"

refreshFrequency: 3000 # ms

render: (output) ->
  """
    <div class='wmmode'></div>
  """

style: """
  -webkit-font-smoothing: antialiased
  left: 10px
  top: 5px
  overflow: hidden;
  cursor: pointer;
  white-space: nowrap;
  text-overflow: ellipsis;
  color: rgb(176,161,130);
  font-family: "Iosevka Custom", Helvetica;
  font-weight: bold;
  font-size: 18px;
"""

update: (output, domEl) ->

  values = output.split('@')

  mode = values[0].replace /^\s+|\s+$/g, ""
  mode = mode.toUpperCase()
  active = parseInt(values[1])
  total = parseInt(values[2])

  #display the html string
  $(domEl).find('.wmmode').html("<span class='icon'>🖥️</spa><span> #{mode} ")

