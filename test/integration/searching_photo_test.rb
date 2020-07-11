# frozen_string_literal: true

require 'test_helper'

class SearchingPhotoTest < ActionDispatch::IntegrationTest
  test 'search photo interface' do
    log_in_as(@user)
    # imagephoto = fixture_file_upload('test/fixtures/test_photo.jpg', 'image/jpg')
    # post photos_path, params: { photo: { image: imagephoto} }
    # post comments_path, params: { comment: { comment: 'comment search test'},
    #                             photo_id: 1 }

    get root_path
    assert_select 'input[type="text"]'
    # 空送信
    get '/comments/search', params: { searching_comment: '' }
    assert_template 'comments/search'
    assert_select '.alert-danger'
    # 存在しないコメント検索
    get '/comments/search', params: { searching_comment: 'unexist comment' }
    assert_template 'comments/search'
    assert_select '.alert-danger'
    # 存在するコメント検索
    # get '/comments/search', params: { searching_comment: 'comment search test', photo_id: 1 }
    # assert_template 'comments/search'
    # assert_select 'td'
  end
end
