# Overwriting ruby's constructor
class Person
	def self.new(*args)
		puts "No instance for you"
	end
end

class Animal
  class << self
    def new
      puts "No instance for you"
    end
  end
end

class Animal
  class << self
    def new
      puts "No instance for you"
    end
  end
end

# Singleton pattern

class Solo
  class << self
    private :new
  end

  def self.instance
    @instance ||= new
  end

  def introduce_yourself
    puts self
  end
end

require 'singleton'

class AnotherSolo
  include Singleton

  def introduce_yourself
    puts self
  end
end 

x = Solo.instance
y = Solo.instance
z = AnotherSolo.instance

x.introduce_yourself
y.introduce_yourself
z.introduce_yourself
