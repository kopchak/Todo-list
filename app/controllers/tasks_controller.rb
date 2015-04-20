class TasksController < ApplicationController

	http_basic_authenticate_with name: "den", password: "secret", only: :destroy

	def create
		@project = Project.find(params[:project_id])
		@task = @project.tasks.create(task_params)
		redirect_to projects_path
	end

	def destroy
		@project = Project.find(params[:project_id])
		@task = @project.tasks.find(params[:id])
		@task.destroy
		redirect_to projects_path
	end

	private
		def task_params
			params.require(:task).permit(:title, :date)
		end
end