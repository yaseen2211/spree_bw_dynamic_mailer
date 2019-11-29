module Spree
  class EmailContent < Spree::Base

  	# translates :subject, :template, fallbacks_for_empty_translations: true
  	# include SpreeGlobalize::Translatable
  	scope :finder, -> (reason,module_name) {where("reason =? AND module_name =?", reason , module_name)}
  end
end
