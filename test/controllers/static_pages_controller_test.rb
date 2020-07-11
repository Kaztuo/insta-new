# frozen_string_literal: true

require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get home' do
    get root_path
    assert_response :success
    assert_select 'title', 'Instagram App'
    assert_template layout: 'layouts/application'
    assert_template 'static_pages/home'
    assert_select 'body'
  end

  test 'should get terms_of_use' do
    get terms_path
    assert_response :success
  end
end
