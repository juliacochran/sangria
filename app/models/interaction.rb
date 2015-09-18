class Interaction < ActiveRecord::Base
  belongs_to :application
  #not sure how to associate contacts to interactions
  #I guess a contact can be separate from interaction but many of them can be tied to one
  has_many :contacts
end
