names = ["hello", "there", "you"]

def enumerate_it(enumerable_thing)
    for elem in enumerable_thing
        yield elem
    end
end

enumerate_it(names) do |x|
    x
end

names_2 = %w[hello there you] # Another way to construct the array

for i in (0...names_2.length)
    names_2.shift # => poping out the first element, will alter array
end

names_2.length # => 0

@things = %w[7 8 9]

def thing
    for i in (0...@things.length)
        yield @things.shift
    end
end

enum = to_enum(:thing)

puts enum.next # => 7
puts enum.next # => 8
puts enum.next # => 8

# enum.next # => would raise iterationstop, as the method has reached it's end

@things = %w[11 12 13] # => repopulate things
enum.rewind # => rewind enum to first iteration
puts enum.next # => continue until yield