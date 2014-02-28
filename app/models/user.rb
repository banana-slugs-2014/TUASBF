class User < ActiveRecord::Base
  validates_presence_of :email, :password_hash
  validates :email, format: { with: /^\w+@\w+\.\w+$/, message: "Your email must be in a valid format, e.g., user@domain.com" }
  has_many :completesurveys
  has_many :surveys, :through => :completesurveys
  has_many :responses
end
