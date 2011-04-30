class Sniph < ActiveRecord::Base
  # include PgSearch
  # pg_search_scope :search, :against => [:url, :content, :user]

  validates :url, :presence => true
  validates :content, :presence => true
  belongs_to :user
  acts_as_taggable

end
