require 'direct_inject/errors'
require 'direct_inject/public_api'

module DirectInject
  extend \
    self,
    PublicApi

  attr_writer :sprockets_environment

  def sprockets_environment
    if @sprockets_environment.nil?
      raise \
        Errors::NotConfigured,
        :sprockets_environment
    end

    @sprockets_environment
  end
end

require 'direct_inject/railtie' if defined?( Rails::Railtie )
