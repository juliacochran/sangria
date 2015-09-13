class RemoveUserIdFromBoards < ActiveRecord::Migration
  def change
    remove_column :boards, :user_id, :integer
  end
end
