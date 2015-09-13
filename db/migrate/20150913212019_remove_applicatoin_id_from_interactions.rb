class RemoveApplicatoinIdFromInteractions < ActiveRecord::Migration
  def change
    remove_column :interactions, :application_id, :integer
  end
end
