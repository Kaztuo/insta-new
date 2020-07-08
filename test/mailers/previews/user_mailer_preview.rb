# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/notification
  def like_notification
    user = User.first
    UserMailer.like_notification(user)
  end

  def comment_notification
    user = User.first
    UserMailer.comment_notification(user)
  end
end
