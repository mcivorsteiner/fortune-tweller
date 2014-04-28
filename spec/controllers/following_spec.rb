require 'spec_helper'


describe "post /follow/:handle route" do
  it "check to see if current user can follow another user" do
    ## Arrange
      User.destroy_all
      @user1 = User.create(name: "kaelin", handle: "krazykaelin", email: "kaelin@gmail.com", password_hash: "kaelin")
      @user2 = User.create(name: "anh", handle: "ganhsta", email: "anh@gmail.com", password_hash: "anh")
      params = { handle: @user2.handle}
      test_session = { 'rack.session' => { handle: @user1.handle } }

    ## Act
      post "/follow/#{@user2.handle}", params, test_session

    ## Assert
      expect(@user2.followers.count).to eq(1)

  end
end


describe "post /unfollow/:handle route" do
  it "check to see if current user can unfollow another user" do
    ## Arrange
      User.destroy_all
      @user1 = User.create(name: "kaelin", handle: "krazykaelin", email: "kaelin@gmail.com", password_hash: "kaelin")
      @user2 = User.create(name: "anh", handle: "ganhsta", email: "anh@gmail.com", password_hash: "anh")
      params = { handle: @user2.handle}
      test_session = { 'rack.session' => { handle: @user1.handle } }
      post "/follow/#{@user2.handle}", params, test_session
      

    ## Act
      post "/unfollow/#{@user2.handle}", params, test_session

    ## Assert
      expect(@user2.followers.count).to eq(0)

  end
end


describe "get /following route" do
  it "check to see if current user is following a new user" do
    ## Arrange
      User.destroy_all
      @user1 = User.create(name: "kaelin", handle: "krazykaelin", email: "kaelin@gmail.com", password_hash: "kaelin")
      @user2 = User.create(name: "anh", handle: "ganhsta", email: "anh@gmail.com", password_hash: "anh")
      params = { handle: @user2.handle}
      test_session = { 'rack.session' => { handle: @user1.handle } }
      post "/follow/#{@user2.handle}", params, test_session

    ## Act
      get "/profile/#{@user1.handle}/following"

    ## Assert
      expect(last_response.body).to include("#{@user2.handle}")

  end
end


describe "get /followers route" do
  it "check to see if current user has a new follower" do
    ## Arrange
    User.destroy_all
    @user1 = User.create(name: "kaelin", handle: "krazykaelin", email: "kaelin@gmail.com", password_hash: "kaelin")
    @user2 = User.create(name: "anh", handle: "ganhsta", email: "anh@gmail.com", password_hash: "anh")
    params = { handle: @user2.handle}
    test_session = { 'rack.session' => { handle: @user1.handle } }
    post "/follow/#{@user2.handle}", params, test_session

    ## Act
    get "/profile/#{@user2.handle}/followers"

    ## Assert
    expect(last_response.body).to include("#{@user1.handle}")


  end
end