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
		respond_to do |format|
     format.json { render :json => @project.id }
    end
	end

	def update
		@project = Project.find(params[:id])
		@project.update(project_params)

		render nothing: true
	end

  def sorting
    tasks = Task.all
    tasks.each do |t|
      t.position = params[:task].index(t.id.to_s) + 1
      t.save
    end
  end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy

		render nothing: true
	end

	private
		def project_params
			params.require(:project).permit(:title)
		end
end