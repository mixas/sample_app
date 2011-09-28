require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'new'" do
            
    it "should be successful" do
      get 'new'
      response.should be_success
    end
   
    it "title should be sign up" do
      get 'new'
      response.should have_selector("title", :content => "new")
    end
  end

  describe "GET 'show'" do

    before(:each) do
      @user = Factory(:user)
    end

    it "title should be right" do
      get :show, :id => @user
      response.should have_selector("title", :content => @user[:name])
    end

    it "header should content user name" do
      get :show, :id => @user
      response.should have_selector("h1", :content => @user.name)
    end

    it "user page should content image" do
      get :show, :id => @user
      response.should have_selector("h1>img", :class => "gravatar") #"h1>img"   -   h1 content img tag
    end

    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end

    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end
  end
end
