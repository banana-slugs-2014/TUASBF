class Question < ActiveRecord::Base
  validates_presence_of :survey_id, :content
  has_many :answers
  belongs_to :survey
end
