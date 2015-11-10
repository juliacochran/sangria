class Board < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user
  has_many :applications, dependent: :destroy
  has_many :notes, dependent: :destroy

  STAGES = Array["Applied",
                 "Interviewing",
                 "Waiting",
                 "Offered"]#, "Discontinued"]

  def self.get_stage(idx)
    return STAGES[idx-1]
  end

  def self.stages_for_select
    select_array = [["Choose Stage", ""]]
    STAGES.each_with_index do |stage, index|
      select_array.push([stage, index+1])
    end
    return select_array
  end

end
