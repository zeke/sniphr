class Snip < ActiveRecord::Base

  validates :url, :presence => true
  validates :content, :presence => true

end
