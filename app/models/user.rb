class User < ActiveRecord::Base
  def self.create_with_omniauth(auth)  
    user = find_by_nickname(auth["user_info"]["nickname"]) || return
    user.provider = auth["provider"]  
    user.uid = auth["uid"]  
    user.name = auth["user_info"]["name"]
    user.save
    return user
  end
end
