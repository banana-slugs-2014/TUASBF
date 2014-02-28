class Answer < ActiveRecord::Base
  validates_presence_of :content, :user_id
  belongs_to :question
  has_many :responses
end
