class ProjectsController < ApplicationController

	http_basic_authenticate_with name: "den", password: "secret", except: [:index, :show]

	def index
		@projects = Project.order("id").all
		@project = Project.new
		@task = Task.new
	end

	def create
		@project = Project.new(project_params)

		@project.save
		redirect_to projects_path
	end

	def update
		@project = Project.find(params[:id])
		@project.update(project_params)

		redirect_to projects_path
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy

		redirect_to projects_path
	end

	private
		def project_params
			params.require(:project).permit(:title)
		end
end