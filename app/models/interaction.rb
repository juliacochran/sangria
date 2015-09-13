class Interaction < ActiveRecord::Base
	belongs_to :application
	#not sure how to associate contacts to interactions
	#has_one :contact_id
end
