## Closures capture the surrounding context
# outer = true

# proc = Proc.new { puts outer }

# proc.call

# lambda = -> () { puts outer }

# lambda.call

# # Blocks are 'placed' on the spot
# def something(&block)
#   block.call
#   puts "after " + block.class.to_s
# end

# something do
#   puts "inside proc"
# end


# # Lambda's return to current context (stack)
# def something_else(func)
#   func.call
#   puts "afterwards "
# end

# something_else -> () { return }



def with_lambda
  -> { return }.call
  puts "get's called"
end

with_lambda

def with_proc
  proc { return }.call
  puts "never get's called"
end

with_proc
