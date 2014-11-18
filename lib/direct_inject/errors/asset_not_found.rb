module DirectInject
  module Errors
    class AssetNotFound < StandardError
      attr_accessor :missing_source

      def initialize( missing_source )
        self.missing_source = missing_source
        super message_template % missing_source
      end

      def message_template
        'Unable to find "%s" in your Sprockets environment!'
      end
    end
  end
end
