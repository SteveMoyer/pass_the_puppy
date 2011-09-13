class AddNameToPuppy < ActiveRecord::Migration
  def change
    add_column :puppies,:name,  :string
  end
end
