class Application < ActiveRecord::Base
  belongs_to :board
  has_one :job
  has_one :company
  has_many :interactions

  stage :integer
  type :integer
  settings :binary
end
