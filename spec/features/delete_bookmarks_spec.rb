# frozen_string_literal: true

feature 'Delete bookmark' do
  scenario 'allows user to delete a bookmark' do
    Bookmark.add(url: 'http://www.amazon.com', title: 'Favourite shop')
    visit('/bookmarks')
    expect(page).to have_link('Favourite shop', href: 'http://www.amazon.com')
    first('.bookmark').click_button('Delete') #-> first is a capybara feature to call the
    # first item added, .bookmark here refers to the CSS class bookmark rather than the
    # ruby class
    expect(page).not_to have_link('Favourite shop', href: 'http://www.amazon.com')
  end
end
