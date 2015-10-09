class AddAppliedDateToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :applied_date, :date
  end
end
