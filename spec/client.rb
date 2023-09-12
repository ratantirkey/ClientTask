require 'spec_helper'
require_relative '../client/client'

RSpec.describe 'client' do
  let(:data) do
    [
      { 'id' => 1, 'full_name' => 'John Doe', 'email' => 'john.doe@example.com' },
      { 'id' => 2, 'full_name' => 'Jane Smith', 'email' => 'jane.smith@example.com' },
      { 'id' => 3, 'full_name' => 'Bob Johnson', 'email' => 'bob.johnson@example.com' }
    ]
  end

  describe '#search_data' do
    it 'returns an empty array when no matching data is found' do
      result = search_data(data, 'id', 4)
      expect(result).to be_empty
    end

    it 'returns an array of matching data' do
      result = search_data(data, 'id', 1)
      expect(result).to eq([{ 'id' => 1, 'full_name' => 'John Doe', 'email' => 'john.doe@example.com' }])
    end

    it 'capitalizes the full_name field' do
      result = search_data(data, 'full_name', 'jane')
      expect(result).to eq([{ 'id'=> 2, 'full_name'=> 'Jane Smith', 'email'=> 'jane.smith@example.com' }])
    end

    it 'downcases the email field' do
      result = search_data(data, 'email', 'jane.smith@example.com')
      expect(result).to eq([{ 'id'=> 2, 'full_name'=> 'Jane Smith', 'email'=> 'jane.smith@example.com' }])
    end
  end

  describe '#search_clients' do
    it 'returns an empty array when no matching clients are found' do
      result = search_clients(data, 'Jamie')
      expect(result).to be_empty
    end

    it 'returns an array of matching clients' do
      result = search_clients(data, 'Doe')
      expect(result).to eq([{"id"=>1, "full_name"=>"John Doe", "email"=>"john.doe@example.com"}])
    end
  end

  describe '#find_duplicates' do
    it 'returns an error message when no duplicate clients are found' do
      result = find_duplicates([
                                { 'id'=> 1, 'full_name'=> 'John Doe', 'email'=> 'john.doe@example.com' },
                                { 'id'=> 2, 'full_name'=> 'Jane Smith', 'email'=> 'jane.smith@example.com' }
                              ])
      expect(result).to be_nil
    end

    it 'returns an array of duplicate clients' do
      result = find_duplicates([
                                { 'id'=> 1, 'full_name'=> 'John Doe', 'email'=> 'john.doe@example.com' },
                                { 'id'=> 2, 'full_name'=> 'Jane Smith', 'email'=> 'jane.smith@example.com' },
                                { 'id'=> 3, 'full_name'=> 'Bob Johnson', 'email'=> 'bob.johnson@example.com' },
                                { 'id'=> 4, 'full_name'=> 'Bob Johnson', 'email'=> 'bob.johnson@example.com' }
                              ])
      expect(result).to eql([{"id"=>4, "full_name"=>"Bob Johnson", "email"=>"bob.johnson@example.com"}])
    end
  end
end