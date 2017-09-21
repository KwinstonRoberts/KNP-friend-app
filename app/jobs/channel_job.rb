class ChannelJob < ApplicationJob
  queue_as :default

  def perform(ptype,user)
    ActionCable.server.broadcast user,{
      messages: sanitize(Message.where(channel:ptype)),
    }
  end
end
