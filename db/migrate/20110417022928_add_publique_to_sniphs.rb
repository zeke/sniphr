class AddPubliqueToSniphs < ActiveRecord::Migration
  def self.up
    add_column :sniphs, :publique, :boolean, :default => true
    add_index :sniphs, :publique
  end

  def self.down
    remove_column :sniphs, :publique
    remove_index :sniphs, :publique
  end
end
