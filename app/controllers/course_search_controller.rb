class CourseSearchController < ApplicationController
  def index
  	@subjects = Subject.all
  	@courses = Course.where("subject_id = ?", Subject.first.id)
  end
  
  def show
  	@course = Course.find_by("id = ?", params[:trip][:course_id])
  end
  
  def update_courses
  	@courses = Course.where("subject_id = ?", params[:subject_id])
  	respond_to do |format|
  		format.js
  	end
  end


end

