require 'spec_helper'
require_relative "../../lib/color_utils.rb"

describe ColorUtils do
  let(:sample_image_path) { File.join(File.dirname(__FILE__), "..", "features", "image.png") }

  it "returns nil when error" do
    ColorUtils.new.send(:quantize, '/a/b/c/d/e').should be_nil
  end

  it "quantizes an image colors" do
    colors = ColorUtils.new.send(:quantize, sample_image_path)
    colors.should have(7).color_entries
    colors[0].should == [ 61, 46, 45 ]
  end

  describe "calculating distance between two colors" do

    it "returns 0 when they are the same" do
      first_color = Color.new(:red => 0, :green => 1, :blue => 2)
      second_color = Color.new(:red => 0, :green => 1, :blue => 2)
      ColorUtils.new.color_distance(first_color, second_color).should == 0
    end

    it "returns MAX_VALUE when they are the opposite" do
      first_color = Color.new(:red => 0, :green => 0, :blue => 0)
      second_color = Color.new(:red => 255, :green => 255, :blue => 255)
      ColorUtils.new.color_distance(first_color, second_color).should == 255**2 * 3
    end

  end

  describe "calculating distance between two pictures" do

    class MockColor
      Surrogate.endow self
      attr_accessor :red, :green, :blue
      define(:initialize) { |args| args.each_pair do |key, val| self.send(key.to_s + "=", val) end }
    end

    class MockPhoto
      Surrogate.endow self
      attr_accessor :colors
      define(:initialize) { |args| args.each_pair do |key, val| self.send(key.to_s + "=", val) end }
    end

    it "verifies mocks - Color" do
      MockColor.should substitute_for Color, subset: true, types: false
    end

    it "verifies mocks - Photo" do
      MockPhoto.should substitute_for Photo, subset: true, types: false
    end

    it "returns 0 when they have the same dominating color" do
      first_color = MockColor.new(:red => 0, :green => 1, :blue => 2)
      first_photo = MockPhoto.new(:colors => [ first_color ] )
      second_photo = MockPhoto.new(:colors => [ first_color ] )
      ColorUtils.new.photo_distance(first_photo, second_photo).should == 0
    end

  end
end
