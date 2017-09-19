class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from channel_name
    stream_from params[:user]
  end

  def speak(data)
    User.find(params[:user]).messages.create! body: data['message'], channel: data["personality"], name: User.find(params[:user]).name, pImage: User.find(params[:user]).result.image
  end

  def getChannel(data)
    ChannelJob.perform_later(data['ptype'],params[:user])
  end

  def channel_name
    "chat_channel_#{params[:personality]}"
  end
end
