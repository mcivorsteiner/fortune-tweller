require 'spec_helper'

# For testing your controller. Use RSpec and Rack/Test for testing your routes in index.rb


describe "Index (this is a skeleton index.rb test!)" do

  describe 'user sign-up' do
    it 'should return a user' do
      lou = User.create(name: 'lou', email: 'lou@smail.com', handle: 'loulou', password_hash: 'LL')
        expect (lou.class.name).to eq "lou"
    end
  end
end


# ----------------------------------
  # describe '/profile' do
  #     it { should route(:get, "/profile/:handle") }
  # end

  # describe "index" do
  #   it "renders the home page" do
  #     get :index
  #       expect(last_response.location).to include("Fortune cookie + twitter.")
  #   end
  # end


  # describe "handling AccessDenied exceptions" do
  #   it "redirects to the /invalid page" do
  #     get :invalid
  #     response.should redirect_to("/invalid")
  #   end
  # end

