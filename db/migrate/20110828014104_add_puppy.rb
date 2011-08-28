class AddPuppy < ActiveRecord::Migration
  def up
    create_table :puppies do |t|
     t.integer :owner_id
    end
  end

  def down
    drop_table :puppies
  end
end
