require 'test_helper'

class DirectInjectApiTest < ActiveSupport::TestCase
  test 'apis' do
    tests =
      [
        {
          :api     => :render_image,
          :matches => [ /base64/ , /image\/png/ , /iVBORw0KGgoAAAANSUhEUgAAAncAAANrCA/ ],
          :source  => 'face.png',
          :tag     => 'img',
          :type    => 'image'
        },

        {
          :api     => :render_javascript,
          :matches => [ /alert/ , /\d+/ ],
          :source  => 'main',
          :tag     => 'script',
          :type    => 'javascript'
        },

        {
          :api     => :render_stylesheet,
          :matches => [ /div span\.highlight/ , /yellowgreen/ ],
          :source  => 'site',
          :tag     => 'style',
          :type    => 'stylesheet'
        }
      ]

    tests.each do | test |
      result =
        DirectInject.send \
          test.fetch( :api ),
          test.fetch( :source ),
          :sprockets_environment => LOCAL_SPROCKETS,
          :class => 'wat'

      assert \
        test.fetch( :matches ).all? do | regexp |
          result =~ regexp
        end

      el = Nokogiri::HTML::DocumentFragment.parse( result ).children.first

      assert_equal \
        test.fetch( :tag ),
        el.name

      expected_keys =
        %w(
          class
          data-direct_inject_source
          data-direct_inject_type
        )

      expected_keys.each do | expected_key |
        assert_includes \
          el.attributes.keys,
          expected_key
      end

      refute_includes \
        el.attributes.keys,
        'sprockets_environment'

      assert_equal \
        test.fetch( :source ),
        el.attributes.fetch( 'data-direct_inject_source' ).value

      assert_equal \
        test.fetch( :type ),
        el.attributes.fetch( 'data-direct_inject_type' ).value
    end
  end
end
