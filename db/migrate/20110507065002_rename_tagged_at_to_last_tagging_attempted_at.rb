class RenameTaggedAtToLastTaggingAttemptedAt < ActiveRecord::Migration
  def self.up
    rename_column :sniphs, :tagged_at, :last_tagging_attempted_at
  end

  def self.down
    rename_column :sniphs, :last_tagging_attempted_at, :tagged_at
  end
end
