

require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (title, url) VALUES ('Favourite Academy', 'http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (title, url) VALUES('Favourite destruction', 'http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (title, url) VALUES('Favourite search engine', 'http://www.google.com');")

      bookmarks = Bookmark.all #==>let(:bookmarks) { Bookmark.all }

      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('Favourite Academy')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.google.com')
    end
  end

  describe '.add' do
    it 'allows us to add bookmarks' do
      Bookmark.add(title: 'Favourite shop', url: 'http://www.amazon.com')
      expect(Bookmark.all).to include('http://www.amazon.com')
      expect(Bookmark.all).to include('Favourite shopping site')
    end
  end
end
