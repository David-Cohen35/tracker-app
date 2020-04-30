require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it "renders the new user page" do
      get :new

      expect(response).to render_template(:new)
      expect(response).to have_status(200)

    end
  end

  describe "POST #create" do
    let!(:user) { create :user}
    it "creates a new user instance" do
      context "with invalid params" do
        post :create, params: { user: {title: "This is an invalid username/password combination"} } 
      end
      context "with valid params" do
        it "redirects to the new users url" do
          #post :create, params: { user: {:user_url}}
          expect(response).to redirect_to(user_url)
        end
      end
    end  
  end
end
