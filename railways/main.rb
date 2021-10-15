Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each { |f| load(f) }

ACTIONS = {
    create_station: 'create station',
    print_stations: 'print stations',
    print_trains: 'print trains on station',

    create_route: 'create route',
    add_station: 'add station to route',
    remove_station: 'remove station from route',

    create_train: 'create train',
    add_carriage: 'add carriage to train',
    remove_carriage: 'remove carriage from train',
    set_route: 'set route for train',
    move_forward: 'move train forward',
    move_back: 'move train back'
  }
EXIT_ACTION = 'q'

print "Welcome to the railways. What do you want to do?\n\n"
ACTIONS.each {|key, action| puts "- #{action}"}

print "\nType command or q to exit: "
action = gets.chomp

until ACTIONS.has_value?(action) || action == EXIT_ACTION
  print "Wrong command, try again: "
  action = gets.chomp
end

return if action == EXIT_ACTION

send ACTIONS.key action
