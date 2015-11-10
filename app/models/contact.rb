class Contact < ActiveRecord::Base
  belongs_to :company
  validates_presence_of :company

  has_many :interactions
end
