class Company < ActiveRecord::Base
  belongs_to :user

	has_many :contacts
  accepts_nested_attributes_for :contacts
end
