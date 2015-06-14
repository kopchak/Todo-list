class TasksController < ApplicationController
	respond_to :html, :js

	def create
		@project = current_user.projects.find(params[:project_id])
		@task = @project.tasks.create(task_params)
	end

	def update
		#binding.pry
		@project = current_user.projects.find(params[:project_id])
		@task = @project.tasks.find(params[:id])
		@task.update(task_params)
	end

	def sorting
		#binding.pry
		@project = current_user.projects.find(params[:project_id])
    @project.tasks.each do | task |
      task.position = params[:task].index(task.id.to_s)+1
      task.save
    end
    render nothing: true
  end

	def destroy
		@project = current_user.projects.find(params[:project_id])
		@task = @project.tasks.find(params[:id])
		@task.destroy
	end

	private
		def task_params
			params.require(:task).permit(:title, :date, :status)
		end
end