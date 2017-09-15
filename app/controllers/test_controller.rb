class TestController < ApplicationController
  def index
    traitify = Traitify.new
    user = User.find(session[:user_id])
    if(!user.result)
      @assessment = traitify.create_assessment(deck_id: 'core')
    else
      redirect_to profile_index_path
    end
  end
end
