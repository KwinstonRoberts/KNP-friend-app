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
  def get_deck(res)
    res.result.personalities.first.name
  end
  def get_ptype(res)
    res.result.personalities.first.name
  end
  def compare_ptype(res)
    if get_ptype(res) ===  get_ptype(@user)
      return true
    else
      res.result.personalities.each do |r|
        if(r.name === get_ptype(@user))
          avg = (r.score + @user.result.personalities.first.score)/2
          if avg >= 65
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
    User.includes(:result).all().each do |match|
      matches.push(match)
    end
    return matches
  end
end
