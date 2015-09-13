class AddBoardToApplications < ActiveRecord::Migration
  def change
    add_reference :applications, :board, index: true, foreign_key: true
  end
end
