# frozen_string_literal: true
require_relative 'client_helper'
require 'json'

def search_data(data, field, value)
  value = filter_att(value)
  field = filter_att(field)
  value =
    case field
    when 'id'
      return data.select { |item| item[field].to_s&.include?(value.to_s) }
    when 'full_name'
      value.capitalize
    when 'email'
      value.downcase
    else
      value.capitalize
    end
  data.select { |item| item[field]&.include?(value) }
end

def search_clients(data, query)
  matching_clients = data.select { |client| client['full_name']&.downcase&.include?(query&.downcase) }
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
