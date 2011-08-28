class AddCommentToPupppy < ActiveRecord::Migration
  def self.up
   add_column :puppies, :comments,:text
  end
  def self.down
   remove_column :puppies, :comments
  end 
end
