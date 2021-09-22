puts "Enter 3 sides of the triangle:"
a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i

if a > b
  if a > c
    hypotenuse, leg1, leg2 = a, b, c
  else
    leg1, leg2, hypotenuse = a, b, c
  end
else
  if b > c
    leg1, hypotenuse, leg2 = a, b, c
  else
    leg1, leg2, hypotenuse = a, b, c
  end
end

if hypotenuse**2 == leg1**2 + leg2**2
  puts "Triangle is right"
elsif a == b && b == c
  puts "Triangle is equilateral"
elsif a == b || a == c || b == c
  puts "Triangle is isosceles"
else
  puts "Triangle is plane"
end

