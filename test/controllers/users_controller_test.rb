# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:example_user_1)
    @other_user = users(:example_user_2)
  end

  test 'should get new' do
    get signup_path
    assert_response :success
  end

  # test "should redirect following when not logged in" do
  #   get following_user_path(@user)
  #   assert_redirected_to login_url
  # end

  # test "should redirect followers when not logged in" do
  #   get followers_user_path(@user)
  #   assert_redirected_to login_url
  # end
end
