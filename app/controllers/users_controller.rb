class UsersController < ApplicationController
  def index
    @users = User.order("nickname").page(params[:page]).per(30)
    respond_to do |format|
      format.html
    end
  end  
  
  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
          format.html { redirect_to(users_path,
                      :notice => "User was successfully created.") }
        else
          format.html { redirect_to(new_user_path) }
        end
    end
  end
end