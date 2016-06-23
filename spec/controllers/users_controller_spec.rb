require 'rails_helper'

describe UsersController, type: :controller do

  let(:user_a) { User.create!(email: "examplea@user.com", password: "exampleusera") }
  let(:user_b) { User.create!(email: "exampleb@user.com", password: "exampleuserb") }

  describe "GET #show" do
    context "user is logged in" do
      before do
        sign_in user_a  # Devise method sign_in
      end

      it "loads correct user details" do
        get :show, id: user_a.id
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq user_a
      end

      it "does not load other user" do
        get :show, id: user_b.id
        expect(response.status).to eq 302
        expect(response).to redirect_to(root_path)
      end
    end

    context "no user is logged in" do
      before do
        sign_out user_a # Devise method sign_out
      end

      it "redirects to login" do
        get :show, id: user_a.id  # show page is show page with user.id
        expect(response).to redirect_to(root_path)
      end
    end
  end

end