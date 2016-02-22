# As a user
# So that I don't have to type long URLs
# I want to enter a long URL and get a shortened version back

feature 'Providing shortened urls' do
  scenario 'when url is entered in form' do
    allow(SecureRandom).to receive(:base64).and_return('random')
    visit '/links/new'
    fill_in 'url', with: 'https://www.google.co.uk/#q=I+need+a+url+shortener'
    click_button 'Shorten'

    expect(page).to have_selector('#short-url', text: 'http://localhost:9292/random')
  end

  scenario 'when a different url is entered in form' do
    allow(SecureRandom).to receive(:base64).and_return('different')
    visit '/links/new'
    fill_in 'url', with: 'https://www.google.co.uk/#q=And+now+for+something+completely+different'
    click_button 'Shorten'

    expect(page).to have_selector('#short-url', text: 'http://localhost:9292/different')
  end
end
