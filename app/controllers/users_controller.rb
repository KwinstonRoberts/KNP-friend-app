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
     result.rank = '' + r.personality_types.first.personality_type.name + ',' + r.personality_types.first.score.to_s + ',' + r.personality_types[1].personality_type.name + ',' + r.personality_types[1].score.to_s + ',' + r.personality_types[2].personality_type.name + ',' + r.personality_types[2].score.to_s
     result.image = r.personality_types.first.personality_type.badge.image_small
     result.save
     redirect_to profile_index_path
  end
end
