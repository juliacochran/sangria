class AddBoardToNotes < ActiveRecord::Migration
  def change
    add_reference :notes, :board, index: true, foreign_key: true
  end
end
