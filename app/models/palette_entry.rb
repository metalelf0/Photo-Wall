class PaletteEntry < ActiveRecord::Base
  attr_accessible :position, :color_id, :photo_id
  belongs_to :color
  belongs_to :photo
end
