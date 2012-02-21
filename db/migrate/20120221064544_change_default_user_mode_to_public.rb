class ChangeDefaultUserModeToPublic < ActiveRecord::Migration
  def self.up
    change_column_default :users, :mode, "public"
  end

  def self.down
    change_column_default :users, :mode, "private"
  end
end
