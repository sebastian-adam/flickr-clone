class NewPostEmail < ApplicationMailer
  def notify_user(user, post)
    @user = user
    @post = post
    mail(to: @user.email, subject: "welcome")
  end
end
