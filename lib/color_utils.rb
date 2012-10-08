class ColorUtils

  def quantize_photo photo
    colors = quantize(photo.file.path)
    unless colors.empty?
      photo.colors.delete_all
      colors.each_with_index do |color, index|
        PaletteManager.new.add_color_to_photo(Color.find_or_create_by_red_and_green_and_blue( color[0], color[1], color[2]), photo)
      end
    end
  end

  def photo_distance first_photo, second_photo
    distance_rgb(first_photo.colors[0], second_photo.colors[0])
  end

  def distance_rgb first_color, second_color
    return (first_color.red - second_color.red)**2 + (first_color.green - second_color.green)**2 + (first_color.blue - second_color.blue)**2
  end

  private

  def quantize image_path
    #"# ImageMagick pixel enumeration: 5,1,255,rgb\n0,0: ( 61, 46, 45)  #3D2E2D  rgb(61,46,45)\n1,0: (103, 92, 96)  #675C60  rgb(103,92,96)\n2,0: (141,123,117)  #8D7B75  rgb(141,123,117)\n3,0: (160,154,156)  #A09A9C  rgb(160,154,156)\n4,0: (218,217,217)  #DAD9D9  rgb(218,217,217)\n"
    if ! File.exists?(image_path)
      return nil
    end
    regexp_for_rgb = /rgb\(([0-9,]+)\)/ # returns 1,2,3
    regexp_for_hex = /(#[A-F0-9]{6})/   # returns #abcdef
    convert_output =  `convert #{image_path} -alpha OFF +dither -colors 7 -unique-colors txt:-`
    return convert_output.scan(regexp_for_rgb).to_a.flatten.map { |values| 
      values.split(",").map { |number| number.to_i }
    }
  end

end
