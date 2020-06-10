class Spree::LocationMailer < ApplicationMailer
	def assigned_notification_to_vendor(location,vendor_email)
		@vendor_email = vendor_email
		@location     = location
		mail(to: @vendor_email , subject: "New Location Assign Notification")
	end
end
