class AddContactIdToInteractions < ActiveRecord::Migration
  def change
    add_column :interactions, :contact_id, :integer
  end
end
