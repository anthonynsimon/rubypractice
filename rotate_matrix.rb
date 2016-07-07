def rotate(matrix)
  n = matrix.length

  if n != matrix[0].length
    return matrix
  end
   
  for layer in 0..n/2 do
    for position in layer...n-1-layer do
      temp = matrix[position][layer]
      matrix[position][layer] = matrix[n-1-layer][position]
      matrix[n-1-layer][position] = matrix[n-1-position][n-1-layer]
      matrix[n-1-position][n-1-layer] = matrix[layer][n-1-position]
      matrix[layer][n-1-position] = temp
    end
  end
  
  return matrix
end

matrix = [
  ['A', 'B', 'C', 'D'],
  ['E', 'F', 'G', 'H'],
  ['I', 'J', 'K', 'L'],
  ['M', 'N', 'O', 'P'],
]

# matrix = [
#   [-1, 0],
#   [0, 1]
# ]

# matrix = [
#   [:a, :b],
#   [:d, :c],
# ]

puts "\Original:\n"

matrix.each { |row| p row }

puts "\nRotated:\n"

matrix  = rotate(matrix)
matrix.each { |row| p row }