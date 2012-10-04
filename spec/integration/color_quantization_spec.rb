require 'spec_helper'

describe "Color quantization" do
  let(:sample_image_path) { File.join(File.dirname(__FILE__), "..", "features", "image.png") }
  before(:each){ @attr = {:file => File.open(sample_image_path) } }

  it "automatically adds colors to a photo" do
    photo = Photo.create!(@attr)
    #ColorUtils.new.quantize_photo(photo)
    photo.should have(7).colors
  end
end
