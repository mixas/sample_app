class PagesController < ApplicationController
  
  def help
    @title = "help"
  end

  def home
    @title = "home"
  end

  def contact
    @title = "contact"
  end

  def about
    @title = "about"
  end

end
