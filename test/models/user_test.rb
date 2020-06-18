require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "should follow and unfollow a user" do
    user1 = users(:example_user_1)
    user2  = users(:example_user_2)
    assert_not user1.following?(user2)
    user1.follow(user2)
    assert user1.following?(user2)
    assert user2.followed?(user1)    
    user1.unfollow(user2)
    assert_not user1.following?(user2)
  end
  
  test "feed should have the right posts" do
    user1 = users(:example_user_1)
    user2  = users(:example_user_2)
    user3  = users(:example_user_3)
    # フォローしているユーザーの投稿を確認
    user3.photos.each do |post_following|
      assert user1.feed.include?(post_following)
    end
    # 自分自身の投稿を確認
    user1.photos.each do |post_self|
      assert_not user1.feed.include?(post_self)
    end
    # フォローしていないユーザーの投稿を確認
    user2.photos.each do |post_unfollowed|
      assert_not user1.feed.include?(post_unfollowed)
    end
  end
end