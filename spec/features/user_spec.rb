require 'rails_helper'

feature "User do", js: true do 

  before do
    @user = create(:user)
    @project = create(:project, user_id: @user.id)
    @task = create(:task, project_id: @project.id)
    @password = Faker::Internet.password(8)
    login_as(@user, password: @password)
    @tmp_name = Faker::Lorem.word
    @tmp_email = Faker::Internet.email
  end

  scenario "User can add todo list" do
    visit(projects_path)
    click_on('Add TODO List')
    fill_in("project_title", with: @tmp_name)
    click_button("OK")
    expect(page).to have_content(@tmp_name)
  end

  scenario "User can update task" do
    visit(projects_path)
    find(".edit_project_img", visible: false).trigger('click')
    fill_in("project[title]", with: '123456789')
    click_on("OK")
    expect(page).to have_content('123456789')
  end

  scenario "User can delete project" do
    visit(projects_path)
    find(".delete_project_img", visible: false).trigger('click')
    page.save_screenshot('screenshot.png')
    expect(page).to_not have_selector(".project")
  end

  scenario "User can add task" do
    visit(projects_path)
    fill_in("task[title]", with: @tmp_name)
    fill_in("task[date]", with: Date.today)
    click_button("Add Task")
    expect(page).to have_content(@tmp_name)
  end

  scenario "User can rename task" do
    visit(projects_path)
    find(".edit_task_img_hover", visible: false).trigger('click')
    within "ul" do
      fill_in("task[title]", with: @tmp_name)
      fill_in("task[date]", with: '2015-06-20')
      page.save_screenshot('screenshot.png')
      click_button("OK")
    end
    expect(page).to have_content(@tmp_name)
  end

  scenario "User can delete task" do
    visit(projects_path)
    find(".delete_task_img_hover", visible: false).trigger('click')
    page.save_screenshot('screenshot.png')
    expect(page).to_not have_selector("li")
  end

  scenario "User sign up" do
    visit('http://localhost:3000/users/sign_up')
    fill_in("user_email", with: @tmp_email)
    fill_in("user_password", with: @password)
    fill_in("user_password_confirmation", with: @password)
    click_button("Sign up")
    expect(page).to have_selector(".projects")
    page.save_screenshot('screenshot.png')
  end

end