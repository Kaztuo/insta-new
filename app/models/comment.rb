class Comment < ApplicationRecord
  belongs_to :photo
  validates :comment, presence: true
  has_many :notifications, dependent: :destroy
  
  def create_notification_comment!(current_user, photo_id, comment_id, visited_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る?
    temp_ids = Comment.select(:user_id).where(photo_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, photo_id, comment_id, visited_id)
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, photo_id, comment_id, visited_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, photo_id, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
                                                          photo_id: photo_id,
                                                          comment_id: comment_id,
                                                          visited_id: visited_id,
                                                          action: 'comment'
                                                        )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
