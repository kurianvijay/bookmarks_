feature '.add bookmarks' do
  # -> Why is this feature test  not adding anything to the test DB?
  # -> Why are we not starting the test DB here again?
  scenario 'allows a user to add a bookmark' do
    visit('/bookmarks/new')
    fill_in :url, with: 'http://www.amazon.com'
    click_button 'Submit'
    expect(page).to have_content('http://www.amazon.com')
  end
end
