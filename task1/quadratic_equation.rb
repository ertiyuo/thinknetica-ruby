# frozen_string_literal: true

puts 'Enter coefficients a, b and c:'
a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i

if a.zero?
  puts "Equation isn't quadratic, x=#{- c / b}"
else
  discriminant = b * b - 4 * a * c

  puts "D=#{discriminant}, there are no roots" if discriminant.negative?

  if discriminant.zero?
    x = - (b + Math.sqrt(discriminant)) / (2 * a)
    puts "D=#{discriminant}, x=#{x}"
  end

  if discriminant.positive?
    x1 = - (b - Math.sqrt(discriminant)) / (2 * a)
    x2 = - (b + Math.sqrt(discriminant)) / (2 * a)
    puts "D=#{discriminant}, x1=#{x1}, x2=#{x2}"
  end
end
