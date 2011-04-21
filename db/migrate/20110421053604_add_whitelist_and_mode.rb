class AddWhitelistAndMode < ActiveRecord::Migration
  def self.up
    add_column :users, :whitelist, :text
    add_column :users, :mode, :string, :default => 'private'
  end

  def self.down
    remove_column :users, :whitelist
    remove_column :users, :mode
  end
end
