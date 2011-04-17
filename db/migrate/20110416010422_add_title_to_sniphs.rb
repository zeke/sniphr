class AddTitleToSniphs < ActiveRecord::Migration
  def self.up
    add_column :sniphs, :title, :string
    add_index :sniphs, :title
  end

  def self.down
    remove_column :sniphs, :title
    remove_index :sniphs, :title
  end
end
