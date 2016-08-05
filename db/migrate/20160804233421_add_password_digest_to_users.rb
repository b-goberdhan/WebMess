class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
  	remove_column("users","confirm_password")
  	add_column("users", "password_digest", :string)
  end
end
