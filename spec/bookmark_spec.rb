require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all #==>let(:bookmarks) { Bookmark.all }

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end

  # describe '.add' do
  #   it 'allows us to add bookmarks' do
  #     bookmarks = Bookmark.add
  #     expect(bookmarks).to include("http://www.netflix.com")
  #   end
  # end
end
