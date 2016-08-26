class AddCourseToResources < ActiveRecord::Migration
  def change
    add_reference :resources, :course, index: true, foreign_key: true
  end
end
