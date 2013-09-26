require 'spec_helper'

describe Onboarding::ImagesController do

  describe "GET #show" do
    #it "assigns the requested contact to @contact" do
    #  contact = Factory(:contact)
    #  get :show, id: contact
    #  assigns(:contact).should eq(contact)
    #end
    it "renders the #show view" do
      signin_name = "johnsmith"
      get :show, {:signin_name => "johnsmith"}
      #response.should render_template :show
    end
  end

  #it "redirects to the home page upon save" do
  #  post :create, contact: Factory.attributes_for(:contact)
  #  response.should redirect_to onboarding_file_new_url
  #end

end
