require 'spec_helper'

feature 'view bookmarks' do
  scenario 'click on page to view bookmarks list' do
    visit '/bookmarks'
    expect(page).to have_content('https://makers.tech')
  end
end
