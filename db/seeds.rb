require 'faker'


10.times do |i|
  User.create(email: "glen#{i}@glen.com", password: "asdf")
  Survey.create(title: "Don't call me Glen, guys! No. #{i}", user_id: rand(9)+1)
  Question.create(text: Faker::Lorem.words, survey_id: rand(9)+1)
  Response.create(user_id: rand(9)+1, answer_id: rand(9)+1)
  Completesurvey.create(user_id: rand(9)+1, survey_id: rand(9)+1)
  Answer.create(content: Faker::Lorem.sentence, question_id: rand(9)+1)
end

