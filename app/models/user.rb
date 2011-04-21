class User < ActiveRecord::Base

  has_many :sniphs
  has_many :queries

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.nickname = auth["user_info"]["nickname"]
      user.name = auth["user_info"]["name"]
      user.location = auth["user_info"]["location"]
      user.image = auth["user_info"]["image"]
      user.description = auth["user_info"]["description"]
    end
  end

end
