class UsersController < ApplicationController
  
  def show
    @user = User.find_by(id: params[:id])
    render :show
  end
  
  def new
    
  end
  
  def create
    
  end
  
end 