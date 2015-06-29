require 'rails_helper'

describe TasksController do

  before do
    @user = create(:user)
    @project = create(:project)
    @task = create(:task)
  end

  context 'create action' do
    
    it 'create task' do
      post :create, {project_id: @project.id, title: @task.title, date: @task.date}
      expect response.status == 200
    end

    it 'validate task' do
      post :create, {project_id: @project.id, title: @task.title = nil, date: @task.date = nil}
      expect(@task).to_not be_valid
    end

  end

  context 'update action' do

    it 'update task' do
      patch :update, {project_id: @project.id, id: @task.id, title: @task.title = '12345566', date: @task.date}
      expect response.status == 200
    end

    it 'not valid update task' do
      patch :update, {project_id: @project.id, id: @task.id, title: @task.title = nil, date: @task.date = nil}
      expect(@task).to_not be_valid
    end

  end

  context 'destroy action' do

    it 'delete successfully' do
      delete :destroy, {project_id: @project.id, id: @task.id}
      expect response.status == 200
    end

    it 'delete does not exist task' do
      delete :destroy, {project_id: @project.id, id: 0}
      expect response.status == 404
    end
    
  end

end