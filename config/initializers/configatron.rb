configatron.configure_from_yaml(Rails.root.join('config', 'config.yml'))

secrets_file = Rails.root.join('config', 'config_secrets.yml')
configatron.configure_from_yaml(secrets_file) if File.exist?(secrets_file)

if ENV['HEROKU']
  configatron.twitter.key = ENV['TWITTER_KEY']
  configatron.twitter.secret = ENV['TWITTER_SECRET']
  configatron.facebook.key = ENV['FACEBOOK_KEY'] 
  configatron.facebook.secret = ENV['FACEBOOK_SECRET']
end