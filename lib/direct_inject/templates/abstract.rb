require 'map'
require 'tagz'

Tagz.i_know_what_the_hell_i_am_doing!

module DirectInject
  module Templates
    class Abstract
      include Tagz

      def self.render( *args , &block )
        new( *args , &block ).render
      end

      attr_reader \
        :source,
        :options

      def initialize( source , options )
        @source  = source
        @options = options
      end

      def tag_options( options )
        map_options = Map.for options
        options_keys = map_options.depth_first_keys.map { | k | k.map( &:to_s ).join '-' }
        Hash[ options_keys.zip map_options.depth_first_values ]
      end
    end
  end
end
