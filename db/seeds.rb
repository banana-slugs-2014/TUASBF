require 'faker'


10.times do |user|
  User.create(email: Faker::Internet.email, password_hash: Faker::Lorem.word)
  Survey.create(title: Faker::Company.name, user_id: rand(9)+1)
  Question.create(text: Faker::Lorem.words, survey_id: rand(9)+1)
  Response.create(user_id: rand(9)+1, answer_id: rand(9)+1)
  Completesurvey.create(user_id: rand(9)+1, survey_id: rand(9)+1)
  Answer.create(text: Faker::Lorem.sentence, question_id: rand(9)+1)
end

