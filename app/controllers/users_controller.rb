class UsersController < ApplicationController

  def personality
    traitify = Traitify.new({
      host: "https://api-sandbox.traitify.com",
      version: "v1",
      secret_key: ENV["SECRET_KEY"],
      public_key: ENV["PUBLIC_KEY"]
    })
     user = User.find(session[:user_id])
     r = traitify.find_results(params[:id])
     top3 = r.personality_types.slice(0,3)
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
     puts Sendbird::UserApi.create({
       user_id: user.id,
       nickname: user.name,
       profile_url: user.result.image,
       issue_assess_token:false
     }).error_message
     Trait.create({
      result_id: result.id,
      name: traitify.raw_personality_traits(params[:id]).first.personality_trait.name
     })
     redirect_to profile_index_path
  end
end
