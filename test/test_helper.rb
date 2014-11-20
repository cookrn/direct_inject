ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb',  __FILE__)
require 'rails/test_help'

require 'minitest/hell'
require 'minitest/pride'

Rails.backtrace_cleaner.remove_silencers!

# Comment out this line to turn the `test` log level back to `debug`
Rails.logger.level = 4

# Load support files
Dir[ "#{ File.dirname __FILE__ }/support/**/*.rb" ].each { |f| require f }

require 'nokogiri'
