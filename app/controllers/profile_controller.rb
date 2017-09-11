class ProfileController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    if @user.personality
      @traitify = Traitify.new({
        host: "https://api-sandbox.traitify.com",
        version: "v1",
        secret_key: ENV["SECRET_KEY"],
        public_key: ENV["PUBLIC_KEY"]
      })
      @assessment = @traitify.find_results(@user.personality)
      @traits = @traitify.raw_personality_traits(@user.personality)
      @matches = get_matches
    else
      redirect_to test_index_path
    end
  end
  private
  def get_matches
    matches = []
    User.all().each do |match|
      if match.personality
        res = @traitify.find_results(match.personality)
        if res.personality_types.first.personality_type.name === @assessment.personality_types.first.personality_type.name
            matches.push({name: match.name, personality: res.personality_types.first.personality_type, compliments: res.personality_blend.compliments})
        end
      end
    end
    return matches
  end
end
