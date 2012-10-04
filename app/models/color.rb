class Color < ActiveRecord::Base
  validates_presence_of :red, :green, :blue
  validates_numericality_of :red, :green, :blue
  validates :red, :green, :blue, :inclusion => { :in => 0..255 }

  has_many :palette_entries
  has_many :photos, :through => :palette_entries

  def to_hex
    "#%02X%02X%02X" % [red, green, blue]
  end
end
