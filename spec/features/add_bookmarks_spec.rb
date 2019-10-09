feature '.add bookmarks' do
  scenario 'allows a user to add a bookmark' do
    visit('/bookmarks/new')
    fill_in :url, with: 'http://www.amazon.com'
    fill_in :title, with: 'Favourite shopping site'
    click_button 'Submit'
    expect(page).to have_content('http://www.amazon.com')
  end
end
