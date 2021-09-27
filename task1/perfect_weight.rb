printf "What is you name? "
name = gets.chomp

printf "What is your height? "
height = gets.chomp.to_i

perfect_weight = (height - 110) * 1.15
puts "#{name}, your perfect weight is #{perfect_weight}"
puts "Your weight is already the best!" if perfect_weight < 0
