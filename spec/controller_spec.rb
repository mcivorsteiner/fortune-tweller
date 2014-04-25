describe "post /sign_up route" do
  it "creates a new user" do
    user = User.create(:name => "Jeff", :handle => "Jeffman", :password_hash => '1234', :email => "jeff@gmail.com")
    expect(last_response).to include(user.name)
  end
end