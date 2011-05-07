class Sniph < ActiveRecord::Base
  # include PgSearch
  # pg_search_scope :search, :against => [:url, :content, :user]

  validates :url, :presence => true
  validates :content, :presence => true
  belongs_to :user
  acts_as_taggable

  def blatantly_update_tags!(tag_list_string)
    self.last_tagging_attempted_at = Time.now
    self.tag_list = tag_list_string if tag_list_string.present?
    self.save!
  end

end
