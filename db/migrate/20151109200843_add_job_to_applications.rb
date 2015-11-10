class AddJobToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :job, :string
  end
end
