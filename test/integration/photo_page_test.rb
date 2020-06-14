require 'test_helper'

class PhotoPageTest < ActionDispatch::IntegrationTest
  
  
  test "photo upload" do
    log_in_as(@user)
    get new_photo_path
    assert_select 'input[type=file]'
    assert_select 'input[type=submit]'
    assert_no_difference 'Photo.count' do
      post photos_path, params: { photo: { image: "", id: "" } }
    end
  end
end
