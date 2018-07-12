class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user][:name],params[:user][:password])
    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ["Invalid username/password"]
      # redirect
    end  
  end

  def destroy
    logout if current_user
    redirect_to cats_url
  end
end
