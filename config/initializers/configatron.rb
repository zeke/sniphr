configatron.configure_from_yaml(Rails.root.join('config', 'config.yml'))

secrets_file = Rails.root.join('config', 'config_secrets.yml')
configatron.configure_from_yaml(secrets_file) if File.exist?(secrets_file)