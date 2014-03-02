require 'spec_helper'

describe "UserController" do
  let(:user_params) do
    {
      email: Faker::Internet.email,
      password: Faker::Lorem.word
    }
  end

  before(:all) do
    10.times {User.create(email: Faker::Internet.email, password: Faker::Lorem.word) }
    @user = User.create(email: Faker::Internet.email, password: Faker::Lorem.word)
  end

  it "should create a user if you send the right info to post /users/new" do
    expect { post('/users/new', { user: user_params }) }.to change(User, :count).by(1)
    expect(last_response.location).to include '/users/'
    expect(last_response).to be_redirect
  end

  after(:all) do
    User.destroy_all
  end
end