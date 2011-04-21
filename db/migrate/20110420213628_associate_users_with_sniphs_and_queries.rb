class AssociateUsersWithSniphsAndQueries < ActiveRecord::Migration
  def self.up
    add_column :sniphs, :user_id, :integer
    add_column :queries, :user_id, :integer
    add_index :sniphs, :user_id
    add_index :queries, :user_id
  end

  def self.down
    remove_column :sniphs, :user_id
    remove_column :queries, :user_id
    remove_index :sniphs, :user_id
    remove_index :queries, :user_id
  end
end
