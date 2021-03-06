class Interaction < ActiveRecord::Base
  belongs_to :application
  validates_presence_of :application
  #not sure how to associate contacts to interactions
  #I guess a contact can be separate from interaction but many of them can be tied to one
  belongs_to :contact
  accepts_nested_attributes_for :contact, :allow_destroy => true

  CATEGORIES = Array["Phone Interview",
                     "On-site Interview",
                     "Career Fair",
                     "Info Session",
                     "Recruiter Call",
                     "Other"]

  """Given an index, get the appropriate category"""
  def self.get_category(idx)
    if idx.present? && idx >= 0 && idx < CATEGORIES.length
      return CATEGORIES[idx]
    else
      return ""
    end
  end

  """Set the categories up for the select tag"""
  def self.categories_for_select
    select_array = [["Choose Category", ""]]
    CATEGORIES.each_with_index do |category, index|
      select_array.push([category, index+1])
    end
    return select_array
  end
end
