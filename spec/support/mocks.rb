module Mocks

  class Color
    Surrogate.endow self
    attr_accessor :red, :green, :blue
    define(:initialize) { |args| args.each_pair do |key, val| self.send(key.to_s + "=", val) end }
  end

  class Photo
    Surrogate.endow self
    attr_accessor :colors
    define(:initialize) { |args| args.each_pair do |key, val| self.send(key.to_s + "=", val) end }
  end

end
