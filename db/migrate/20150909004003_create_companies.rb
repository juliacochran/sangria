class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :location
      t.string :website
      t.string :logo

      t.timestamps null: false
    end
  end
end
