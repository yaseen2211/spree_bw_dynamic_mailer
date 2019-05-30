Spree::OrderMailer.class_eval do
	 
  def confirm_email(order, resend = false)
    @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
    finder_obj = Spree::Email::EmailDynamic.finder("order-complete","Spree::Order")
    finder_obj.translations.inspect
    I18n.locale = :en
    subject = finder_obj.subject
    single_replace_temp = Spree::Email::EmailDynamic.make_dynamic([@order],finder_obj.template)
    partial_hash = {"order_details" => {:order => Spree::Order.last, :product => Spree::Product.last}}
    @replaced_temp =  Spree::Email::EmailDynamic.detailed_dynamic(partial_hash, single_replace_temp,'/spree/order_mailer/')

    mail(to: @order.email, from: from_address, subject: "Black-Line Order Confirmation <%= @order.number %>", bcc: BCC_EMAILS )
  end

end
