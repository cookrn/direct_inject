module DirectInject
  module Rails
    module ViewHelpers
      def direct_inject_image( *sources )
        DirectInject.render_image( *sources ).html_safe
      end

      def direct_inject_javascript( *sources )
        DirectInject.render_javascript( *sources ).html_safe
      end

      def direct_inject_stylesheet( *sources )
        DirectInject.render_stylesheet( *sources ).html_safe
      end
    end
  end
end
