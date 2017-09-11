class ProfileController < ApplicationController
  def index

    @user = User.find(session[:user_id])
    if @user.result
      @traitify = Traitify.new({
        host: "https://api-sandbox.traitify.com",
        version: "v1",
        secret_key: ENV["SECRET_KEY"],
        public_key: ENV["PUBLIC_KEY"]
      })
      @assessment = @traitify.find_results(@user.result.assessment_id)
      @traits = @traitify.raw_personality_traits(@user.result.assessment_id)
      @matches = get_matches
    else
      redirect_to test_index_path
    end
  end
  def get_ptype(res)
    return res.personality_types.first.personality_type.name
  end
  def compare_ptype(res)
    scores = res.rank.split(',')
    ptypes = []
    ptypes[0] = scores.slice(0,2)
    ptypes[1] = scores.slice(2,2)
    ptypes[2] = scores.slice(4,2)

    if scores[0] === get_ptype(@assessment)
      return true
    else
      ptypes.each do |r|
        if(r[0] === get_ptype(@assessment))
          avg = (r[1].to_i + @assessment.personality_types.first.score.to_i)/2
          if avg >= 70
            puts avg
            return true
          else
            return false
          end
        end
      end
    end
  end
  def get_matches
    matches = []
    User.all().each do |match|
      if match.result && match.id != session[:user_id]
        res = match.result
        if compare_ptype(res) === true
            matches.push({name: match.name, personality: res.rank.split(',')[1],result: match.result.image})
        end
      end
    end
    return matches
  end
end
