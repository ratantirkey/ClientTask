require_relative 'client'

if __FILE__ == $0
  if ARGV.length == 0
    puts "Usage: ruby main.rb <search> <search data>"
    puts "Usage: ruby main.rb <find_duplicates>"
    exit(1)
  elsif ARGV.length != 2 and ARGV.include? "search"
    puts "Usage: ruby main.rb <search> <search data>"
    exit(1)
  end

  file_path = "./client.json"
  command = ARGV[0]
  query = ARGV[1]

  data = parse_json_file(file_path)

  case command.downcase
  when 'search'
    search_clients(data, query)
  when 'find_duplicates'
    find_duplicates(data)
  else
    puts "Invalid command. Use 'search' or 'find_duplicates'."
  end
end