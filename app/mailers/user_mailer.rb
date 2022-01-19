class UserMailer < ApplicationMailer
  def after_payment(user)
    @user = user
    @order = @user.orders
    # attachments['票券.jpg'] = File.read('public/Ruby 考試.jpg')
    mail(to: @user.email, subject:"付款成功！")
  end
end