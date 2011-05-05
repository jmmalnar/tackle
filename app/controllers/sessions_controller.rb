class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    unless user.nil?
      session[:user_id] = user.id  
      flash[:notice] = "Greetings, #{auth["user_info"]["name"]}!"
    else
      flash[:error] = "To be able to log in, your GitHub username, #{auth["user_info"]["nickname"]}, needs to be registered in Tackle by an administrator."
    end
    redirect_to root_url 
  end
  
  def destroy  
    session[:user_id] = nil  
    redirect_to root_url, :notice => "Signed out!"  
  end  
end
