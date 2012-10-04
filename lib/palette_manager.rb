class PaletteManager

  def add_color_to_photo color, photo
    unless photo.colors.find_by_red_and_green_and_blue(color.red, color.green, color.blue)
      photo.colors << color
    end
  end
end
