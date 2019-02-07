class TranslateSpreeEmailContents < ActiveRecord::Migration[5.2]
  def  up 
	  Spree::EmailContent.create_translation_table! :subject =>  :string ,  :template => :text 
	end

	def  down 
	  Spree::PageContent.drop_translation_table! 
	end
end
