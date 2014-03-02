require 'spec_helper'

describe User do

  it {should have_many :completesurveys}
  it {should have_many :surveys}
  it {should have_many :responses}
  it {should validate_presence_of :email }
  it {should validate_presence_of :password}

end
