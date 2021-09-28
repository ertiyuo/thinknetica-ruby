# Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
# Найти порядковый номер даты, начиная отсчет с начала года.
# Учесть, что год может быть високосным.

require_relative 'months_duration'

def get_integer_input(enter_text)
  print "#{enter_text}: "
  gets.chomp.to_i
end

def get_date_part(part_name, constraint = 0)
  input = get_integer_input part_name

  while input > constraint do
    puts "#{part_name} must be less than #{constraint}"

    input = get_integer_input part_name
  end if constraint != 0

  input
end

puts "Enter a date using numbers."

day = get_date_part 'Day', 31
month = get_date_part 'Month', 12
year = get_date_part 'Year'

day_number = day
for n in (1..month-1) do
  day_number += MONTHS.values[n-1]
end

is_leap_year = year % 400 == 0 || year % 100 != 0 && year % 4 == 0
day_number += 1 if is_leap_year && (month > 2 || month == 2 && day > 28 )

month = month < 10 ? "0#{month}" : month
date = "#{day}.#{month}.#{year}"

puts "\nDate is #{date}. Day ##{day_number} of the#{" leap" if is_leap_year} year"
