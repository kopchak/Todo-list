class ProjectsController < ApplicationController
  respond_to :html, :js

	def index
		@projects = current_user.projects
		@project = Project.new
		@task = Task.new
	end

	def create
		@projects = current_user.projects
		@project = current_user.projects.new(project_params)
		@project.save
	end

	def update
		@project = current_user.projects.find(params[:id])
		@project.update(project_params)

		render nothing: true
	end

	def destroy
		@project = current_user.projects.find(params[:id])
		@project.destroy
	end

	private
		def project_params
			params.require(:project).permit(:title)
		end
end