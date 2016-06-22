require 'rails_helper'

describe UsersController, :type => :controller do

  before do
    @usera = User.create!(email: "examplea@user.com", password: "exampleusera")
    @userb = User.create!(email: "exampleb@user.com", password: "exampleusera")
  end

  describe "GET #show" do
    context "user is logged in" do
      before do
        sign_in @usera  # Devise method sign_in
      end

      it "loads correct user details" do
        get :show, id: @usera.id
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @usera
      end

      it "does not load other user" do
        get :show, id: @userb.id
        expect(response.status).to eq 302
        expect(response).to redirect_to(root_path)
      end
    end

    context "no user is logged in" do
      before do
        sign_out @usera # Devise method sign_out
      end

      it "redirects to login" do
        get :show, id: @usera.id  # show page is show page with user.id
        expect(response).to redirect_to(root_path)
      end
    end
  end

end