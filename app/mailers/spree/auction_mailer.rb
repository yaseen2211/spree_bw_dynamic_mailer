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
	def sold_notification_to_superadmin(auction,admin_email)
		@admin_email   = admin_email
		@auction       = auction
		mail(to: @admin_email , subject: "Win Auction Notification.")
	end

	def listing_notification_to_user(auction,user_email)
		@auction    = auction
		@user_email = user_email
		mail(to: @user_email , subject: "Auction Listing Notification")
	end

	def timeline_reminder(auction,users)
		@auction    = auction
		@users      = users
		mail(to: [@users.pluck(:email)] , subject: "Auction Strat Notification")
	end

end
