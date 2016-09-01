class ResourcesController < ApplicationController
    def index
      @course = Course.where(params[:course_id])

      #where(<columnname> => <columnvalue>)
      @resources = Resource.all
   end
   
   def new
      @resource = Resource.new
      #redirect_to(url_for(subject_course_resources_path(@resources)))

      redirect_to(url_for(subject_course_resources_path(@resource)))
   end
   
   def create
      @resource = Resource.new(resource_params)
      
      if @resource.save
         

         redirect_to resources_path, notice: "The Resource #{@resource.name} has been uploaded."
      else
         render "new"
      end
      
   end
   
   def destroy
      @resource = Resource.find(params[:id])
      @resource.destroy
      redirect_to resources_path, notice:  "The Resource #{@resource.name} has been deleted."
   end
   
   private
      def resource_params
      params.require(:resource).permit(:name, :attachment)
   end
   
end