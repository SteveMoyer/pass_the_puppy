class AddHistoryToPuppy < ActiveRecord::Migration
  def up
     create_table :puppy_histories do |t|
      
     t.integer :puppy_id
     t.string  :take_comment
     t.string  :leave_comment
    end
 
  end
  def down 
    drop_table :puppy_histories
  end 
end
