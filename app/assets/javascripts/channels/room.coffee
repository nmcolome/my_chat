
App.room = App.cable.subscriptions.create {channel: "RoomChannel",
                                          private_chat_id: room.data("private_conversation_id")}
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    alert data.content