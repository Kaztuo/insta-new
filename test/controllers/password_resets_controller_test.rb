# frozen_string_literal: true

require 'test_helper'

class PasswordResetsControllerTest < ActionDispatch::IntegrationTest
  # def setup
  #   @user = users(:example_user_1)
  # end

  test 'should get edit' do
    get edit_password_reset_path(@user)
    assert_response :success
  end
end
