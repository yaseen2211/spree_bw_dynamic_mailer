Spree::UserMailer.class_eval do


  def welcome(user)
    @user = user
    finder_obj = Spree::Email::EmailDynamic.finder("welcome","Spree::User")
    finder_obj.translations.inspect
    I18n.locale = :en
    subject = finder_obj.subject
    @single_replace_temp = Spree::Email::EmailDynamic.make_dynamic([@user],finder_obj.template)
    mail(to: @user.email, from: from_address, subject: subject)
  end


  def vendor_welcome(user, token)
    @vendor_password_reset_url = spree.edit_spree_user_password_url(reset_password_token: token, host: Spree::Store.current.url)
    @user = user
    mail(to: @user.email, from: from_address, subject: "Request for Change Account Credentials")
  end


end






