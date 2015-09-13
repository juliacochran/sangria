class RemoveContactIdFromInteractions < ActiveRecord::Migration
  def change
    remove_column :interactions, :contact_id, :integer
  end
end
