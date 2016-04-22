$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rspec'
require 'webmock'

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
  add_filter 'spec'
  add_group 'Libraries', 'lib'
end

require 'store_scraper'
