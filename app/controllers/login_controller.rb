class LoginController < ApplicationController
  def index
    @user = User.new
  end

  def log_in(user)
    session[:user_id] = user.id
    redirect_to test_index_path, notice: 'Logged in'
  end

  def create
    user = User.find_by(email: params[:login][:email].downcase)
    if user && user.authenticate(params[:login][:password])
      log_in user
    else
      redirect_to :back, notice: 'couldnt log in'
    end
  end
end
