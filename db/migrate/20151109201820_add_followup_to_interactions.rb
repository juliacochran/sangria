class AddFollowupToInteractions < ActiveRecord::Migration
  def change
    add_column :interactions, :followup, :boolean, :default => false
  end
end
