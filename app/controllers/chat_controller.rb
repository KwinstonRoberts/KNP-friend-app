class ChatController < ApplicationController

  def show
    @channel = Sendbird::OpenChannelApi.create({channel_url: Faker::Number.number(5)})
    puts @channel.body
    puts Sendbird::MessageApi.send('open_channels',@channel.body["channel_url"],{
      message_type: 'MESG',
      user_id: session[:user_id],
      message: 'test message'
    }).body
  end
  def get_message(body)
    return Sendbird::MessageApi.send('open_channels',@channel.body["channel_url"],{
      message_type: 'MESG',
      user_id: session[:user_id],
      message: body
    }).body["message"]
  end
end
