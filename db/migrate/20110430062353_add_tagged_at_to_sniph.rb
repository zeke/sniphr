class AddTaggedAtToSniph < ActiveRecord::Migration
  def self.up
    add_column :sniphs, :tagged_at, :datetime
    add_index :sniphs, :tagged_at
  end

  def self.down
    remove_column :sniphs, :tagged_at
    remove_index :sniphs, :tagged_at
  end
end
