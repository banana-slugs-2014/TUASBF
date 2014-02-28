class CreateSurveys < ActiveRecord::Migration
  def change

    create_table(:users) do |t|
      t.string :email
      t.string :password_hash
    end

    create_table(:surveys) do |t|
      t.string :title
      t.integer :user_id
    end

    create_table(:questions) do |t|
      t.string :text
      t.integer :survey_id
    end

    create_table(:answers) do |t|
      t.string :text
      t.integer :question_id
    end

    create_table(:responses) do |t|
      t.integer :answer_id
      t.integer :user_id
    end

    create_table(:completesurveys) do |t|
      t.integer :user_id
      t.integer :survey_id
    end

  end
end
