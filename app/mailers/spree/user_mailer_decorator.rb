Spree::UserMailer.class_eval do


  def welcome(user)
    @user = user
    finder_obj = Spree::Email::EmailDynamic.finder("welcome","Spree::User")
    finder_obj.translations.inspect
    I18n.locale = :en
    subject = finder_obj.subject
    social_user_name  =  @user.email.present? ? @user.email.split("@").first : ""
    (@user.first_name.blank? || @user.last_name.blank?) ? (@user.first_name = social_user_name) : "" 
    @single_replace_temp = Spree::Email::EmailDynamic.make_dynamic([@user],finder_obj.template)
    mail(to: @user.email, from: from_address, subject: "Welcome to Black-Line Your Number One Abaya Destination", bcc: BCC_EMAILS)
  end


  def vendor_welcome(user, token)
    @vendor_password_reset_url = spree.edit_spree_user_password_url(reset_password_token: token, host: Spree::Store.current.url)
    @user = user
    mail(to: @user.email, from: from_address, subject: "Black-Line, Request for Change Account Credentials", bcc: BCC_EMAILS)
  end


end






