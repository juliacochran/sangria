class AddRoleString < ActiveRecord::Migration
  def change
    add_column :contacts, :role, :string
  end
end
