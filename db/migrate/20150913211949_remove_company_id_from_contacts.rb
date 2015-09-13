class RemoveCompanyIdFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :company_id, :integer
  end
end
