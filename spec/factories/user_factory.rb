# -*- encoding  utf-8 -*-

Factory.define :user, :default_strategy => :stub do |u|
  u.provider "twitter"
  u.uid "2157621"
  u.nickname "zeke"
  u.name "Zeke Sikelianos"
  u.location "San Francisco, CA"
  u.image "http://a2.twimg.com/profile_images/998106986/zeke_n..."
  u.description "I'm a neolexicographer at @wordnik, muthafuckaz!"
  u.mode "public"
  u.email 'zeke@wordnik.com'
end