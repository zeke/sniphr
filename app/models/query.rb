class Query < ActiveRecord::Base

  belongs_to :user
  
  validates_length_of :q, :maximum => 255

end
