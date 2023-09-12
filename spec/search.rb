require 'spec_helper'
require_relative '../search'


describe 'search_clients' do
  it 'returns an empty array when no clients match the query' do
    data = [{'id'=> 1, 'full_name'=> 'John Doe', 'email'=> 'john.doe@gmail.com'}, {'id'=> 2, 'full_name'=> 'Jane Smith', 'email'=> 'jane.smith@yahoo.com'}]
    query = 'Johny'
    expect(search_clients(data, query)).to eq([])
  end

  it 'returns an array of clients that match the query' do
    data = [{'id'=> 1, 'full_name'=> 'John Doe', 'email'=> 'john.doe@gmail.com'}, {'id'=> 2, 'full_name'=> 'Jane Smith', 'email'=> 'jane.smith@yahoo.com'}]
    query = 'Doe'
    expect(search_clients(data, query)).to eq([{'id'=> 1, 'full_name'=> 'John Doe', 'email'=> 'john.doe@gmail.com'}])
  end

  it 'returns an array of clients that match the query regardless of case' do
    data = [{'id'=> 1, 'full_name'=> 'John Doe', 'email'=> 'john.doe@gmail.com'}, {'id'=> 2, 'full_name'=> 'Jane Smith', 'email'=> 'jane.smith@yahoo.com'}]
    query = 'doe'
    expect(search_clients(data, query)).to eq([{'id'=> 1, 'full_name'=> 'John Doe', 'email'=> 'john.doe@gmail.com'}])
  end
end

describe 'find_duplicates' do
  it 'returns an empty array when there are no duplicate clients' do
    data = [{'id'=> 1, 'full_name'=> 'John Doe', 'email'=> 'john.doe@gmail.com'}, {'id'=> 2, 'full_name'=> 'Jane Smith', 'email'=> 'jane.smith@yahoo.com'}]
    expect(find_duplicates(data)).to be_nil
  end

  it 'returns an array of duplicate clients' do
    data = [{'id'=> 1, 'full_name'=> 'John Doe', 'email'=> 'john.doe@gmail.com'}, {'id'=> 2, 'full_name'=> 'Jane Smith', 'email'=> 'jane.smith@yahoo.com'}, {'id'=> 3, 'full_name'=> 'John Doe', 'email'=> 'john.doe@gmail.com'}]
    expect(find_duplicates(data)).to eq([{'id'=> 3, 'full_name'=> 'John Doe', 'email'=> 'john.doe@gmail.com'}])
  end
end

describe 'parse_json_file' do
  it 'returns an array of clients from a valid JSON file' do
    file_path = 'spec/fixtures/clients.json'
    expect(parse_json_file(file_path).first 2).to eq([{'id'=> 1, 'full_name'=> 'John Doe', 'email'=> 'john.doe@gmail.com'}, {'id'=> 2, 'full_name'=> 'Jane Smith', 'email'=> 'jane.smith@yahoo.com'}])
  end

  it 'raises an error when the JSON file is invalid' do
    file_path = 'spec/fixtures/invalid_clients.json'
    expect(parse_json_file(file_path)) .to raise_error(StandardError, /Error reading JSON file:/)
  end
end

describe 'search_data' do
  it 'returns an array of clients that match the query' do
    data = [{'id'=> 1, 'full_name'=> 'John Doe', 'email'=> 'john.doe@example.com'}, {'id'=> 2, 'full_name'=> 'Jane Smith', 'email'=> 'jane.smith@example.com'}]
    query = 'Doe'
    expect(search_data(data, 'full_name', query)).to eq([{'id'=> 1, 'full_name'=> 'John Doe', 'email'=> 'john.doe@example.com'}])
  end

  it 'returns an array of clients that match the query regardless of case' do
    data = [{'id'=> 1, 'full_name'=> 'John Doe', 'email'=> 'john.doe@example.com'}, {'id'=> 2, 'full_name'=> 'Jane Smith', 'email'=> 'jane.smith@example.com'}]
  end
end