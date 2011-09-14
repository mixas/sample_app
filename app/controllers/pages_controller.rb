class PagesController < ApplicationController
  def home
    @title = "home"
  end

  def contact
    @title = "contact"
  end

  def about
    @title = "about"
  end

  def about
    $title = 'test'
  end

  def about
    $title = 'help'
  end

end
