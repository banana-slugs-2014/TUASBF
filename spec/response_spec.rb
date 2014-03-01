require 'spec_helper'

describe Response do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :answer_id }
  it { belong_to :user }
  it { belong_to :answer }
end
