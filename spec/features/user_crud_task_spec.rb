require 'rails_helper'

feature 'User crud task' do
  scenario 'successfully create a new to do' do
    user = User.create(
      email: 'eu@mail.com',
      password: '123456'
      )
    task = Task.new( description: 'teste' )

    login_as(user, :scope => :user)
    visit new_task_path
    fill_in 'Description', with: task.description

    expect(page).to have_content(task.description)
    expect(page).to have_content("Owner: #{task.user.email}")
  end

  scenario 'fail to create a new to do' do
    user = User.create(
      email: 'eu@mail.com',
      password: '123456'
      )
    task = Task.new( description: ' ' )

    login_as(user, :scope => :user)
    visit new_task_path
    fill_in 'Description', with: task.description

    expect(page).to have_content("can't be blank")
  end

  scenario "fail to see another user's tasks" do
    user = User.create(
      email: 'eu@mail.com',
      password: '123456'
    )
    user_two = User.create(
        email: 'outro@mail.com',
        password: '123456'
    )
    task = Task.create( description: 'teste', user: user_two.id )

    login_as(user, :scope => :user)
    visit tasks_path

    expect(page).to_not have_content(task.description)
    expect(page).to_not have_content("Owner: #{task.user.email}")
    expect(page).to have_content("user: #{user.email}")
  end
end
