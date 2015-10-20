class Board < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user
  has_many :applications, dependent: :destroy
  has_many :notes, dependent: :destroy

  STAGES = Array["Applied",
                 "Interviewing",
                 "Waiting",
                 "Offered"]#, "Discontinued"]
  # STAGES = {1 => "Applied",
  #           2 => "Interviewing",
  #           3 => "Waiting",
  #           4 => "Offered"}#"Discontinued"
end
