require 'test_helper'

class StylesheetTest < ActionDispatch::IntegrationTest
  test 'renders stylesheet inline' do
    get 'test/stylesheet'
    assert_response :success
  end
end
