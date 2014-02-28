class User < ActiveRecord::Base
  has_many :completesurveys
  has_many :surveys, :through => :completesurveys
  has_many :responses
end
