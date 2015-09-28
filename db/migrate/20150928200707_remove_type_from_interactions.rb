class RemoveTypeFromInteractions < ActiveRecord::Migration
  def change
    remove_column :interactions, :type, :integer
  end
end
