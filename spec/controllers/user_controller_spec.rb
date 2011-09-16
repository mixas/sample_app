require 'spec_helper'

describe UserController do
  render_views

  describe "GET 'new'" do
    
    it "should be successful" do
      get 'new'
      response.should be_success
    end
   
    it "title should be sign up" do
      get 'new'
      response.should have_selector("title", :content => "sign up")
    end

  end

end
