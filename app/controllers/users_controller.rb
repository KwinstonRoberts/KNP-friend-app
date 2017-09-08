class UsersController < ApplicationController

  def personality
       user = User.find(session[:user_id])
       puts user
       user.update(personality:params[:id])
       redirect_to profile_index_path
  end

end
