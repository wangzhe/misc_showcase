class RenamePendingUserToUser < ActiveRecord::Migration
  def self.up
    rename_table :pending_users, :users
  end

  def self.down
    rename_table :users, :pending_users
  end
end
