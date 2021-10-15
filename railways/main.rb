# frozen_string_literal: false

Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each { |f| load(f) }

available_actions = Railways::ACTIONS.merge({ exit: 'exit' })

print "Welcome to the railways. You can:\n"
available_actions.each { |_key, action| puts "- #{action}" }
print "\nWhat do you want to do? "

railways = Railways.new

loop do
  action = gets.chomp

  if available_actions.value?(action)
    break if action == available_actions[:exit]

    railways.send available_actions.key action
    print 'What next? '
  else
    print 'Wrong command, try again: '
  end
end

puts "\nResult is #{railways.inspect}"
