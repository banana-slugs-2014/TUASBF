require 'spec_helper'

describe Question do

  it {should validate_presence_of :survey_id}
  it {should validate_presence_of :text}
  it {should have_many :answers}
  it {should belong_to :survey}

end
