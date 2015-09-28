class RemoveTypeFromApplications < ActiveRecord::Migration
  def change
    remove_column :applications, :type, :integer
  end
end
