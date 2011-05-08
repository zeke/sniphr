class AddFacebookColumnsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :email, :string
    add_column :users, :fb_url, :string
  end

  def self.down
    remove_column :users, :email
    remove_column :users, :fb_url
  end
end
