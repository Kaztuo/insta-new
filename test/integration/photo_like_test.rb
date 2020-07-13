# frozen_string_literal: true

require 'test_helper'

class PhotoLikeTest < ActionDispatch::IntegrationTest
  test 'Push like button' do
    log_in_as(@user)
    get root_path
    assert_template 'static_pages/home'
    assert_select 'input', value: 'いいね'
    photo = photos(:Example_photos_three)
    # いいねをおす
    post likes_path(photo_id: photo.id)
    assert_redirected_to root_path
    follow_redirect!
    assert_template 'static_pages/home'
    assert_select 'input', value: 'いいねを取り消す'

    # いいねを取り消す
    delete like_path(id: Like.find_by(photo_id: photo.id).id, photo_id: photo.id)
    assert_redirected_to root_path
    follow_redirect!
    assert_template 'static_pages/home'
    assert_select 'input', value: 'いいね'
  end
end
