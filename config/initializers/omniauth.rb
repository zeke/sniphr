Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, (ENV['TWITTER_KEY'] || configatron.twitter.key), (ENV['TWITTER_SECRET'] || configatron.twitter.secret)
  provider :facebook , (ENV['FACEBOOK_KEY'] || configatron.facebook.key), (ENV['FACEBOOK_SECRET'] || configatron.facebook.secret) , {:scope => "manage_pages"}
end