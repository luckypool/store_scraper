$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'store_scraper'
require 'rspec'

require 'simplecov'
require 'coveralls'

Coveralls.wear!

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.start do
  add_filter '.bundle/'
  add_filter 'vendor'
end
