class RemoveBoardIdFromApplications < ActiveRecord::Migration
  def change
    remove_column :applications, :board_id, :integer
  end
end
