require 'spec_helper'


describe "UserController" do

  let(:random_user_params) do
    {
      email: 'theultimateamazing@superbestfriends.com',
      password: Faker::Lorem.word
    }
  end

  let(:user_params) do
    {
      email: @user.email,
      password: @user.password
    }
  end

  let(:user_session) do
    { 'rack.session' => { user_id: @user.id}}
  end

  before(:all) do
    10.times { User.create(email: 'quentin@quentin.fr', password: Faker::Lorem.word) }
    @user = User.create(email: Faker::Internet.email, password: Faker::Lorem.word)
  end

  it "should create a user if you send the right info to post /users/new" do
    expect { post('/users/new', { user: random_user_params }) }.to change(User, :count).by(1)
    expect(last_response.location).to include '/users/'
    expect(last_response).to be_redirect
  end

  it "should set the session when posting to login" do
    # post '/users/login', { user: user_params }
    # expect(flash[:notice]).to be_empty
    pending 'Need to add some login test if we find out how'
  end

  it "should not edit the user when patching to /users/:id/edit while not logged in" do
    patch "/users/#{@user.id}", { password: 'password' }
    expect(last_response.location).to include("/users/#{@user.id}")
    expect(last_response.status).to be 401
    expect(@user.password).to_not be 'password'
  end

  it "should edit the user when patching to /users/:id/edit" do
    patch "/users/#{@user.id}", { user: { password: 'password' } }, user_session
    expect(last_response.location).to include("/users/#{@user.id}")
    expect(last_response.status).to_not be 401
    expect(User.find(@user.id).password).to include 'password'
  end

  it "should delete an user is calling delete /users/:id" do
    expect { delete "/users/#{@user.id}", {}, user_session }.to change(User, :count).by(-1)
    expect(last_response.status).to be 302
  end


  after(:all) do
    User.destroy_all
  end
end