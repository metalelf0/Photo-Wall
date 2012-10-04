require 'spec_helper' unless ARGV[0] =~ /color_utils_spec/
require_relative "../../lib/color_utils.rb"

describe ColorUtils do
  let(:sample_image_path) { File.join(File.dirname(__FILE__), "..", "features", "image.png") }

  it "returns nil when error" do
    ColorUtils.new.quantize('/a/b/c/d/e').should be_nil
  end

  it "quantizes an image colors" do
    colors = ColorUtils.new.quantize(sample_image_path)
    colors.should have(5).color_entries
    colors[0].should == [ 61, 46, 45 ]
  end

end
