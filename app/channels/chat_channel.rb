class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from channel_name
  end

  def speak(data)
    User.find(params[:user]).messages.create! body: data['message'], channel: data["personality"]
  end

  def channel_name
    "chat_channel_#{params[:personality]}"
  end
end
