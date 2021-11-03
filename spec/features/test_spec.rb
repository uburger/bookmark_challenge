require 'spec_helper'

feature 'test page' do
  scenario 'view test page' do
    visit '/test'
    expect(page).to have_content('test')
  end
end

feature 'redirect from home to bookmarks' do 
  scenario 'redirect' do 
    visit '/'
    expect(page).to have_current_path('/bookmarks')
  end

end
