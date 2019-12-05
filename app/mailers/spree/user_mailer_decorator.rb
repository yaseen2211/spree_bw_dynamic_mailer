module Spree
  module UserMailerDecorator 
    def welcome(user,token)
      @user = user
      finder_obj = Spree::Email::EmailDynamic.finder("welcome","Spree::User")
      subject = finder_obj.subject
      @single_replace_temp = Spree::Email::EmailDynamic.make_dynamic([@user],finder_obj.template)
      @vendor_password_reset_url = spree.edit_spree_user_password_url(reset_password_token: token, host: Spree::Store.current.url)
      mail(to: @user.email, from: from_address, subject: "Welcome to Tim Auction")
    end
    def vendor_welcome(user, token)
      @vendor_password_reset_url = spree.edit_spree_user_password_url(reset_password_token: token, host: Spree::Store.current.url)
      @user = user
      mail(to: @user.email, from: from_address, subject: "Tim Auction, Request for Change Account Credentials", bcc: BCC_EMAILS)
    end
  end
end
::Spree::UserMailer.prepend(Spree::UserMailerDecorator)



