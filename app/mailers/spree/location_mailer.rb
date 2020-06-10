class Spree::LocationMailer < ApplicationMailer
	def assigned_notification_to_vendor(location,vendor_emails)
		@vendor_emails = vendor_emails
		@location     = location
		mail(to: @vendor_emails , subject: "New Location Assign Notification")
	end
end
