class Board < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  validates_presence_of :user
  has_many :applications
  has_many :notes
  has_many :interactions
end
