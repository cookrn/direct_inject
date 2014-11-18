require 'test_helper'

class ImageTest < ActionDispatch::IntegrationTest
  test 'renders image inline' do
    get 'test/image'
    assert_response :success
  end
end
