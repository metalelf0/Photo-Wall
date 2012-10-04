class ColorUtils

  def quantize image_path
    #"# ImageMagick pixel enumeration: 5,1,255,rgb\n0,0: ( 61, 46, 45)  #3D2E2D  rgb(61,46,45)\n1,0: (103, 92, 96)  #675C60  rgb(103,92,96)\n2,0: (141,123,117)  #8D7B75  rgb(141,123,117)\n3,0: (160,154,156)  #A09A9C  rgb(160,154,156)\n4,0: (218,217,217)  #DAD9D9  rgb(218,217,217)\n"
    return nil unless File.exists?(image_path)
    regexp_for_rgb = /rgb\(([0-9,]+)\)/ # returns 1,2,3
    regexp_for_hex = /(#[A-F0-9]{6})/   # returns #abcdef
    return `convert #{image_path} -quantize transparent +dither -colors 5 -unique-colors txt:-`.scan(regexp_for_rgb).to_a.flatten.map { |values| 
      values.split(",").map { |number| number.to_i }
    }
  end

end
