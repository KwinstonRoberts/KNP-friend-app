class UsersController < ApplicationController

  def personality
       user = User.find(session[:user_id])
       puts user
       user.update(personality:params[:id])
       redirect_to :root
  end

end