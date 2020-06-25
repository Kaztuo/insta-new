# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/notification
  def like_notification
    UserMailer.like_notification
  end
  
  def comment_notification
    UserMailer.comment_notification
  end
end
