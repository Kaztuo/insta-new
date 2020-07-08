# frozen_string_literal: true

require 'test_helper'

class PhotoPageTest < ActionDispatch::IntegrationTest
  test 'photo upload' do
    log_in_as(@user)
    get new_photo_path
    assert_select 'input[type=file]'
    assert_select 'input[type=submit]'

    assert_no_difference 'Photo.count' do
      post photos_path, params: { photo: { user_id: '' } }
    end

    test_image = fixture_file_upload('test/fixtures/test_photo.jpg', 'image/jpg')
    assert_difference 'Photo.count', 1 do
      post photos_path, params: { photo: { image: test_image,
                                           user_id: 3 } }
    end
    assert assigns(:upload_photo).image.attached?
  end
end
