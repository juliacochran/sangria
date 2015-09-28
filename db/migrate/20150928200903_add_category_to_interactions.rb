class AddCategoryToInteractions < ActiveRecord::Migration
  def change
    add_column :interactions, :category, :integer
  end
end
