Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'gzxKtmpmz0hdtTHmOmqpxw', 'apAP5HYotiVYGEgO0BKeqidiSxiVsA4eLAuX5mOw8s'
  # provider :facebook , 'app' , 'secret' , {:scope => "manage_pages"}
end