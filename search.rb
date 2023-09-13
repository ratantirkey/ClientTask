# frozen_string_literal: true

require_relative 'client/client'

if __FILE__ == $PROGRAM_NAME
  if ARGV.empty?
    puts 'Usage: ruby main.rb <search> <search data>'
    puts 'Usage: ruby main.rb <find_duplicates>'
    exit(1)
  elsif (ARGV.length != 2) && ARGV.include?('search')
    puts 'Usage: ruby main.rb <search> <search data>'
    exit(1)
  end

  command = ARGV[0]
  query = ARGV[1]

  data = raw_data

  case command.downcase
  when 'search'
    search_clients(data, query)
  when 'find_duplicates'
    find_duplicates(data)
  else
    puts "Invalid command. Use 'search' or 'find_duplicates'."
  end
end
