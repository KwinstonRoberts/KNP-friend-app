class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'chat_channel_' + message.channel,
      message: message.body,
      user: message.user_id,
      ptype: User.find(message.user_id).result.image
  end
end
