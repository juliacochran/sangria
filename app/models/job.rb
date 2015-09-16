class Job < ActiveRecord::Base
  belongs_to :user

  title :string
  type :integer
end
