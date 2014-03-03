require 'spec_helper'

describe "IndexController" do
  let(:user_session) do
    { 'rack.session' => { user_id: @user.id}}
  end

  let(:user_empty_session) do
    { 'rack.session' => {}}
  end

  before(:all) do
    @user = User.create(email: 'quentin@france.com', password: Faker::Lorem.word)
  end

  it 'should redirect if logged in when trying to get on the main page, but not if logged out' do
    get('/', {}, user_session)
    expect(last_response).to be_redirect
    expect(last_response.location).to include('/users/')
  end

  it 'should not redirect if not logged in' do
    get('/', {}, user_empty_session)
    expect(last_response).to_not be_redirect
  end

  after(:all) do
    User.destroy_all
  end
end