class AddApplicationToInteractions < ActiveRecord::Migration
  def change
    add_reference :interactions, :application, index: true, foreign_key: true
  end
end
