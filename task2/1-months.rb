# Сделать хеш, содержащий месяцы и количество дней в месяце. В цикле выводить те месяцы, у которых количество дней ровно 30

require_relative 'months_duration'

MONTHS.each do |month, days|
  puts month if days == 30
end
