class OrderMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def order_receipt_email(order)
    @order = order
    @order_details = order.line_items
    mail(to: order.email, subject: "Jungle purchase receipt for order no. #{ order.id }")
  end
end
