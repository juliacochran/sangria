class RemoveRole < ActiveRecord::Migration
  def change
    remove_column :contacts, :role, :integer
  end
end
