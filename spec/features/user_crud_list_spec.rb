require 'rails_helper'

feature 'User crud list' do
  scenario 'successfully create a new to do' do
    user = User.create(
      email: 'eu@mail.com',
      password: '123456'
      )
    list = List.new( description: 'teste' )

    login_as(user, :scope => :user)
    visit new_list_path
    fill_in 'Description', with: list.description

    expect(page).to have_content(list.description)
    expect(page).to have_content("Owner: #{list.user.email}")
  end

  scenario 'fail to create a new to do' do
    user = User.create(
      email: 'eu@mail.com',
      password: '123456'
      )
    list = List.new( description: ' ' )

    login_as(user, :scope => :user)
    visit new_list_path
    fill_in 'Description', with: list.description

    expect(page).to have_content("can't be blank")
  end

  scenario "fail to see another user's lists" do
    user = User.create(
      email: 'eu@mail.com',
      password: '123456'
    )
    user_two = User.create(
        email: 'outro@mail.com',
        password: '123456'
    )
    list = List.create( description: 'teste', user: user_two.id )

    login_as(user, :scope => :user)
    visit lists_path

    expect(page).to_not have_content(list.description)
    expect(page).to_not have_content("Owner: #{list.user.email}")
    expect(page).to have_content("user: #{user.email}")
  end
end
