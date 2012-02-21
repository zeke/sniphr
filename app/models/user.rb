class User < ActiveRecord::Base

  has_many :sniphs
  has_many :queries

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
      user.image = auth["user_info"]["image"]
      
      case user.provider.to_sym
      when :twitter
        user.nickname = auth["user_info"]["nickname"]
        user.location = auth["user_info"]["location"]
        user.description = auth["user_info"]["description"]
      when :facebook
        user.nickname = auth["user_info"]["name"]
        user.description = auth["extra"]["user_hash"]["bio"]
        user.email = auth["user_info"]["email"]
        user.fb_url = auth["user_info"]["urls"]["Facebook"]
      end
      
    end
  end

  def public_mode?
    self.mode == 'public'
  end

  def manually_configured?
    self.created_at != self.updated_at
  end
  
  def facebook?
    self.provider == 'facebook'
  end
  
  def twitter?
    self.provider == 'twitter'
  end

  def url
    case self.provider.to_sym
    when :twitter then "https://twitter.com/#!/#{nickname}"
    when :facebook then fb_url.present? ? fb_url : "http://www.facebook.com/profile.php?id=#{uid}"
    end
  end
  
  def self.modes_collection
    {'Public' => 'public', 'Private' => 'private'}
  end


end
