class Board < ActiveRecord::Base
	belongs_to :user
	has_many :applications
	has_many :notes
	has_many :interactions
	

end
