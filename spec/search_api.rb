require 'spec_helper'
require_relative '../search_api'

describe 'Sinatra app' do
  describe 'GET /query' do
    it 'returns a JSON response with search results default full_name' do
      get '/query?q=John'
      expect(last_response.status).to eq(200)
      expect(last_response.content_type).to eq('application/json')
      expect(JSON.parse(last_response.body)).to eq([
                                                     { 'id' => 1, 'full_name' => 'John Doe', 'email' => 'john.doe@gmail.com' },
                                                     { 'id'=>3, 'full_name'=>'Alex Johnson', 'email'=>'alex.johnson@hotmail.com' }
                                                   ])
    end

    it 'returns a JSON response with search results with full_name' do
      get '/query?q=John&field=full_name'
      expect(last_response.status).to eq(200)
      expect(last_response.content_type).to eq('application/json')
      expect(JSON.parse(last_response.body)).to eq([
                                                     { 'id' => 1, 'full_name' => 'John Doe', 'email' => 'john.doe@gmail.com' },
                                                     { 'id'=>3, 'full_name'=>'Alex Johnson', 'email'=>'alex.johnson@hotmail.com' }
                                                   ])
    end

    it 'returns a JSON response with search results with email' do
      get '/query?q=John&field=email'
      expect(last_response.status).to eq(200)
      expect(last_response.content_type).to eq('application/json')
      expect(JSON.parse(last_response.body)).to eq([
                                                     { 'id' => 1, 'full_name' => 'John Doe', 'email' => 'john.doe@gmail.com' },
                                                     { 'id'=>3, 'full_name'=>'Alex Johnson', 'email'=>'alex.johnson@hotmail.com' }
                                                   ])
    end

    it 'returns a JSON response with search results with id' do
      get '/query?q=10&field=id'
      expect(last_response.status).to eq(200)
      expect(last_response.content_type).to eq('application/json')
      expect(JSON.parse(last_response.body)).to eq([
                                                     { 'id' => 10, 'full_name' => 'Michael Brown', 'email' => 'michael.brown@inbox.com' }
                                                   ])
    end

    it 'returns a 400 response if no query parameter is provided' do
      get '/query'
      expect(last_response.status).to eq(400)
      expect(last_response.body).to eq('Bad Request: Please provide a query parameter (q).')
    end
  end
end
