require File.expand_path('../boot', __FILE__)

require 'rails'

%w(
  action_controller
  action_view
  rails/test_unit
  sprockets
).each do | framework |
  begin
    require "#{ framework }/railtie"
  rescue LoadError
  end
end

Bundler.require(*Rails.groups)
require 'direct_inject'

module Dummy
  class Application < Rails::Application
  end
end

