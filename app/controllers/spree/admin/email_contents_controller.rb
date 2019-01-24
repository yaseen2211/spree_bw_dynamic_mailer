module Spree
  module Admin
    class EmailContentsController < ResourceController
      def index
        @email_contents = Spree::EmailContent.page(params[:page] || 1).per(50)
      end
    end
  end
end
