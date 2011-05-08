class Delicious
  include HTTParty
  base_uri "api.del.icio.us/v1"
  basic_auth (ENV['DELICIOUS_USERNAME'] || configatron.delicious.username) , (ENV['DELICIOUS_PASSWORD'] || configatron.delicious.password)

  def self.get_tags_for_url(url)
    all_tags = self.get("/posts/suggest?url=#{url}").parsed_response['suggest']
    tags = []
    tags << (all_tags['recommended'] || [])
    tags << (all_tags['popular'] || [])
    tags.flatten.uniq.sort
  end

end
