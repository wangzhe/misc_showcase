class CreatePendingUsers < ActiveRecord::Migration
  def self.up
    create_table :pending_users do |t|
      t.text :wechatid
      t.text :code
      t.timestamp :timestamp

      t.timestamps
    end
  end

  def self.down
    drop_table :pending_users
  end
end
