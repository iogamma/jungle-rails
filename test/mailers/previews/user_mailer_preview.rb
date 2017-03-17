
class UserMailerPreview < ActionMailer::Preview
  def order_receipt_email
    UserMailer.order_receipt_email(Order.first)
  end
end