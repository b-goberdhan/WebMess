class ModifyUser < ActiveRecord::Migration
  def change
  	add_column :users, :email_checked, :boolean
  end
end
