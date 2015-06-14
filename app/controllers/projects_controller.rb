class ProjectsController < ApplicationController
  respond_to :html, :js

	def index
		@projects = current_user.projects
		@project = Project.new
		@task = Task.new
	end

	def create
		#binding.pry
		@project = current_user.projects.new(project_params)
		@projects = current_user.projects
		@task = Task.new
		@project.save
	end

	def update
		@project = current_user.projects.find(params[:id])
		@projects = current_user.projects
		@project.update(project_params)
		@task = @project.tasks.new
		@project.save
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