class AddOrganizationToPuppies < ActiveRecord::Migration
  def change
    change_table :puppies do |t|
      t.integer :organization_id
    end
  end
end
