class PaletteEntry < ActiveRecord::Base
  attr_accessible :position, :color_id, :photo_id
  belongs_to :color
  belongs_to :photo

  before_save :set_position

  def set_position
    max_position = photo.palette_entries.map { |pe| pe.position }.max || 0
    self.position = max_position + 1
  end
end
