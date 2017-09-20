class ProfileController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    if @user.result
      @traitify = Traitify.new
      @assessment = @traitify.find_results(@user.result.assessment_id)
      @traits = @user.result.traits.first
      @matches = get_matches
      @activities = Activity.all()
      @user = User.find(session[:user_id])
    else
      redirect_to test_index_path
    end
  end
  
  def get_matches
    return User.includes(result: [:personalities,:traits]).where('traits.name=? or personality=?',@traits.name, @user.result.personalities.first.name).references(:personalities,:traits)
  end
end
