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
end





