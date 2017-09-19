class ProfileController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    if @user.result
      @traitify = Traitify.new
      @assessment = @traitify.find_results(@user.result.assessment_id)
      @traits = @user.result.traits.first
      @matches = User.all()
      @activities = Activity.all()
    else
      redirect_to test_index_path
    end
  end
end
