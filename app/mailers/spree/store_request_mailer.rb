class Spree::StoreRequestMailer < ApplicationMailer

	def store_request_thankyou(store_request)
		@request_info = store_request
		mail(to: "omsolutionpk@gmail.com", subject: "Vendor Registeration Request.")
	end

	def response_to_owner(store_request)
		@request_info = store_request
		mail(to: @request_info. contact_email_address , subject: "Store Request Response")
	end
end
