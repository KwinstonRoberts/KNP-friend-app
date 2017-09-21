class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'chat_channel_' + message.channel,
      message: sanitize(message.body,tags: tags, attributes: %w(href title)),
      user: sanitize(message.user_id,tags: tags, attributes: %w(href title)),
      ptype: User.find(message.user_id).result.image,
      name:  sanitize(User.find(message.user_id).name,tags: tags, attributes: %w(href title))
  end
end
