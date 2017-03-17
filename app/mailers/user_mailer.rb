class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def order_receipt_email(order)
    @user_email = order.email
    @order_number = order.id
    mail(to: @user_email, subject: 'Jungle purchase receipt for order #')
  end
end
