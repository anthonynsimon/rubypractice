module Observable_c
  def initialize
    @subscribers = []
  end

  def subscribe(subscriber)
    unless subscriber.respond_to? :update
      throw Exception.new "Subscriber #{subscriber} doesn't support update method"
    end

    if @subscribers.include? subscriber
      throw Exception.new "Subscriber #{subscriber} already observing subject"
    end

    @subscribers << subscriber
  end

  def notify_subscribers
    @subscribers.each { |subscriber| subscriber.update(self) }
  end

  def unsubscribe(subscriber)
    @subscribers.delete(subscriber)
  end
end

class Hero
  include Observable_c

  attr_reader :changes

  def initialize(changes)
    super()
    @changes = changes
  end

  def changes=(change)
    @changes = change
    notify_subscribers
  end
end

class Manager
  def update(managed)
    puts "Managed update received! Change = #{managed.changes}"
  end
end

hero = Hero.new('Initial Value should not appear, no subscribers yet')

manager = Manager.new

hero.subscribe(manager)

hero.changes = 'A. This change should appear'
hero.changes = 'B. This change should also appear'

hero.unsubscribe(manager)

hero.changes = 'C. This change should not appear'

class Object
  def update(hero)
    puts "#{self} sees changes! #{hero.changes}"
  end
end

hero.subscribe 'String object'

hero.changes = 'D. This change should appear'
