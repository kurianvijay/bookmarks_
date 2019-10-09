

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    Bookmark.add(title: 'Favourite Academy', url: 'http://www.makersacademy.com')
    Bookmark.add(title: 'Favourite destruction', url: 'http://www.destroyallsoftware.com')
    Bookmark.add(title: 'Favourite search engine', url: 'http://www.google.com')

    visit('/bookmarks')

    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
    expect(page).to have_content 'http://www.google.com'
  end
end
