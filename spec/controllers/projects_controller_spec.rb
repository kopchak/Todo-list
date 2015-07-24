require 'rails_helper'

describe ProjectsController do

  before do
    @user = create(:user)
    @project = create(:project)
    @task = create(:task)
  end

  context '#index' do
    
    it 'create project' do
      get :index, id: @project.id
      expect response.status == 200
    end

    it 'create task' do
      get :index, id: @task.id
      expect response.status == 200
    end

  end

  context '#create' do

    it 'post project' do
      post :create, @project.title
      expect response.status == 200
    end

    it 'validate project' do
      post :create, title: @project.title = nil
      expect(@project).to_not be_valid
    end

  end

  context '#update' do

    it 'update successfully' do
      patch :update, id: @project.id, title: @project.title = 'asdfgh'
      expect response.status == 200
    end

    it 'empty update' do
      patch :update, {id: @project.id, title: ''}
      expect(@project.title).to_not eq ''
    end

  end

  context '#destroy' do

    it 'delete successfully' do
      delete :destroy, id: @project.id
      expect response.status == 200
    end

    it 'delete does not exist project' do
      delete :destroy, id: 0
      expect response.status == 404
    end

  end
end