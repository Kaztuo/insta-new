require 'test_helper'

class HomePageTest < ActionDispatch::IntegrationTest
  test "upload empty photo" do
    log_in_as(@user)
    get root_path
    assert_no_difference 'Photo.count' do
      post comments_path, params: { comment: { comment: "" } }
    end
  end
end
