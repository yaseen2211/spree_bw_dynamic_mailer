class Spree::StoreRequestMailer < BaseMailer

	def response_to_admin(store_request)
		@request_info = store_request
		mail(to: "sysadmin@black-line.ae", subject: "Black-Line, New Vendor Registeration Request.", bcc: BCC_EMAILS)
	end

	def response_to_owner(store_request)
		@request_info = store_request
		mail(to: @request_info. contact_email_address , subject: "Amazing Designer, Thank-you For Contacting Black-Line", bcc: BCC_EMAILS)
	end
end
