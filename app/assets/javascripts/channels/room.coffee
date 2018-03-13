App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # When we receive a message from the backend we add it to the html
    $messages = $('#messages')
    $('#messages').append data
    $messages.scrollTop $messages.prop('scrollHeight')

  speak: (message) ->
  # call backend speak method
    @perform 'speak', message: message
