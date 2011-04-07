class CreateSnips < ActiveRecord::Migration
  def self.up
    create_table :snips do |t|
      t.string :url
      t.text :content
      t.string :user

      t.timestamps
    end
  end

  def self.down
    drop_table :snips
  end
end
