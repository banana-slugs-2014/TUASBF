helpers do

  def count_survey_answers(question)
    user_answers = {}
    question.answers.each do |answer|
      user_answers[answer.content] = 0
      answer.responses.each do |response|
        user_answers[answer.content] += 1
      end
    end
    user_answers.sort_by{|k,v| v}.reverse
  end

  def count_survey_responses(answer)
    count = 0
    answer.responses.each do |response|
      count += 1
    end
    count
  end
end