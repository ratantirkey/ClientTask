# frozen_string_literal: true

require_relative 'client/client'

if __FILE__ == $PROGRAM_NAME
  puts 'Enter the path to the JSON file:'
  file_path = gets.chomp

  puts 'Enter the field to search for:'
  field_to_search = gets.chomp

  puts 'Enter the value to search for:'
  value_to_search = gets.chomp

  json_data = parse_json_file(file_path)
  results = search_data(json_data, field_to_search, value_to_search)

  if results.empty?
    puts "No results found for #{field_to_search}."
  else
    puts "Results for #{field_to_search}:"
    results.each { |result| puts result }
  end
end