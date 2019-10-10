feature 'Delete bookmark' do
  scenario 'allows user to delete a bookmark' do
    Bookmark.add(url: 'http://www.amazon.com', title: 'Favourite shop')
    visit('/bookmarks')
    fill_in(:title, with: 'Favourite shop')
    click_button('Delete')
    expect(page).not_to have_content('Favourite shop')
  end
end