Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, (ENV['TWITTER_KEY'] || config.twitter.key), (ENV['TWITTER_SECRET'] || config.twitter.secret)
  provider :facebook , (ENV['FACEBOOK_KEY'] || config.facebook.key), (ENV['FACEBOOK_SECRET'] || config.facebook.secret) , {:scope => "manage_pages"}
end