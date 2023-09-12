def filter_att(value)
  valid_json?(value) ? JSON.parse(value) : value
end

def valid_json?(json)
  begin
    JSON.parse(json)
    return true
  rescue Exception => e
    return false
  end
end

def raw_data
  file_path = './client/client.json'
  parse_json_file(file_path)
end

def parse_json_file(file_path)
  begin
    json_data = File.read(file_path)
    JSON.parse(json_data)
  rescue StandardError => e
    puts "Error reading JSON file: #{e.message}"
    exit(1)
  end
end