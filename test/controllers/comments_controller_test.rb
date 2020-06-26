require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest

  test "should redirect create when not logged in" do
    log_in_as(@user)
    assert_difference 'Comment.count', 1 do
      post comments_path, params: { comment: { comment: "Lorem ipsum"},
                                   photo_id: 1 }
    end
    assert_redirected_to photo_path(id: 1)
  end
end
