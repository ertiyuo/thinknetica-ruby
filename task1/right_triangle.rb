# frozen_string_literal: true

puts 'Enter 3 sides of the triangle:'
a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i

if a > b
  if a > c
    hypotenuse = a
    leg1 = b
    leg2 = c
  else
    leg1 = a
    leg2 = b
    hypotenuse = c
  end
elsif b > c
  leg1 = a
  hypotenuse = b
  leg2 = c
else
  leg1 = a
  leg2 = b
  hypotenuse = c
end

if hypotenuse**2 == leg1**2 + leg2**2
  puts 'Triangle is right'
elsif a == b && b == c
  puts 'Triangle is equilateral'
elsif a == b || a == c || b == c
  puts 'Triangle is isosceles'
else
  puts 'Triangle is plane'
end
