require 'direct_inject/templates/abstract'

module DirectInject
  module Templates
    class Javascript < Abstract
      def render
        tagz { script_( tag_options( options ) ){ source } }
      end
    end
  end
end
