require 'spec_helper'

describe "post /sign_up route" do
  it "creates a new user" do
    ## Arrange
    params = {name: 'rao', handle: 'raorao', email: 'frao@gmail.com', password_hash: 'raosucks'}
    User.destroy_all

    ## Act
    post '/sign_up', params

    ## Assert
    expect(User.count).to eq(1)
  end
end