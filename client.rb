require 'json'

def parse_json_file(file_path)
  begin
    json_data = File.read(file_path)
    JSON.parse(json_data)
  rescue StandardError => e
    puts "Error reading JSON file: #{e.message}"
    exit(1)
  end
end

def search_clients(data, query)
  matching_clients = data.select { |client| client['full_name']&.downcase&.include?(query) }
  matching_clients.each do |client|
    puts "ID: #{client['id']}, Name: #{client['full_name']}, Email: #{client['email']}"
  end
end

def find_duplicates(data)
  email_counts = Hash.new(0)
  duplicate_clients = []

  data.each do |client|
    email = client['email']
    duplicate_clients << client if (email_counts[email]).positive?
    email_counts[email] += 1
  end

  if duplicate_clients.empty?
    puts 'No duplicate clients found.'
  else
    puts 'Duplicate clients found:'
    duplicate_clients.each do |client|
      puts "ID: #{client['id']}, Name: #{client['full_name']}, Email: #{client['email']}"
    end
  end
end
