## Normal

class Command
  def execute
  end

  def undo
  end

  def describe
  end
end

class ReadFile < Command
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def execute
    if @path && File.file?(@path)
      result = []
      file = File.open(@path, 'r')
      file.each_line do |line|
        result << line
      end
      file.close
      result
    else
      "No such file: #{@path}"
    end
  end

  def describe
    "Reads the file at path '#{@path}'' and returns an array with each line."
  end
end

## With undo

class DeleteFile < Command
  attr_accessor :path

  def initialize(path = nil)
    @path = path
    @contents = nil
  end

  def execute
    if @path && File.file?(@path)
      @contents = File.read(@path)
      File.delete(@path)
    else
      "No such file: #{@path}"
    end
  end

  def undo
    if @path && @contents
      File.write(@path, @contents)
    else
      'Nothing to undo!'
    end
  end

  def describe
    "Deletes the file at path: '#{@path || 'EMPTY PATH'}'."
  end
end

## Composite Command

class WriteFile < Command
  def initialize(path, contents)
    @path = path
    @contents = contents
  end

  def execute
    f = File.open(@path, 'w')
    f.write(@contents)
    f.close
  end

  def undo
    File.delete(@path) if File.file?(@path)
  end

  def describe
    "Writes the given contents to a file at path '#{@path}''"
  end
end

class CompositeCommand < Command
  def initialize
    @commands = []
  end

  def add_command(command)
    throw Exception.new('Not a type of command!') unless command.is_a? Command
    @commands << command
  end

  def execute
    @commands.each do |command|
      puts "Executing command #{command}"
      command.execute
    end
  end

  def undo
    @commands.reverse.each do |command|
      puts "Undoing command #{command}"
      command.undo
    end
  end

  def describe
    @commands.each { |command| puts command.describe }
  end
end

cmd1 = WriteFile.new './data/test.dat', 'This is a test dude!\nHello There!'
cmd2 = ReadFile.new './data/test.dat'
cmd3 = DeleteFile.new './data/sample_text.txt'

composite = CompositeCommand.new

composite.add_command(cmd1)
composite.add_command(cmd2)
composite.add_command(cmd3)

composite.execute
sleep(2)
composite.undo
