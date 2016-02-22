# As a user
# So that I don't have to type long URLs
# I want to enter a long URL and get a shortened version back

feature 'Providing shortened urls' do
  scenario 'when url entered in form' do
    visit '/links/new'
    fill_in 'url', with: 'https://www.google.co.uk/#q=I+need+a+url+shortener'
    click_button 'Shorten'
    expect(page).to have_selector('#short_link', text: 'http://localhost:9292/random')
  end
end
