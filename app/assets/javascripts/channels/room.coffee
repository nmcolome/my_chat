$(document).on 'turbolinks:load', ->
  private_chat_id = $("#message_private_chat_id").val()

  App.room = App.cable.subscriptions.create {
    channel: "RoomChannel"
    private_chat_id: private_chat_id
  },

  connected: ->
  disconnected: ->

  received: (data) ->
    $('#messages-table').append(
      """
      <div class="message">
        <p>#{data.username}<br>
        #{data.content}</p>
      </div>
      """
    )
