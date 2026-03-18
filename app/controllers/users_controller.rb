class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.username = params["username"]
    @user.email = params["email"]
    @user.password = params["password"]

    if @user.save
      session["user_id"] = @user.id
      redirect_to "/places"
    else
      flash["notice"] = "Signup failed."
      render :new, status: :unprocessable_entity
    end
  end
end
