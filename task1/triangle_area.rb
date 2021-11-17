# frozen_string_literal: true

printf 'What is the base of the triangle? '
base = gets.chomp.to_i

printf 'What is the height of the triangle? '
height = gets.chomp.to_i

area = base * height / 2.0
puts "Triangle area is #{area}"
