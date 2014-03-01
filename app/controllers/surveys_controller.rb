get '/surveys/new' do
  redirect '/' unless logged_in?
  erb :'surveys/new'
end

post '/surveys/new' do
  survey_params = params[:survey]
  @survey = Survey.create(title: survey_params[:survey])
  Survery.questions.create(text: survey_params[:question1])
  Survery.questions.answer.create(content: survey_params[:question1_answer1])
  Survery.questions.answer.create(content: survey_params[:question1_answer2])
  Survery.questions.answer.create(content: survey_params[:question1_answer3])


  Survery.questions.create(text: survey_params[:question2])
  Survery.questions.answer.create(content: survey_params[:question2_answer1])
  Survery.questions.answer.create(content: survey_params[:question2_answer2])
  Survery.questions.answer.create(content: survey_params[:question2_answer3])

  Survery.questions.create(text: survey_params[:question3])
  Survery.questions.answer.create(content: survey_params[:question3_answer1])
  Survery.questions.answer.create(content: survey_params[:question3_answer2])
  Survery.questions.answer.create(content: survey_params[:question3_answer3])

  redirect "/user/#{current_user.id}"
end