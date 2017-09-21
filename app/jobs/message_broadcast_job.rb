class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'chat_channel_' + message.channel,
      message: sanitize(message.body),
      user: sanitize(message.user_id),
      ptype: User.find(message.user_id).result.image,
      name:  sanitize(User.find(message.user_id).name)
  end
end
