class RemoveCompanyIdFromApplications < ActiveRecord::Migration
  def change
    remove_column :applications, :company_id, :integer
  end
end
