require 'spec_helper'

feature 'view bookmarks' do
  scenario 'click on page to view bookmarks list' do
    visit '/bookmarks'
    expect(page).to have_content('')
  end
end

describe '.all' do
  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

    bookmarks = Bookmark.new.all

    expect(bookmarks).to include('http://www.makersacademy.com')
    expect(bookmarks).to include('http://www.destroyallsoftware.com')
    expect(bookmarks).to include('http://www.google.com')
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.new.create(url: 'http://www.ford.com')
  
      expect(Bookmark.new.all).to include 'http://www.ford.com'
    end
  end
end
