# ClientTask
 It's plain ruby search program from command-line | Linux Terminal
 1) run ruby search.rb
 2) run ruby search_api.rb
 3) run ruby search_json.rb
 4) run ruby search_json_value.rb
 5) run rspec spec/* or run bundle exec rspec spec/*

## Table of contents
* [search](#search-info)
* [search_api](#search_api-info)
* [search_json](#search_json-info)
* [search_json_value](#search_json_value-info)
* [test cases](#test_cases-info)

## Search info
* run ruby search.rb
* run ruby search.rb <search> <search data> | for e.g. ruby search.rb search emma
* run ruby search.rb find_duplicates

## Search_api info
* bundle install
* run ruby search_api.rb
* two search field is added 1)q = any data 2)field = < full_name / email / id >
* open browser type http://localhost:3000/query
* open browser type http://localhost:3000/query?q=john
* open browser type http://localhost:3000/query?q=john&field=full_name
* open browser type http://localhost:3000/query?q=john&field=email
* open browser type http://localhost:3000/query?q=1&field=id

## Search_json info
* ruby search_json.rb
* Enter the path to the JSON file . for eg. ./client/client.json
* Enter the field to search for . for eg. full_name

## Search_json_value info
* ruby search_json_value.rb
* Enter the path to the JSON file . for eg. ./client/client.json
* Enter the field to search for . for eg. full_name
* Enter the value to search for . for eg. john

## Test Cases info
* Four test cases added 1)spec/client.rb 2) spec/search.rb 3) spec/search_api.rb 4) spec/search_json.rb 5) spec/search_json_value.rb
* run rspec spec/client.rb or spec/search.rb or spec/search_api.rb or spec/search_json.rb or spec/search_json_value.rb
* run bundle exec rspec spec/client.rb or spec/search.rb or spec/search_api.rb or spec/search_json.rb or spec/search_json_value.rb
* run spec/*