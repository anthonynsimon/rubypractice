# External Iterator

class ExternalIterator
  attr_reader :iterable

  def initialize(iterable)
    @iterable = Array.new iterable
    @index = 0
  end

  def iterable=(value)
    @iterable = Array.new value
  end

  def next?
    return false if @iterable.nil?
    @index < @iterable.length - 1 ? true : false
  end

  def next
    return unless next?
    result = @iterable[@index]
    @index += 1
    result
  end

  def reset
    @index = 0
  end

  def each
    while next?
      yield self.next
    end
    reset
  end
end

iter = ExternalIterator.new [1, 2, 3, 4, 5]

iter.each { |x| p "first round #{x}" }
iter.each { |x| p "second round #{x}" }

# Internal Iterator

class Account
  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def <=>(other)
    @data <=> other.data
  end

  def to_s
    "Account value: #{@data}"
  end
end

class Accounts
  include Enumerable

  attr_accessor :data

  def initialize(*accounts)
    @data = []
    accounts.each do |input|
      @data << if input.class == Account
                 input
               else
                 Account.new(input)
               end
    end
  end

  def each(&block)
    @data.each(&block)
  end
end

sample_account = Account.new 368
accounts = Accounts.new sample_account, 722
accounts.each { |x| puts x }

puts accounts.any? { |x| x.data > 400 }
