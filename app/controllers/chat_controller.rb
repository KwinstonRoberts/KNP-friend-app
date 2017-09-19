class ChatController < ApplicationController
  def index
    @personalities = ['Thoughtful','Rational','Reliable', 'Mellow', 'Social','Charismatic','Adventurous']
    @userPtype = User.find(session[:user_id]).result.personalities.first
    
  end
end
