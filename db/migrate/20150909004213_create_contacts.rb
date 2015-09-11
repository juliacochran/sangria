class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :company_id
      t.string :name
      t.string :email
      t.string :phone_number
      t.integer :role

      t.timestamps null: false
    end
  end
end
