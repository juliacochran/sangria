class Contact < ActiveRecord::Base
  belongs_to :company, dependent: :destroy
  validates_presence_of :company

  validates_format_of :name, with: /\A([a-zA-Z0-9\.\' ]+)\z/i, on: :create
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create

end
