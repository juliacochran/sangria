class User < ActiveRecord::Base
  facebook_id :string
  google_id :string
  linkedin_id :string

  name :string
  email :string
  seeking :integer
  settings :binary
end
