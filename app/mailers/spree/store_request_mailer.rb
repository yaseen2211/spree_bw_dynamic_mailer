class Spree::StoreRequestMailer < ApplicationMailer

	def store_request_thankyou(store_request)
		@request_info = store_request
		mail(to: "omsolutionpk@gmail.com",cc:'p136011@nu.edu.pk', subject: "Vendor Registeration Request.")
	end
end
