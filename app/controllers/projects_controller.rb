class ProjectsController < ApplicationController

	http_basic_authenticate_with name: "den", password: "secret", except: [:index, :show]

	def index
		@projects = Project.all
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)

		@project.save
		redirect_to projects_path		
	end

	def update
		@project = Project.find(params[:id])

		if @project.update(project_params)
			redirect_to @project
		else
			render 'edit'
		end
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
