class User < ApplicationRecord
  has_many :photos, dependent: :destroy
  has_many :active_relationships,  class_name: "Relationship",
                                  foreign_key: "follower_id",
                                    dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                  foreign_key: "followed_id",
                                    dependent: :destroy
                                   
  has_secure_password
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships #, source: :follower 
                                                       #Railsが「followers」を単数形にして
                                                       #自動的に外部キーfollower_idを探してくれる

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  # ユーザーをフォローする
  def follow(other_user)
    following << other_user
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end
  # 現在のユーザーがフォローされてたらtrueを返す  
  def followed?(other_user)
    followers.include?(other_user)
  end
  
end