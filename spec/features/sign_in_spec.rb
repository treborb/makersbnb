feature 'Sign in' do
  xscenario 'I cannot sign in if I have not signed up' do
    sign_in
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content('The email or password entered is incorrect')
  end
  scenario 'I can sign in (once I have signed up)' do
    sign_up
    sign_out
    sign_in
    expect(current_path).to eq '/'
    expect(page).to have_content('Welcome, test')
  end
  xscenario 'I cannot sign in if I enter my email incorrectly' do
    sign_up
    sign_in(email: 'something@something.com')
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content('The email or password entered is incorrect')
  end
  xscenario 'I cannot sign in if I enter my password incorrectly' do
    sign_up
    sign_in(password: 'something')
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content('The email or password entered is incorrect')
  end
end