require 'pg'

class Bookmark
  def self.all
    # [
    #   "http://www.makersacademy.com",
    #   "http://www.destroyallsoftware.com",
    #   "http://www.google.com"
    #  ]
    connection = PG.connect(dbname: 'bookmark_manager')
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }
  end

  # def self.add
  #   connection = PG.connect(dbname: 'bookmark_manager')
  #   result = connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.netflix.com')")
  #   # result.map { |bookmark| bookmark['url'] }
  # end

end
