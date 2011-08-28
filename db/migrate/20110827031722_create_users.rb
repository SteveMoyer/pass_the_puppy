class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.boolean :is_admin, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
