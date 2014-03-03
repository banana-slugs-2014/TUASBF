get '/surveys/new' do
  redirect '/' unless logged_in?
  erb :'surveys/new'
end

post '/surveys/new' do
  p session
  p params
  survey_params = params[:survey]
  redirect_if_invalid @survey = Survey.create(title: survey_params[:survey], user_id: current_user.id), '/surveys/new'
  redirect_if_invalid @question1 = @survey.questions.create(text: survey_params[:question1]), '/surveys/new'
  redirect_if_invalid @question1.answers.create(content: survey_params[:question1_answer1]), '/surveys/new'
  redirect_if_invalid @question1.answers.create(content: survey_params[:question1_answer2]), '/surveys/new'
  redirect_if_invalid @question1.answers.create(content: survey_params[:question1_answer3]), '/surveys/new'


  redirect_if_invalid @question2 = @survey.questions.create(text: survey_params[:question2]), '/surveys/new'
  redirect_if_invalid @question2.answers.create(content: survey_params[:question2_answer1]), '/surveys/new'
  redirect_if_invalid @question2.answers.create(content: survey_params[:question2_answer2]), '/surveys/new'
  redirect_if_invalid @question2.answers.create(content: survey_params[:question2_answer3]), '/surveys/new'

  redirect_if_invalid @question3 = @survey.questions.create(text: survey_params[:question3]), '/surveys/new'
  redirect_if_invalid @question3.answers.create(content: survey_params[:question3_answer1]), '/surveys/new'
  redirect_if_invalid @question3.answers.create(content: survey_params[:question3_answer2]), '/surveys/new'
  redirect_if_invalid @question3.answers.create(content: survey_params[:question3_answer3]), '/surveys/new'

  redirect_if_invalid current_user.completesurveys.create(user_id: current_user.id, survey_id: @survey.id), '/surveys/new'

  redirect "/users/#{current_user.id}"
end

get '/surveys/:id' do
  redirect '/' unless logged_in?

  @survey = Survey.find(params[:id])
  if @survey.user_id == current_user.id
    erb :'surveys/show'
  elsif !current_user.completesurveys.find_by_survey_id(params[:id]).nil?
    @answers = {}
    @survey.questions.each do |question|
      question.answers.each do |answer|
        @answers[question.text] = answer.content unless current_user.responses.find_by_answer_id(answer.id).nil?
      end
    end
    p current_user.responses
    erb :'surveys/show'
  else
    erb :'surveys/take'
  end
end

post '/surveys/:id' do
  response = params[:response]
  redirect_if_invalid @question1 = Question.find_by_text(response.keys[0]), "/surveys/#{params[:id]}"
  redirect_if_invalid @answer1 = Answer.find_by_content(response.values[0]), "/surveys/#{params[:id]}"
  redirect_if_invalid Response.create(user_id: current_user.id, answer_id: @answer1.id), "/surveys/#{params[:id]}"

  redirect_if_invalid @question2 = Question.find_by_text(response.keys[1]), "/surveys/#{params[:id]}"
  redirect_if_invalid @answer2 = Answer.find_by_content(response.values[1]), "/surveys/#{params[:id]}"
  redirect_if_invalid Response.create(user_id: current_user.id, answer_id: @answer2.id), "/surveys/#{params[:id]}"

  redirect_if_invalid @question3 = Question.find_by_text(response.keys[2]), "/surveys/#{params[:id]}"
  redirect_if_invalid @answer3 = Answer.find_by_content(response.values[2]), "/surveys/#{params[:id]}"
  redirect_if_invalid Response.create(user_id: current_user.id, answer_id: @answer3.id), "/surveys/#{params[:id]}"


  redirect_if_invalid current_user.completesurveys.create(survey_id: params[:id]), "/surveys/#{params[:id]}"

  redirect '/'
end