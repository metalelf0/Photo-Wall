require 'spec_helper'

describe PaletteManager do

  it "adds a color to a photo" do
    photo = Photo.create
    color = Color.create(:red => 10, :green => 10, :blue => 10)
    PaletteManager.new.add_color_to_photo(color, photo)
    photo.colors.should == [color]
  end

  it "doesnt add duplicate colors" do
    photo = Photo.create
    color = Color.create(:red => 10, :green => 10, :blue => 10)
    photo.colors << color
    PaletteManager.new.add_color_to_photo(color, photo)
    photo.colors.should == [color]
  end

  it "sets the right position for each color" do
    photo = Photo.create
    2.times do |i|
      color = Color.create(:red => 10 + i, :green => 10, :blue => 10)
      PaletteManager.new.add_color_to_photo(color, photo)
    end
    photo.palette_entries.first.position.should == 1
    photo.palette_entries.last.position.should == 2
  end
end
