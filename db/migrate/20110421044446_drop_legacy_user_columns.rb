class DropLegacyUserColumns < ActiveRecord::Migration
  def self.up
    remove_column :sniphs, :user
    remove_column :queries, :user
    remove_column :queries, :from_user
    remove_column :queries, :all_params
  end

  def self.down
    add_column :sniphs, :user, :string
    add_column :queries, :user, :string
    add_column :queries, :from_user, :string
    add_column :queries, :all_params, :string
  end
end
