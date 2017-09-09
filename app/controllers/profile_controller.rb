class ProfileController < ApplicationController
  # def index
  #   @assessment =
  #   https://api.traitify.com/v1/assessments/{assessment_id}?data=blend,types,traits,career_matches

  # end
  def index
      @user = User.find(session[:user_id])
      if @user.personality
        traitify = Traitify.new({
          host: "https://api-sandbox.traitify.com",
          version: "v1",
          secret_key: ENV["SECRET_KEY"],
          public_key: ENV["PUBLIC_KEY"]
        })
        @assessments = traitify.find_results(@user.personality)
      else
        redirect_to test_index_path
      end
  end
end
