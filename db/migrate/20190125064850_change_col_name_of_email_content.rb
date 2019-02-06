class ChangeColNameOfEmailContent < ActiveRecord::Migration[5.2]
  def change
  	rename_column :spree_email_contents, :reason, :subject
	change_column :spree_email_contents, :module_name, :string
  end
end


