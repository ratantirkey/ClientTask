require 'spec_helper'
require_relative '../search_json'

describe 'parse_json_file' do
  it 'should return a hash when given a valid JSON file' do
    file_path = 'spec/fixtures/clients.json'
    expect(parse_json_file(file_path).first(2)).to eq([{'id' => 1, 'full_name' => 'John Doe', 'email' => 'john.doe@gmail.com'}, {'id' => 2, 'full_name' => 'Jane Smith', 'email' => 'jane.smith@yahoo.com'}])
  end

  it 'should raise an error when given an invalid JSON file' do
    file_path = 'spec/fixtures/invalid_clients.json'
    expect(parse_json_file(file_path)) .to raise_error(StandardError, /Error reading JSON file:/)
  end
end

describe 'search_json' do
  it 'should return an array of results when given a valid JSON data and a field to search' do
    json_data = [{ 'name' => 'John' }, { 'name' => 'Jane' }]
    field_to_search = 'name'
    expect(search_json(json_data, field_to_search)).to eq(['John', 'Jane'])
  end

  it 'should return an empty array when given an empty JSON data and a field to search' do
    json_data = []
    field_to_search = 'name'
    expect(search_json(json_data, field_to_search)).to eq([])
  end

  it 'should return an empty array when given a JSON data with no matching field' do
    json_data = [{ 'name' => 'John' }, { 'age' => 30 }]
    field_to_search = 'email'
    expect(search_json(json_data, field_to_search)).to eq([])
  end
end

describe 'parse_json_file' do
  it 'should print a message when given an invalid JSON file' do
    allow(STDIN).to receive(:gets).and_return('spec/fixtures/invalid_clients.json', 'name')
    expect { parse_json_file('fixtures/invalid_clients.json') }.to output("Error: Invalid JSON file.\n").to_stdout
  end

  it 'should print a message when given a valid JSON file and no matching field' do
    allow(STDIN).to receive(:gets).and_return('spec/fixtures/clients.json', 'name')
    expect { parse_json_file('fixtures/clients.json') }.to output("No results found for name.\n").to_stdout
  end

  it 'should print the results when given a valid JSON file and a matching field' do
    allow(STDIN).to receive(:gets).and_return('spec/fixtures/clients.json', 'name')
    expect { parse_json_file('fixtures/clients.json') }.to output("Results for name:\nJohn\nJane\n").to_stdout
  end
end
