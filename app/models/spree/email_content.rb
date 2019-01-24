module Spree
  class EmailContent < Spree::Base
  	enum module_name: [:orders,:products,:welcome,:login,:registeration]
  end
end
