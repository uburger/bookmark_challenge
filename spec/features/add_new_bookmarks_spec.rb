require 'spec_helper'

feature 'add a new bookmark' do 
  scenario 'add a new bookmark' do 
    visit '/add_bookmark'
    fill_in 'bookmark', with: 'http://www.ford.com'
    click_button 'Submit'

    expect(page).to have_content('http://www.ford.com')
  end
end
