class UserMailer < ApplicationMailer

  def like_notification(receive_user)
    @user = receive_user
    mail to: receive_user.email, subject: "Instagramで投稿がお気に入りに登録されました"
  end
  
  def comment_notification(receive_user)
    @user = receive_user
    mail to: receive_user.email, subject: "Instagramで投稿にコメントがつきました"
  end
end
