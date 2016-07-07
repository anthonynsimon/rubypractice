module Sql
  class Table
    def initialize(name)
      @name = name
    end

    def method_missing(method)
      Column.new(@name, method)
    end

    def to_s
      @name.to_s
    end
  end

  class Column
    def initialize(table, column)
      @table = table
      @column = column
    end

    def to_s
      "#{@table}.#{@column}"
    end

    def ==(other)
      BinaryOpNode.new('=', to_s, other)
    end
  end

  class BinaryOpNode
    def initialize(op, left, right)
      @op = op
      @left = left
      @right = right
    end

    def to_s
      "#{@left} #{@op} #{as_sql(@right)}"
    end

    private

    def as_sql(object)
      case object
      when String
        "'#{object}'"
      else
        object
      end
    end
  end
end

p users = Sql::Table.new('users')
puts users.name
puts users.age
puts users.name == 'john'
puts users.age == 15
