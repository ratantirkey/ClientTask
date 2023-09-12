require_relative 'client/client'
require 'sinatra'
set :port, 3000

get '/query' do
  field = params['field'] || 'full_name'
  query = params['q'].to_s

  if query.empty?
    status 400
    body 'Bad Request: Please provide a query parameter (q).'
  else
    results = search_data(raw_data, field, query)
    content_type :json
    results.to_json
  end
end

