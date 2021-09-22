puts "Enter coefficients a, b and c:"
a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i

if a == 0
  puts "Equation isn't quadratic, x=#{- c / b}"
else
  discriminant = b * b - 4 * a * c

  if discriminant < 0
    puts "D=#{discriminant}, there are no roots"
  end

  if discriminant == 0
    x = - (b + Math.sqrt(discriminant)) / (2 * a)
    puts "D=#{discriminant}, x=#{x}"
  end

  if discriminant > 0
    x1 = - (b - Math.sqrt(discriminant)) / (2 * a)
    x2 = - (b + Math.sqrt(discriminant)) / (2 * a)
    puts "D=#{discriminant}, x1=#{x1}, x2=#{x2}"
  end
end
