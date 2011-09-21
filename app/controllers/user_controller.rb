class UserController < ApplicationController
  def new
    @title = "new user"
  end

  def show
    @user = User.find(params[:id])
  end

end
