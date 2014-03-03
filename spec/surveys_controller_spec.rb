require 'spec_helper'

describe 'Survey Controller' do

  let(:user_session) do
    { 'rack.session' => { user_id: @user.id}}
  end

  before(:all) do
    @user = User.create(email: 'quentin@quentin.fr', password: Faker::Lorem.word)
  end

  it 'should have a route to create a new surver' do
    get '/surveys/new', {}, user_session
    expect(last_response).to be_ok
  end


end