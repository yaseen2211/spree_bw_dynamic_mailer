module Spree
  module OrderMailerDecorator 
    def confirm_email(order, resend = false)
      @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
      subject = (resend ? "[#{Spree.t(:resend).upcase}] " : '')
      subject += "#{Spree::Store.current.name} #{Spree.t('order_mailer.confirm_email.subject')} ##{@order.number}"
      mail(to: @order.email, from: from_address, subject: 'CONGRATULATIONS!! {{first_name}}, ORDER {{Order Number}} Confirmed')
    end

    def confirm_email_to_vendor(order, resend = false)
      @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
      subject = (resend ? "[#{Spree.t(:resend).upcase}] " : '')
      subject += "#{Spree::Store.current.name} #{Spree.t('order_mailer.confirm_email.subject')} ##{@order.number}"
      mail(to: @order.email, from: from_address, subject: 'CONGRATULATIONS!! {{Vendor_name}}, ORDER {{Order Number}} Confirmed')
    end


    def cancel_email(order, resend = false)
      @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
      subject = (resend ? "[#{Spree.t(:resend).upcase}] " : '')
      subject += "#{Spree::Store.current.name} #{Spree.t('order_mailer.cancel_email.subject')} ##{@order.number}"
      mail(to: @order.email, from: from_address, subject: subject)
    end

    def not_paid_sold_auction(auction,order)
      @auction = auction
      @order   = order
      mail(to: @order.email, from: from_address, subject: "Not Paid Winning Auction Notification")
    end


    def shipping_confirmation(order)
      @order   = order
      mail(to: @order.email, from: from_address, subject: "Order Shipping Confirmation Notification")
    end

    def deliverd_notification(order)
      @order   = order
      mail(to: @order.email, from: from_address, subject: "Order Delivered Notification")
    end

  end
end
::Spree::OrderMailer.prepend(Spree::OrderMailerDecorator)
