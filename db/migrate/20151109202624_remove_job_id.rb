class RemoveJobId < ActiveRecord::Migration
  def change
    remove_column :applications, :job_id
  end
end
