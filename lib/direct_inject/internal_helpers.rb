require 'base64'
require 'direct_inject'
require 'direct_inject/errors'
require 'map'
require 'uri'

module DirectInject
  module InternalHelpers
    ASSET_EXTENSIONS =
      {
        :javascript => '.js',
        :stylesheet => '.css'
      }

    private

    def data_uri_for( asset )
      prefix  = "data:#{ asset.content_type };base64,"
      encoded = Base64.encode64( asset.to_s ).gsub( /\s+/ , '' )
      "#{ prefix }#{ URI.encode_www_form_component encoded }"
    end

    def asset_for!( source , options )
      environment =
        options.delete 'sprockets_environment' do
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
