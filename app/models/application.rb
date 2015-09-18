class Application < ActiveRecord::Base
  belongs_to :board
  has_one :job
  has_one :company
  has_many :interactions
end
