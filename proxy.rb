class SimpleProxy

  def initialize(subject)
    @subject = subject
  end

  def subject
    @subject
  end

  # Useful for delegating
  # def delegate_command
  #   @subject.actual_command
  # end

  # Or for protecting the actual object
  # def authorize_and_run
  #   authorize(credentials)
  #   @subject.run_something
  # end
end

my_object = Object.new
simple_proxy = SimpleProxy.new(my_object)
simple_proxy.subject # => #<Object:0x2e457d0>

class VirtualProxy

  def initialize(&creation_block)
    @creation_block = creation_block
  end

  # Lazy object creation
  def subject
    @subject ||= @creation_block.call
  end
end

virtual_proxy = VirtualProxy.new do
  Object.new
end

virtual_proxy.subject # => #<Object:0x2e457d0>
