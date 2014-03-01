class Question < ActiveRecord::Base
  validates_presence_of :survey_id, :text
  has_many :answers
  belongs_to :survey
end
