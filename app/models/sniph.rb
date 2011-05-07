class Sniph < ActiveRecord::Base
  # include PgSearch
  # pg_search_scope :search, :against => [:url, :content, :user]

  validates :url, :presence => true
  validates :content, :presence => true
  belongs_to :user
  acts_as_taggable

  def blatantly_update_tags!(tag_list)
    self.last_tagging_attempted_at = Time.now
    if tag_list.present?
      self.tag_list = tag_list
      self.cached_tag_list = tag_list.slice(0,250)
    end
    self.save!
  end

end
