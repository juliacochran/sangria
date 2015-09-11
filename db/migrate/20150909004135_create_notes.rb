class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :board_id
      t.string :title
      t.text :details
      t.date :remind_date

      t.timestamps null: false
    end
  end
end
