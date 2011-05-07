class ChangeCachedTagListTypeToText < ActiveRecord::Migration
  def self.up
    change_column :sniphs, :cached_tag_list, :text
  end

  def self.down
    change_column :sniphs, :cached_tag_list, :string
  end
end
