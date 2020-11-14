# frozen_string_literal: true

if ENV['RAILS_ENV'] == 'test'
  require 'simplecov'
  SimpleCov.start 'rails' do
    puts 'required simplecov'
    add_filter 'app/channels/'
    add_filter 'app/jobs/'
    add_filter 'app/mailers/'
  end
end
