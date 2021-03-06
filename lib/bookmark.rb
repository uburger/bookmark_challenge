class Bookmark
  attr_reader :all_bookmarks

  def all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test') 
    else
      connection = PG.connect(dbname: 'bookmark_manager') 
    end
    result = connection.exec('SELECT * FROM bookmarks;')
    result.map { |bookmark| bookmark['url'] }
  end

  def create(url:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
  
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  end
end
