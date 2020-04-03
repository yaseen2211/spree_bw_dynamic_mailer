class Spree::AuctionMailer < ApplicationMailer

	def sold_notification_to_vendor(auction,vendor_email)
		@vendor_email = vendor_email
		@auction       = auction
		mail(to: @vendor_email , subject: "Sold Auction Notification.")
	end

end
