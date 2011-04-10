class CreateSniphs < ActiveRecord::Migration
  def self.up
    create_table :sniphs do |t|
      t.string :url
      t.text :content
      t.string :user

      t.timestamps
    end

    add_index :sniphs, :url
    add_index :sniphs, :user
  end

  def self.down
    drop_table :sniphs
  end
end
