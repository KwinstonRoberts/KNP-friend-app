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

activities_list = [
  {name: 'Hiking', personality_type: 'Adventurous'},
  {name: 'Camping', personality_type: 'Adventurous'},
  {name: 'Skydiving', personality_type: 'Adventurous'},
  {name: 'Backpacking', personality_type: 'Adventurous'},
  {name: 'CN Tower - Edge Walk', personality_type: 'Adventurous'},
  {name: 'Rafting', personality_type: 'Adventurous'},
  {name: 'Ziplining', personality_type: 'Adventurous'},
  {name: 'Bungy jumping', personality_type: 'Adventurous'},
  {name: 'Dogsledding', personality_type: 'Adventurous'},
  {name: 'Pair-programming', personality_type: 'Adventurous'},
  {name: 'Improv Class', personality_type: 'Charismatic'},
  {name: 'Stand-up Comedy', personality_type: 'Charismatic'},
  {name: 'Going out for drinks', personality_type: 'Charismatic'},
  {name: 'Attending a party', personality_type: 'Charismatic'},
  {name: 'Having a deep conversation', personality_type: 'Charismatic'},
  {name: 'Team Sports (eg. Hockey, Basketball)', personality_type: 'Charismatic'},
  {name: 'Hosting a BBQ', personality_type: 'Charismatic'},
  {name: 'Ballroom Dancing', personality_type: 'Charismatic'},
  {name: 'Going to concerts', personality_type: 'Charismatic'},
  {name: 'Pair-programming', personality_type: 'Charismatic'},
  {name: 'Going to a spa', personality_type: 'Mellow'},
  {name: 'Going to the beach', personality_type: 'Mellow'},
  {name: 'Board Games', personality_type: 'Mellow'},
  {name: 'Ballroom Dancing', personality_type: 'Mellow'},
  {name: 'Chatting over a cup of tea', personality_type: 'Mellow'},
  {name: 'Having a deep conversation', personality_type: 'Mellow'},
  {name: 'Walking in a park', personality_type: 'Mellow'},
  {name: 'Paint night', personality_type: 'Mellow'},
  {name: 'Jogging', personality_type: 'Mellow'},
  {name: 'Pair-programming', personality_type: 'Mellow'},
  {name: 'Going to the gym', personality_type: 'Rational'},
  {name: 'Croassword puzzles', personality_type: 'Rational'},
  {name: 'Card Games (poker)', personality_type: 'Rational'},
  {name: 'Bookclub', personality_type: 'Rational'},
  {name: 'Going to a movie theatre', personality_type: 'Rational'},
  {name: 'Having a deep conversation', personality_type: 'Rational'},
  {name: 'Watching Documentaries', personality_type: 'Rational'},
  {name: 'Chess', personality_type: 'Rational'},
  {name: 'Jogging', personality_type: 'Rational'},
  {name: 'Pair-programming', personality_type: 'Rational'},
  {name: 'Going to the gym', personality_type: 'Reliable'},
  {name: 'Cleaning the surroundings (home, car)', personality_type: 'Reliable'},
  {name: 'Long-distance running', personality_type: 'Reliable'},
  {name: 'Going to concerts', personality_type: 'Reliable'},
  {name: 'Bookclub', personality_type: 'Reliable'},
  {name: 'Woodwork workshop', personality_type: 'Reliable'},
  {name: 'Racquet sports (Tennis, Squash, Badminton)', personality_type: 'Reliable'},
  {name: 'Team sports (eg. Hockey, Basketball)', personality_type: 'Reliable'},
  {name: 'Cooking class', personality_type: 'Reliable'},
  {name: 'Pair-programming', personality_type: 'Reliable'},
  {name: 'Going to concerts', personality_type: 'Social'},
  {name: 'Team Sports (eg. Hockey, Basketball)', personality_type: 'Social'},
  {name: 'Going to the beach', personality_type: 'Social'},
  {name: 'Live sport events', personality_type: 'Social'},
  {name: 'Board Games', personality_type: 'Social'},
  {name: 'Shopping', personality_type: 'Social'},
  {name: 'Stand-up comedy', personality_type: 'Social'},
  {name: 'Hosting a dinner party', personality_type: 'Social'},
  {name: 'Having casual conversations with many people', personality_type: 'Social'},
  {name: 'Pair-programming', personality_type: 'Social'},
  {name: 'Having a deep conversation', personality_type: 'Thoughtful'},
  {name: 'Board Games', personality_type: 'Thoughtful'},
  {name: 'Going to a spa', personality_type: 'Thoughtful'},
  {name: 'Volunteer Activities', personality_type: 'Thoughtful'},
  {name: 'Bookclub', personality_type: 'Thoughtful'},
  {name: 'Meditation retreat', personality_type: 'Thoughtful'},
  {name: 'Ballroom Dancing', personality_type: 'Thoughtful'},
  {name: 'Walking in a park', personality_type: 'Thoughtful'},
  {name: 'Going to a spa', personality_type: 'Thoughtful'},
  {name: 'Pair-programming', personality_type: 'Thoughtful'}
]

activities_list.each do |activity|
  act = Activity.new({name: activity[:name], personality_type: activity[:personality_type]})
  if act.save!
    puts activity[:name]
  else
    puts act.errors.message
  end
end



