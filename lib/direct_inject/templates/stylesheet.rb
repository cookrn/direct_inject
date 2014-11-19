require 'direct_inject/templates/abstract'

module DirectInject
  module Templates
    class Stylesheet < Abstract
      def render
        tagz { style_( tag_options options ){ source } }
      end
    end
  end
end
