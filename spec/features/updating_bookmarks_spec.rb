feature '.update bookmarks' do
  scenario 'allows a user to update a bookmark' do
    bookmark = Bookmark.add(url: 'http://www.amazon.com', title: 'Favourite shop')
    visit('/bookmarks')
    expect(page).to have_link('Favourite shop', href: 'http://www.amazon.com')

    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('url' , with: 'http://www.amazon.co.uk')
    fill_in('title' , with: 'prime')
    click_button 'Submit'

    expect(current_path).to eq "/bookmarks"
    expect(page).not_to have_link('Favourite shop', href: 'http://www.amazon.com')
    expect(page).to have_link('prime', href: 'http://www.amazon.co.uk')
  end
end
