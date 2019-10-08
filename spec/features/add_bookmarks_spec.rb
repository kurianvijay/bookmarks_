# frozen_string_literal: true

feature 'add bookmarks' do
  scenario 'allows a user to add a bookmark' do
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    visit('/bookmarks/new')
    fill_in :url, with: 'http://www.amazon.com'
    click_button 'Submit'
    expect(page).to have_content('http://www.amazon.com')
  end
end
