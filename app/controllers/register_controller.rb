class RegisterController < ApplicationController
  def index
  end

  def log_in(user)
    session[:user_id] = user.id
    redirect_to test_index_path, notice: 'Logged in'
  end

  def create
    @user = User.new(register_params)
    if @user.save
      user = User.where(:email => params[:register][:email].downcase).first
      log_in user
    else
        redirect_to :back, notice: 'couldnt log in'
    end
  end
  private
  def register_params
    params.require(:register).permit(
      :name,
      :email,
      :password
    )
  end
end
