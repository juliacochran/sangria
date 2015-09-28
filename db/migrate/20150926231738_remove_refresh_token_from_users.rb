class RemoveRefreshTokenFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :refresh_token, :string
  end
end
