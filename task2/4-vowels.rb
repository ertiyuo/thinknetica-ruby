# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

vowels = [:a, :e, :i, :o, :u, :y]
vowel_indexes = Hash.new('not a vowel')

(:a..:z).each_with_index do |letter, index|
  vowel_indexes[letter] = index + 1 if vowels.include? letter
end

vowel_indexes.each do |key, value|
  puts "#{key} - #{value}"
end
