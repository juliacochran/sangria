class AddCategoryToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :category, :integer
  end
end
