class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :course_number
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
