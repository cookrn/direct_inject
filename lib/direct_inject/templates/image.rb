require 'direct_inject/templates/abstract'

module DirectInject
  module Templates
    class Image < Abstract
      def render
        tagz { img_ tag_options( options ).merge( :src => source ) }
      end
    end
  end
end
