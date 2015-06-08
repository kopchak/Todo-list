class TasksController < ApplicationController

	http_basic_authenticate_with name: "den", password: "secret", only: :destroy

	def create
		@project = Project.find(params[:project_id])
		@task = @project.tasks.create(task_params)
		#binding.pry
    respond_to do |format|
     format.json { render :json => @task.id }
    end
	end

	def update
		#binding.pry
		@project = Project.find(params[:project_id])
		@task = @project.tasks.find(params[:id])
		@task.update(task_params)
		render nothing: true
	end

	def sorting
    tasks = Task.all
    tasks.each do |t|
      t.position = params[:task].index(t.id.to_s) + 1
      t.save
    end
    render nothing: true
  end

	def destroy
		#binding.pry
		@project = Project.find(params[:project_id])
		@task = @project.tasks.find(params[:id])
		@task.destroy
		render nothing: true
	end

	private
		def task_params
			params.require(:task).permit(:title, :date)
		end
end