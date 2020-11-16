require 'coveralls'
require 'simplecov'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [SimpleCov::Formatter::HTMLFormatter,
   Coveralls::SimpleCov::Formatter]
)

SimpleCov.start 'rails' do
  puts 'required simplecov'
  add_filter 'app/channels/'
  add_filter 'app/helpers/'
  add_filter 'app/mailers/'
end
