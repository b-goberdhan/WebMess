class AddEmailValidationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_validation, :string
  end
end
