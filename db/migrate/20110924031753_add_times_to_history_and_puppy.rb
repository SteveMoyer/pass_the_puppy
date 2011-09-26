class AddTimesToHistoryAndPuppy < ActiveRecord::Migration
  def self.up
   add_column :puppies, :taken_time,:datetime
   add_column :puppy_histories, :taken_time,:datetime
   add_column :puppy_histories, :left_time,:datetime
  end
  def self.down
  
   remove_column :puppies, :taken_time
   remove_column :puppy_histories, :taken_time
   remove_column :puppy_histories, :left_time
  end 
end
