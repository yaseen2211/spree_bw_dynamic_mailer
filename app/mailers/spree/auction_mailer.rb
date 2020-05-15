class Spree::AuctionMailer < ApplicationMailer

	def sold_notification_to_vendor(auction,vendor_email)
		@vendor_email = vendor_email
		@auction       = auction
		mail(to: @vendor_email , subject: "Sold Auction Notification.")
	end
	def sold_notification_to_winner(auction,winner_email)
		@winner_email = winner_email
		@auction       = auction
		mail(to: @winner_email , subject: "Win Auction Notification.")
	end

end
