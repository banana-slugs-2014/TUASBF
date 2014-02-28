class Survey < ActiveRecord::Base
  has_many :completesurveys
  has_many :users, :through => :completesurveys
  has_many :questions
end
