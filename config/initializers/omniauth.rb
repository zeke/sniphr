Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, configatron.twitter.key, configatron.twitter.secret
  provider :facebook, configatron.facebook.key, configatron.facebook.secret, {:scope => "manage_pages"}
end