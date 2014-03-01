require 'spec_helper'

describe Survey do

  it {should validate_presence_of :title}
  it {should validate_presence_of :user_id}
  it {should have_many :completesurveys}
  it {should have_many :users}
  it {should have_many :questions}

end
