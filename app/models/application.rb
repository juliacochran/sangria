class Application < ActiveRecord::Base
  belongs_to :board, dependent: :destroy
  validates_presence_of :board
  belongs_to :company
  validates_presence_of :company
  has_one :job
  has_many :interactions

end
