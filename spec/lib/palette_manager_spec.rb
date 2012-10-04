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
    color = Color.create(:red => 10, :green => 10, :blue => 10)
    PaletteManager.new.add_color_to_photo(color, photo)
    photo.reload
    photo.palette_entries.first.position.should == 1
  end
end

      #max_position = photo.palette_entries.map { |pe| pe.position }.max || 0
      #PaletteEntry.create(:photo_id => photo.id, :color_id => color.id, :position => max_position + 1)
