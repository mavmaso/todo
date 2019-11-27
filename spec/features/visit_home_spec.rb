require 'rails_helper'

feature 'Visit home' do
  scenario 'perfect' do
    visit root_path

    expect(page).to have_content('Index')
  end
end