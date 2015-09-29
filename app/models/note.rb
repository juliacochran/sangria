class Note < ActiveRecord::Base
  belongs_to :board, dependent: :destroy
  validates_presence_of :board

end
