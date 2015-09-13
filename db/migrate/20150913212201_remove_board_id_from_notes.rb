class RemoveBoardIdFromNotes < ActiveRecord::Migration
  def change
    remove_column :notes, :board_id, :integer
  end
end
