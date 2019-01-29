class AddReasonToEmailContents < ActiveRecord::Migration[5.2]
  def change
  	add_column :spree_email_contents, :reason, :string
  end
end
