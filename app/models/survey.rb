class Survey < ActiveRecord::Base
  validates_presence_of :title, :user_id
  has_many :completesurveys
  has_many :users, :through => :completesurveys
  has_many :questions
end
