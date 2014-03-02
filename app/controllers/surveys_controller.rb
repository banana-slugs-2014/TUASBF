get '/surveys/new' do
  erb :'surveys/new'
end

post '/surveys/new' do
  survey_params = params[:survey]
  @survey = Survey.create(title: survey_params[:survey], user_id: current_user.id)
  @question1 = @survey.questions.create(text: survey_params[:question1])
  @question1.answers.create(content: survey_params[:question1_answer1])
  @question1.answers.create(content: survey_params[:question1_answer2])
  @question1.answers.create(content: survey_params[:question1_answer3])


  @question2 = @survey.questions.create(text: survey_params[:question2])
  @question2.answers.create(content: survey_params[:question2_answer1])
  @question2.answers.create(content: survey_params[:question2_answer2])
  @question2.answers.create(content: survey_params[:question2_answer3])

  @question3 = @survey.questions.create(text: survey_params[:question3])
  @question3.answers.create(content: survey_params[:question3_answer1])
  @question3.answers.create(content: survey_params[:question3_answer2])
  @question3.answers.create(content: survey_params[:question3_answer3])

  current_user.completesurveys.create(user_id: @user.id, survey_id: @survey.id)

  redirect "/user/#{current_user.id}"
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  if current_user.completesurveys.find(params[:id]) || @survey.user_id = current_user.id
    erb :'surveys/show'
  else
    erb :'surveys/take'
  end
end