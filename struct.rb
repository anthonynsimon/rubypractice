# Construct a class based on a struct
# Accepts methods too!
Point = Struct.new(:x, :y) do
  def to_s
    "x:#{x}, y:#{y}"
  end
end

# Works just like a class, it's a class
a = Point.new(10, 15)
b = Point.new(20, 3)

# Access attributes like a hash
a[:x] # => 10
b['y'] # => 3

# Introspect it's own attributes
a.members # => x, y

# Iterate over them
a.map do |v| 
  v * v
end

# They're enumerable
a.min # => 10
a.max # => 15
a.reduce(&:+) # => 25

# Classes aren't ;)
class Pon
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end
end

po = Pon.new(5,7)
# po.reduce(&:+) # => error

