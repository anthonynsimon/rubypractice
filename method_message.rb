class Holder
  def hello(name="guest")
    puts "Hello there #{name}"
  end
end

my_object = Holder.new
method = my_object.method(:hello)
method.call "Andrew"