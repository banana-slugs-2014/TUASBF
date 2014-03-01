class CreateSurveys < ActiveRecord::Migration
  def change

    create_table(:users) do |t|
      t.string :email
      t.string :password
    end

    create_table(:surveys) do |t|
      t.string :title
      t.references :user
    end

    create_table(:questions) do |t|
      t.string :text
      t.references :survey
    end

    create_table(:answers) do |t|
      t.string :content
      t.references :question
    end

    create_table(:responses) do |t|
      t.references :answer
      t.references :user
    end

    create_table(:completesurveys) do |t|
      t.references :user
      t.references :survey
    end

  end
end
