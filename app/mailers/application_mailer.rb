class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.dig(Rails.env.to_sym, :gmail_user_name)
  layout 'mailer'
end