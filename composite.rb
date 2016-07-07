class Task
  attr_accessor :weight

  def initialize(weight = 0)
    @weight = weight
    @subtasks = []
  end

  def add_subtask(subtask)
    @subtasks << subtask
  end

  def remove_subtask(subtask)
    @subtasks.delete(subtask)
  end

  # Note we call #estimate_weight and not @weight for each subtask
  # Otherwise it would only go one level deep
  def estimate_weight
    total = @weight
    @subtasks.each { |subtask| total += subtask.estimate_weight }
    total
  end
end

x = Task.new(5)
y = Task.new(2)
z = Task.new(4)

x.add_subtask(y)
y.add_subtask(z)

p x.estimate_weight
