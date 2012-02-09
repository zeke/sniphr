class Sniph < ActiveRecord::Base
  # include PgSearch
  # pg_search_scope :search, :against => [:url, :content, :user]

  validates :url, :presence => true
  validates :content, :presence => true
  belongs_to :user
  acts_as_taggable

  scope :images, lambda { where("content LIKE ? OR content LIKE ? OR content LIKE ?", "%png", "%gif", "%jpg") }

  def blatantly_update_tags!(tag_list_string)
    self.last_tagging_attempted_at = Time.now
    self.tag_list = tag_list_string if tag_list_string.present?
    self.save!
  end
  
  def image?
    !(content =~ /^http.*(jpeg|jpg|gif|png)$/i).nil?
  end
  
end
