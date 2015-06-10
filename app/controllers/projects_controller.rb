class ProjectsController < ApplicationController

	def index
		@projects = current_user.projects
		@project = Project.new
		@task = Task.new
	end

	def create
		@project = current_user.projects.new(project_params)
		@project.save
		respond_to do |format|
     format.json { render :json => @project.id }
    end
	end

	def update
		@project = current_user.projects.find(params[:id])
		@project.update(project_params)

		render nothing: true
	end

	def destroy
		@project = current_user.projects.find(params[:id])
		@project.destroy

		render nothing: true
	end

	private
		def project_params
			params.require(:project).permit(:title)
		end
end