# print 1-255
# (1..255).each { |i| puts i }

# print odd 1-255
# (1..255).each { |i| puts i if i.odd? }

# print sum
# (1..255).each { |i| puts "New number: #{i} Sum: #{i*(i+1)/2}" }

# Iterate array
# [1, 3, 5, 7, 9, 11, 13].each { |i| puts i }

# Find max
# puts Array.new(10) { rand(-10...10) } .max 

# Average
# size = rand(2...10)
# puts Array.new(size) { rand(1...100) } .to_enum.reduce(:+) / size

# Average with odd numbers
# puts (1..255) .to_a .find_all { |i| i.odd? }

# Greater than Y
# y = rand(5..10)
# puts "y = #{y}"
# puts Array.new(10) { rand(1..15) } .find_all { |i| i > y } .length

# Square the values
# puts Array.new(rand(10...20)) { rand(1...10)  } .map! { |i| i**2 }

# Elimainate Negative Numbers
# puts Array.new(10) { rand(-10...10) } .reject! { |i| i < 0 }

# Max, Min, and Average

# Shifting the Values in the Array
a = [1, 5, 10, 7, -2]; a.shift
puts a << 0

# Number to String 
# puts ['dojo', 'dojo', 12, -2].map! { |i| i.to_s } .join
# puts [-1, -3, 2].map!  { |i| i.to_s } .join
