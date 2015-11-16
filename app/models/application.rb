class Application < ActiveRecord::Base
  belongs_to :board
  validates_presence_of :board
  belongs_to :company
  #validates_presence_of :company
  has_many :interactions, dependent: :destroy

  CATEGORIES = Array["Full-time",
                     "Part-time",
                     "Internship",
                     "Co-op"]

  def self.get_category(idx)
    if idx.present? && idx >= 0 && idx < CATEGORIES.length
      return CATEGORIES[idx]
    else
      return ""
    end
  end

  def self.categories_for_select
    select_array = [["Choose Category", ""]]
    CATEGORIES.each_with_index do |category, index|
      select_array.push([category, index+1])
    end
    return select_array
  end

  """
  If all interactions have no dates, get the most recently created one
  If there is a date today or in the future, get the one closest to now
  Otherwise get the one that has most recently passed
  """
  def current_interaction
    interactions_with_date = self.interactions.where.not(date: nil)
    if interactions_with_date.length == 0
      current_interaction = self.interactions.order(created_at: :desc).first
    elsif interactions_with_date.where("date >= ?", Date.today).length > 0
      current_interaction = interactions_with_date.where("date >= ?", Date.today).order(created_at: :desc, date: :asc).first
    else
      current_interaction = interactions_with_date.where("date < ?", Date.today).order(created_at: :desc, date: :desc).first
    end
    return current_interaction
  end
end
