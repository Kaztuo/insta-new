require 'test_helper'

class NotificationPageTest < ActionDispatch::IntegrationTest
  test "Add likes on photos" do
    log_in_as(@user)
    get root_path
    assert_template 'static_pages/home'
    assert_select "input", value: "いいね"
    photo = photos(:Example_photos_three)
    #いいねをおす
    post likes_path(photo_id: photo.id)
    assert_redirected_to root_path
    follow_redirect!
    assert_template 'static_pages/home'
    assert_select "input", value: "いいねを取り消す"
    
    #通知を確認する
    delete logout_path
    log_in_as(users(:example_user_3))
    get notifications_path
    assert_select "a","さんが" 
  end
end
