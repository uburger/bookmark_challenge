class Bookmark
  attr_reader :all_bookmarks

  def all
    connection = PG.connect(dbname: 'bookmark_manager') 
    result = connection.exec('SELECT * FROM bookmarks;')
    result.map { |bookmark| bookmark['url']}
  end
end
