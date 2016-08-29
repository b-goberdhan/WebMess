class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column "username", :string
      t.string "faculty", :limit => 50
      t.string "major", :limit => 50
      t.string "email", :default => "", :null => false
      t.string "password", :limit => 40
      t.timestamps null: false

    end
  end
end
