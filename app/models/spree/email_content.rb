module Spree
  class EmailContent < Spree::Base
  	scope :finder, -> (reason,module_name) {where("reason =? AND module_name =?", reason , module_name)}
  end
end
