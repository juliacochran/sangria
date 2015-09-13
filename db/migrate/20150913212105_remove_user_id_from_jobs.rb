class RemoveUserIdFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :user_id, :integer
  end
end
