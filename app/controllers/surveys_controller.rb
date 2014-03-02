get '/surveys/new' do
  erb :'surveys/new'
end

post '/surveys/new' do
  survey_params = params[:survey]
  redirect_if_invalid @survey = Survey.create(title: survey_params[:survey], user_id: current_user.id)
  redirect_if_invalid @question1 = @survey.questions.create(text: survey_params[:question1])
  redirect_if_invalid @question1.answers.create(content: survey_params[:question1_answer1])
  redirect_if_invalid @question1.answers.create(content: survey_params[:question1_answer2])
  redirect_if_invalid @question1.answers.create(content: survey_params[:question1_answer3])


  redirect_if_invalid @question2 = @survey.questions.create(text: survey_params[:question2])
  redirect_if_invalid @question2.answers.create(content: survey_params[:question2_answer1])
  redirect_if_invalid @question2.answers.create(content: survey_params[:question2_answer2])
  redirect_if_invalid @question2.answers.create(content: survey_params[:question2_answer3])

  redirect_if_invalid @question3 = @survey.questions.create(text: survey_params[:question3])
  redirect_if_invalid @question3.answers.create(content: survey_params[:question3_answer1])
  redirect_if_invalid @question3.answers.create(content: survey_params[:question3_answer2])
  redirect_if_invalid @question3.answers.create(content: survey_params[:question3_answer3])

  redirect_if_invalid current_user.completesurveys.create(user_id: @user.id, survey_id: @survey.id)

  redirect "/user/#{current_user.id}"
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  if @survey.user_id == current_user.id #|| current_user.completesurveys.find(params[:id])
    erb :'surveys/show'
  else
    erb :'surveys/take'
  end
end

post '/surveys/:id' do

end