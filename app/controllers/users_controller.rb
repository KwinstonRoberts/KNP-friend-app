class UsersController < ApplicationController

  def personality
    traitify = Traitify.new
    user = User.find(session[:user_id])
    user.update({personality:r.personality_types.first.personality_type.name})
    user.save
    r = traitify.find_results(params[:id])
    result = Result.new
    result.user_id = user.id
    result.assessment_id = params[:id]
    result.image = r.personality_types.first.personality_type.badge.image_small
    result.save
    r.personality_types.each do |ptype|
    Personality.create({
     result_id: result.id,
     name: ptype.personality_type.name,
     score: ptype.score,
    })
    end
    Trait.create({
      result_id: result.id,
      name: traitify.raw_personality_traits(params[:id]).first.personality_trait.name
    })
    redirect_to profile_index_path
  end
end
