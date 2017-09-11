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
  def get_ptype(res)
    return res.personality_types.first.personality_type.name
  end
  def compare_ptype(res)
    if res.personality_types.first.personality_type.name === get_ptype(@assessment)
      return true
    else
      res.personality_types.each do |r|
        if(r.score + @assessment.personality_types.first.score)/2 >= 75
          return true
        else
          return false
        end
      end
    end
  end
  def get_matches
    matches = []
    User.all().pluck(:personality,:id,:name).each do |match|
      if match[0] && match[1] != session[:user_id]
        res = @traitify.find_results(match[0])
        if  get_ptype(res) === get_ptype(@assessment) || compare_ptype(res)
            matches.push({name: match[2], personality: res.personality_types.first.personality_type})
        end
      end
    end
    return matches
  end
end
