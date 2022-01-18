class UserMailer < ApplicationMailer
  def after_payment(user)
    @user = user
    # attachments['票券.jpg'] = File.read('public/Ruby 考試.jpg')
    mail(to: @user.email, subject:"付款成功！")
  end

  # def greeting_mails(user)
  #   @user = user
  #   mail(to: @user.email, subject:"歡迎你喔")
  # end
end