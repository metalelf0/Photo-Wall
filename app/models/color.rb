class Color < ActiveRecord::Base
  validates_presence_of :red, :green, :blue
  validates_numericality_of :red, :green, :blue
  validates :red, :green, :blue, :inclusion => { :in => 0..255 }
end
