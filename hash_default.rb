# You can set the default value type for uninitialized keys
first_hash = Hash.new{ |h, k| h[k] = [] }
first_hash["One"] << "This will go inside an array"
first_hash["One"] << "This too"
first_hash["Two"] = "This will be just a string"
first_hash["Two"] << "... and this will append to the end of it"

puts first_hash