require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Instagram App"
  end

  test "should get terms_of_use" do
    get terms_path
    assert_response :success
  end

end
