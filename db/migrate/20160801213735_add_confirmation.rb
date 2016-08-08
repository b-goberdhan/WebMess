class AddConfirmation < ActiveRecord::Migration
  def change
  	add_column("users","confirm_password", :string, :limit=>100)
  end
end
