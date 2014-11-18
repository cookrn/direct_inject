module DirectInject
  module Errors
    class NotConfigured < StandardError
      attr_accessor :missing_property

      def initialize( missing_property )
        self.missing_property = missing_property
        super message_template % missing_property
      end

      def message_template
        'Unable to determine "%s". Please double check your configuration!'
      end
    end
  end
end
