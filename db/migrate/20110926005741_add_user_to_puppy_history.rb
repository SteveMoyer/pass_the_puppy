class AddUserToPuppyHistory < ActiveRecord::Migration
  def up
    add_column :puppy_histories,:user_id, :int
  end
  def down
    remove_column :puppy_histories, :user_id
  end
end
