class Contact < ActiveRecord::Base
  belongs_to :company

  name :string
  email :string
  phone_number :string
  role :integer
end
