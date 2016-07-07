sums = [0,1,2,3,4,5,6,7,8,9].each_slice(2).map do |slice|
    slice.reduce(&:+)
end

p sums # => [1,5,9,13,17]

sums_2 = [0,1,2,3,4,5,6,7,8,9].each_slice(2).map do |slice|
    slice
end

p sums_2 # => [[0,1],[2,3]...

sums_2 = [0,1,2,3,4,5,6,7,8,9].each_slice(2)

p sums_2 # => enumerator [0,1,...]:each_slice(2)
p sums_2.next # => [0,1]

# let's replicate that behaviour

def names
    return to_enum(__callee__) unless block_given?
    yield "mark"
    yield "anna"
    yield "something"
end

p names # => enumerator
p names.next 