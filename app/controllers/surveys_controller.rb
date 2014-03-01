get '/surveys/new' do
  erb :'surveys/new'
end

post '/surveys/new' do
  p "@@@@@@@"
  puts params.inspect
  survey_params = params[:survey]
  @survey = Survey.create(title: survey_params[:survey])
  Survey.questions.create(text: survey_params[:question1])
  Survey.questions.answer.create(content: survey_params[:question1_answer1])
  Survey.questions.answer.create(content: survey_params[:question1_answer2])
  Survey.questions.answer.create(content: survey_params[:question1_answer3])


  Survey.questions.create(text: survey_params[:question2])
  Survey.questions.answer.create(content: survey_params[:question2_answer1])
  Survey.questions.answer.create(content: survey_params[:question2_answer2])
  Survey.questions.answer.create(content: survey_params[:question2_answer3])

  Survey.questions.create(text: survey_params[:question3])
  Survey.questions.answer.create(content: survey_params[:question3_answer1])
  Survey.questions.answer.create(content: survey_params[:question3_answer2])
  Survey.questions.answer.create(content: survey_params[:question3_answer3])

  redirect "/user/#{current_user.id}"
end