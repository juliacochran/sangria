class Job < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  validates_presence_of :user

end
