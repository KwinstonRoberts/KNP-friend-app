# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.destroy_all

user = User.create({
  name: 'kyle roberts',
  email: 'kyle.w.r@hotmail.com',
  password: '351797asd'
})

def do_assessment(user)
  traitify = Traitify.new({
    host: "https://api-sandbox.traitify.com",
    version: "v1",
    secret_key: ENV["SECRET_KEY"],
    public_key: ENV["PUBLIC_KEY"],
    deck_id: 'core'
  })
  assessment = traitify.create_assessment
  slides = traitify.find_slides(assessment.id)
  slides.map! do |slide|
    slide.response = Faker::Boolean.boolean
    slide.time_taken = Faker::Number.number(4)
    slide
  end
  traitify.update_slides(assessment.id, slides)
  r = traitify.find_results(assessment.id)
  result = Result.new
  result.user_id = user.id
  result.assessment_id = assessment.id
  result.rank = '' + r.personality_types.first.personality_type.name + ',' + r.personality_types.first.score.to_s + ',' + r.personality_types[1].personality_type.name + ',' + r.personality_types[1].score.to_s + ',' + r.personality_types[2].personality_type.name + ',' + r.personality_types[2].score.to_s
  result.image = r.personality_types.first.personality_type.badge.image_small
  result.save
  return result.rank
end

50.times do |user|
  user = User.create({
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '2222',
    personality: nil
  })
  puts user.name
  puts do_assessment(user)
end
