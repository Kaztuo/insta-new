require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "like_notification" do
    user = users(:example_user_1)
    mail = UserMailer.like_notification(user)
    assert_equal "Instagramで投稿がお気に入りに登録されました", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match user.user_name, mail.body.encoded.split(/\r\n/).map{|i| Base64.decode64(i)}.join
  end

end
