class User < ActiveRecord::Base

  def self.from_omniauth auth
    where(provider: auth["provider"].to_s, uid: auth["uid"].to_s).first || create_from_omniauth(auth)
  end
  
  def self.create_from_omniauth auth
    create! do |user|
      user.provider = auth["provider"].to_s
      user.uid = auth["uid"].to_s
      user.name = auth["info"]["name"]
    end
  end
end
