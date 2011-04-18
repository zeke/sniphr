class CreateQueries < ActiveRecord::Migration
  def self.up
    create_table :queries do |t|
      t.string :q
      t.string :user
      t.string :from_user
      t.string :ip
      t.string :all_params      
      t.integer :num_results


      t.timestamps
    end
    add_index :queries, :q
    add_index :queries, :user
    add_index :queries, :from_user
    add_index :queries, :ip
    add_index :queries, :all_params
    add_index :queries, :num_results
  end

  def self.down
    drop_table :queries
  end
end
