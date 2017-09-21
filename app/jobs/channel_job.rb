class ChannelJob < ApplicationJob
  queue_as :default

  def perform(ptype,user)

tags = %w(a acronym b strong i em li ul ol h1 h2 h3 h4 h5 h6 blockquote br cite sub sup ins p)
    ActionCable.server.broadcast user,{
      messages: sanitize(Message.where(channel:ptype),tags: tags, attributes: %w(href title)),
    }
  end
end
