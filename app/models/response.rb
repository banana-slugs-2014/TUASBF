class Response < ActiveRecord::Base
  validates_presence_of :user_id, :answer_id
  belongs_to :user
  belongs_to :answer
end
