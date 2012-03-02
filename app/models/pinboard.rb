class Pinboard
  include HTTParty
  base_uri "https://api.pinboard.in/v1"
  basic_auth (ENV['PINBOARD_USERNAME'] || configatron.pinboard.username) , (ENV['PINBOARD_PASSWORD'] || configatron.pinboard.password)
  
  def self.get_tags_for_url(url)
    result = self.get("/posts/suggest?url=#{url}").parsed_response['suggested']
    return [] if result.blank?
    result.values.flatten.uniq
  end

end
