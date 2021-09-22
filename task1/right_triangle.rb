puts "Enter 3 sides of the triangle:"
side1 = gets.chomp.to_i
side2 = gets.chomp.to_i
side3 = gets.chomp.to_i

if (side1 == side2 && side2 == side3)
  puts "Triangle is equilateral"
elsif (side1 == side2 || side1 == side3 || side2 == side3)
  puts "Triangle is isosceles"
else
  puts "Triangle is plane"
end
