class Spree::AuctionMailer < ApplicationMailer

	def sold_notification_to_vendor(auction,vendor_email)
		@vendor_email = vendor_email
		@auction       = auction
		mail(to: @vendor_email , subject: "CONGRATULATIONS!! {{Vendor_name}}, {{product_name}} SOLD.")
	end
	def sold_notification_to_winner(auction)
		@auction   = auction
		@order     = @auction.try(:order)
		@user      = @order.try(:user)
		@product   = @auction.try(:product)
		@user_name = @user.email_name
		mail(to: @user.email , subject: "CONGRATULATIONS! #{@user_name}, Nice Swipe UP.")
	end
	def sold_notification_to_superadmin(auction,admin_users_emails)
		@auction              =  auction
		@order                =  @auction.try(:order)
		user                  =  @order.user
		@product              =  @auction.try(:product)
		@vendor               =  @auction.try(:vendor)
		@user_name      	  =  user.try(:email_name)
		@admin_users_emails   =  admin_users_emails
		mail(to: @admin_users_emails , subject: "DROPIT ORDER ALERT! #{@vendor.name}, #{@product.name} SOLD.")

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