# frozen_string_literal: true

# Заполнить массив числами фибоначчи до 100

fibonacci = [0, 1]
loop do
  x = fibonacci[-1] + fibonacci[-2]
  break if x > 100

  fibonacci << x
end

print "#{fibonacci}\n"
