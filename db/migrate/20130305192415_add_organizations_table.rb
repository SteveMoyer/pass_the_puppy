class AddOrganizationsTable < ActiveRecord::Migration
  def up
    create_table :organizations do |t|
      t.string :name
    end
  end

  def down
  end
end
