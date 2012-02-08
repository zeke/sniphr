class RemoveWhitelistFromUser < ActiveRecord::Migration
  def self.up
    remove_column :users, :whitelist
  end

  def self.down
    add_column :users, :whitelist, :text
  end
end
