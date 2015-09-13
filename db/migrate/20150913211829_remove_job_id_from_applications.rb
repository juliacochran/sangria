class RemoveJobIdFromApplications < ActiveRecord::Migration
  def change
    remove_column :applications, :job_id, :integer
  end
end
