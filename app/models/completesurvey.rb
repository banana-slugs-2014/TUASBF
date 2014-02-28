class Completesurvey < ActiveRecord::Base
  validates_presence_of :user_id, :survey_id
  belongs_to :user
  belongs_to :survey
end
