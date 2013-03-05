class AddOrganizationToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :organization_id
    end
   end
end
