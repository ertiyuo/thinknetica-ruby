# frozen_string_literal: true

# Сумма покупок.
# Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара (может быть нецелым числом)
# Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия товара.

# На основе введенных данных требуетеся:
# Заполнить и вывести на экран хеш, ключами которого являются названия товаров,
# а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара.
# Также вывести итоговую сумму за каждый товар.
# Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".

goods = Hash.new "product doesn't exist"

puts 'Enter goods'

loop do
  print "\nName:(stop to stop) "
  name = gets.chomp.to_sym

  break if name == :stop

  print 'Cost: '
  cost = gets.chomp.to_i
  print 'Amount: '
  amount = gets.chomp.to_f

  goods[name.capitalize] = { cost: cost, amount: amount }
end

puts
total_sum = 0
goods.each do |name, info|
  cost = info[:cost]
  amount = info[:amount]
  sum = cost * amount
  total_sum += sum

  puts "#{name}: cost #{cost}, amount #{amount}. Sum = #{sum}"
end

puts "Total sum - #{total_sum}"
