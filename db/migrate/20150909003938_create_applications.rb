class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :company_id
      t.integer :board_id
      t.integer :job_id
      t.integer :stage
      t.integer :type
      t.binary :settings

      t.timestamps null: false
    end
  end
end
