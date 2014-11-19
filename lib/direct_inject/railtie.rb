require 'direct_inject/rails/view_helpers'
require 'rails/railtie'

module DirectInject
  class Railtie < ::Rails::Railtie
    initializer 'direct_inject.sprockets_environment' do | app |
      DirectInject.sprockets_environment = app.assets
    end

    initializer 'direct_inject.view_helpers' do
      ActiveSupport.on_load :action_view do
        include DirectInject::Rails::ViewHelpers
      end
    end
  end
end
