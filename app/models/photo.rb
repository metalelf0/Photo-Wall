class Photo < ActiveRecord::Base

  mount_uploader :file, PhotoUploader

  attr_accessible :file
  has_many :palette_entries
  has_many :colors, :through => :palette_entries
end
