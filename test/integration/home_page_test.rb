# frozen_string_literal: true

require 'test_helper'

class HomePageTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:example_user_1)
  end

  test 'comment to photo' do
    log_in_as(@user)
    get root_path
    assert_difference 'Comment.count', 1 do
      post comments_path, params: { comment: { comment: 'test' },
                                    photo_id: 1 }
    end
    assert assigns(:comment).comment
    # follow_redirect!
    # assert_match comment, response.body
  end
end
