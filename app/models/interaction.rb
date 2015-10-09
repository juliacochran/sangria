class Interaction < ActiveRecord::Base
  belongs_to :application
  validates_presence_of :application
  #not sure how to associate contacts to interactions
  #I guess a contact can be separate from interaction but many of them can be tied to one
  has_one :contacts

  def self.categories 
  	categories = {0 => "Phone Interview", 1=>"On-site Interview", 2 => "Career Fair", 3=> "Info Session", 4=> "Recruiter Call", 5=>"Other"}
  	return categories
  end

end
