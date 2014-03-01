require 'spec_helper'

describe Completesurvey do
  it {should validate_presence_of :user_id }
  it {should validate_presence_of :survey_id }
  it { should belong_to :user }
  it { should belong_to :survey }
end
