class Application < ActiveRecord::Base
  belongs_to :board
  validates_presence_of :board
  belongs_to :company
  #validates_presence_of :company
  has_one :job
  has_many :interactions, dependent: :destroy

  CATEGORIES = Array["Full-time",
                     "Part-time",
                     "Internship",
                     "Co-op"]
end
