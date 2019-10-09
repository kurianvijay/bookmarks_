feature '.add bookmarks' do
  scenario 'allows a user to add a bookmark' do
    visit('/bookmarks/new')
    fill_in :url, with: 'http://www.amazon.com'
    fill_in :title, with: 'Favourite shop'
    click_button 'Submit'
    expect(page).to have_link('Favourite shop', href: 'http://www.amazon.com')
  end
end
