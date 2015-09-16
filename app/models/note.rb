class Note < ActiveRecord::Base
  belongs_to :board

  title :string
  details :text
  remind_date :date
end
