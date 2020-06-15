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
end