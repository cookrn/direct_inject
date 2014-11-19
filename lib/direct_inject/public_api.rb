require 'direct_inject/internal_helpers'
require 'direct_inject/templates'
require 'map'

module DirectInject
  module PublicApi
    include InternalHelpers

    def render_image( *sources )
      render *sources do | asset , options |
        options.set \
          'data',
          'direct_inject_type',
          'image'

        encoded = data_uri_for asset

        Templates::Image.render \
          encoded,
          options
      end
    end

    def render_javascript( *sources )
      options = Map.opts! sources

      options.set \
        'type',
        :javascript

      sources.push options

      render *sources do | asset , options |
        options.set \
          'data',
          'direct_inject_type',
          'javascript'

        options.set \
          'type',
          'text/javascript'

        Templates::Javascript.render \
          asset.to_s,
          options
      end
    end

    def render_stylesheet( *sources )
      options = Map.opts! sources

      options.set \
        'type',
        :stylesheet

      sources.push options

      render *sources do | asset , options |
        options.set \
          'data',
          'direct_inject_type',
          'stylesheet'

        options.set \
          'type',
          'text/css'

        Templates::Stylesheet.render \
          asset.to_s,
          options
      end
    end
  end
end
