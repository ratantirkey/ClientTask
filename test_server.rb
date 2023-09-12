require 'sinatra'
set :port, 3000

get '/' do
  'Hello World'
end

get '/:test' do
  content_type :json
  {param: params[:test], query: params[:query]}.to_json
end
