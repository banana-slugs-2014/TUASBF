get '/surveys/new' do
  erb :'surveys/new'
end

post '/surveys/new' do
  survey_params = params[:survey]
  @survey = Survey.create(title: survey_params[:survey])
  @question1 = @survey.questions.create(text: survey_params[:question1])
  @question1.answers.create(content: survey_params[:question1_answer1])
  @question1.answers.create(content: survey_params[:question1_answer2])
  @question1.answers.create(content: survey_params[:question1_answer3])


  @question2 = @survey.questions.create(text: survey_params[:question2])
  @question2.answers.create(content: survey_params[:question2_answer1])
  @question2.answers.create(content: survey_params[:question2_answer2])
  @question2.answers.create(content: survey_params[:question2_answer3])

  @question3 = @survey.questions.create(text: survey_params[:question3])
  @question3.answer.create(content: survey_params[:question3_answer1])
  @question3.answer.create(content: survey_params[:question3_answer2])
  @question3.answer.create(content: survey_params[:question3_answer3])

  redirect "/user/#{current_user.id}"
end