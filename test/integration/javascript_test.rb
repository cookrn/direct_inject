require 'test_helper'

class JavascriptTest < ActionDispatch::IntegrationTest
  test 'renders javascript inline' do
    get 'test/javascript'
    assert_response :success
  end
end
