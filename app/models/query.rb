class Query < ActiveRecord::Base
  serialize :all_params

  belongs_to :user
end
