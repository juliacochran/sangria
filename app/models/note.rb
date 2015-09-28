class Note < ActiveRecord::Base
  belongs_to :board
  validates_presence_of :board

end
