require 'direct_inject'
require 'direct_inject/errors'
require 'map'

module DirectInject
  module InternalHelpers
    ASSET_EXTENSIONS =
      {
        :javascript => '.js',
        :stylesheet => '.css'
      }

    private

    def asset_for!( source , options )
      environment =
        options.fetch 'sprockets_environment' do
          DirectInject.sprockets_environment
        end

      path = source

      if extname = compute_asset_extname( path , options )
        path = "#{ path }#{ extname }"
      end

      asset = environment.find_asset path

      if asset.nil?
        raise Errors::AssetNotFound , source
      end

      asset
    end

    def compute_asset_extname(source, options = {})
      return if options[ :extname ] == false
      extname = options[ :extname ] || ASSET_EXTENSIONS[ options[ :type ] ]
      extname if extname && File.extname( source ) != extname
    end

    def image_prefix_for( asset )
      "data:image/#{ asset.pathname.extname[ 1 .. -1 ] };base64,"
    end

    def render( *sources )
      options = Map.opts! sources

      sources.map do | source |
        asset = asset_for! source , options

        options.set \
          'data',
          'direct_inject_source',
          source

        if block_given?
          yield( asset , options ).to_s
        else
          ''
        end
      end.join "\n"
    end
  end
end
