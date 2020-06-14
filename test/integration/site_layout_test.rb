require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # def setup
  #   @user = users(:example_user_one)
  # end
  
  test "layout links" do
    log_in_as(@user)
    get root_path
    assert_template 'static_pages/home'
    assert_select 'a[href=?]', root_path, count: 2
  end
end
