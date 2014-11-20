require 'test_helper'

class DirectInjectTest < ActiveSupport::TestCase
  test 'has api methods' do
    %i(
      render_image
      render_javascript
      render_stylesheet
    ).each do | public_api_method |
      assert_respond_to \
        DirectInject,
        public_api_method
    end
  end

  test 'does not respond to internal helpers' do
    # a sample of the internal helper methods
    %i(
      asset_for!
      data_uri_for
      render
    ).each do | public_api_method |
      refute_respond_to \
        DirectInject,
        public_api_method
    end
  end

  test 'has a sprockets_environment accessor' do
    old_env = DirectInject.sprockets_environment

    assert_respond_to \
      DirectInject,
      :sprockets_environment

    env = Object.new

    assert_respond_to \
      DirectInject,
      :sprockets_environment=

    DirectInject.sprockets_environment = env

    assert_equal \
      env,
      DirectInject.sprockets_environment

    DirectInject.sprockets_environment = old_env
  end
end
