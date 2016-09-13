class ResourcesController < ApplicationController
    def index
      #where(<columnname> => <columnvalue>)
      @resources = Resource.all
      @resources = @resources.course_id(params[:course_id]) if params[:course_id].present?
   end
   
   def new
      @resource = Resource.new
   end
   def create
      @resource = Resource.new(resource_params)
      @resource.course_id = params[:course_id]
      
      if @resource.save
         

         redirect_to subject_course_resources_path, notice: "The Resource #{@resource.name} has been uploaded."
      else
         render "new"
      end
      
   end
   
   def destroy
      @resource = Resource.find(params[:id])
      @resource.destroy
      redirect_to subject_course_resources_path, notice:  "The Resource #{@resource.name} has been deleted."
   end
   
   private
      def resource_params
      params.require(:resource).permit(:name, :attachment)
   end
   
end