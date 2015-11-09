class User < ActiveRecord::Base
  validates_format_of :name, with: /\A([a-zA-Z0-9\.\' ]+)\z/i, on: :create
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  #validates_uniqueness_of :email, on: :create
  has_many :boards, dependent: :destroy
  has_many :companies, dependent: :destroy
  has_many :contacts, through: :companies
  has_many :applications, through: :boards
  has_many :interactions, through: :applications

  def self.from_omniauth(auth_hash)
    user = User.find_or_create_by(email: auth_hash['info']['email'])

    if auth_hash[:provider] == 'facebook' and user.facebook_id.blank?
      user.facebook_id = auth_hash['uid']
      user.name = auth_hash['info']['name']
      user.save!
    elsif auth_hash[:provider] == 'google_oauth2' and user.google_id.blank?
      user.google_id = auth_hash['uid']
      user.name = auth_hash['info']['name']
      user.save!
    end
    if not user.boards.exists?
      boardTitle = 'Your first board!'
      firstBoard = user.boards.create(title: boardTitle)
    end
    user
  end

  def contacts_for_select
    select_array = [["Choose Contact", ""]]
    self.contacts.each do |contact|
      select_array.push([contact.name, contact.id])
    end
    return select_array
  end
end
