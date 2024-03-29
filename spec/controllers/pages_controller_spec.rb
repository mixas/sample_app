require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end

    it "should have right title" do
      get 'home'
      response.should have_selector("title", :content => "home")
    end

  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end

    it "should have right title" do
      get 'contact'
      response.should have_selector("title", :content => "contact")
    end

  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success  #answer from browser on 'get' request should be ... (200 Ok)
    end

    it "should have right title" do
      get 'about'
      response.should have_selector("title", :content => "about")
    end

  end
end
