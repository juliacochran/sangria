class Interaction < ActiveRecord::Base
  belongs_to :application
  validates_presence_of :application
  #not sure how to associate contacts to interactions
  #I guess a contact can be separate from interaction but many of them can be tied to one
  has_one :contacts

  CATEGORIES = Array["Phone Interview",
                     "On-site Interview",
                     "Career Fair",
                     "Info Session",
                     "Recruiter Call",
                     "Other"]
end
