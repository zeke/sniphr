class Delicious
  include HTTParty
  base_uri "api.del.icio.us/v1"
  basic_auth (ENV['DELICIOUS_USERNAME'] || configatron.delicious.username) , (ENV['DELICIOUS_PASSWORD'] || configatron.delicious.password)
  
  # Delicous changed their API response some time around October 2011.
  # Here's a sample of the new format:  
  # {"popular"=>[{"tag"=>"search"}, {"tag"=>"google"}, {"tag"=>"searchengine"}], "recommended"=>[{"tag"=>"web"}, {"tag"=>"engine"}, {"tag"=>"email"}, {"tag"=>"service"}, {"tag"=>"reference"}, {"tag"=>"news"}, {"tag"=>"tools"}]}
  #
  def self.get_tags_for_url(url)
    result = self.get("/posts/suggest?url=#{url}").parsed_response['suggest']
    return [] if result.blank?
    tag_objects = []
    tag_objects << result['recommended'] if result.has_key?('recommended')
    tag_objects << result['popular'] if result.has_key?('popular')
    tag_objects.flatten.map{|t| t['tag'] }.uniq.sort
  end

end
