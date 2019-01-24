class CreateSpreeEmailContents < ActiveRecord::Migration[5.2]
  def up
    create_table :spree_email_contents do |t|
      t.string :reason
      t.integer :module_name
      t.text :template
      t.timestamps
    end
  end

  def down
    drop_table :spree_email_contents
  end
end
