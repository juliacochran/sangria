class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.integer :application_id
      t.string :title
      t.integer :category
      t.date :date
      t.integer :contact_id
      t.text :details

      t.timestamps null: false
    end
  end
end
