
require 'database_helpers'
require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.add(url: 'http://www.makersacademy.com', title: 'Favourite Academy' )
      Bookmark.add(url: 'http://www.destroyallsoftware.com', title: 'Favourite destruction'  )
      Bookmark.add(url: 'http://www.google.com', title: 'Favourite search engine')
      # connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Favourite Academy');")
      # connection.exec("INSERT INTO bookmarks (title, url) VALUES('Favourite destruction', 'http://www.destroyallsoftware.com');")
      # connection.exec("INSERT INTO bookmarks (title, url) VALUES('Favourite search engine', 'http://www.google.com');")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
       expect(bookmarks.first).to be_a Bookmark
       expect(bookmarks.first.id).to eq bookmark.id
       expect(bookmarks.first.title).to eq 'Favourite Academy'
       expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.add' do
    it 'allows us to add bookmarks' do
      bookmark = Bookmark.add(title: 'Favourite shop', url: 'http://www.amazon.com')
      # persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Favourite shop'
      expect(bookmark.url).to eq 'http://www.amazon.com'
    end
  end
end
