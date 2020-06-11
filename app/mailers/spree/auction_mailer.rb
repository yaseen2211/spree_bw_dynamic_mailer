class Spree::AuctionMailer < ApplicationMailer

	# def sold_notification_to_vendor(auction,vendor_email)
	# 	@vendor_email = vendor_email
	# 	@auction       = auction
	# 	mail(to: @vendor_email , subject: "CONGRATULATIONS!! {{Vendor_name}}, {{product_name}} SOLD.")
	# end
	def sold_notification_to_winner(user,auction)
		@user     = user
		@auction  = auction
		@product   = @auction.variant.product
		@user_name = @user.name_by_email
		mail(to: '@winner_email' , subject: "CONGRATULATIONS! #{@user_name}, Nice Swipe UP.")
	end
	def sold_notification_to_superadmin(order)
		user            =  order.user
		auction         =  order.auction
		@product        =  auction.variant.product
		@vendor         =  @product.vendor
		@user_name      =  user.name_by_email
		@order          =  order
		@admin_emails   =  admin_emails
		mail(to: @admin_emails , subject: "DROPIT ORDER ALERT! #{@vendor.name}, #{@product.name} SOLD.")

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