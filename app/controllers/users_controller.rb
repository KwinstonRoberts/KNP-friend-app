class UsersController < ApplicationController

  def personality
    traitify = Traitify.new({
      host: "https://api-sandbox.traitify.com",
      version: "v1",
      secret_key: ENV["SECRET_KEY"],
      public_key: ENV["PUBLIC_KEY"]
    })
     user = User.find(session[:user_id])
     puts user
     user.update(personality:params[:id])
     redirect_to profile_index_path
  end

end
