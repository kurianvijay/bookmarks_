feature 'add bookmarks' do
  scenario 'allows a user to add a bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    visit('/')
    click_button 'add'
    fill_in :new_bookmark, with: 'http://www.amazon.com'
    click_button 'Submit'
    expect(page).to have_content("Bookmark successfully added!")
  end
end
