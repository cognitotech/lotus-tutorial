require 'features_helper'

describe 'Visit Home Page' do
  it 'has title Lotus Tutorial' do
    visit '/'
    expect(page).to have_content('Lotus Tutorial')
  end

  context 'user has not signed in' do
    before do
      visit '/'
    end
    it 'has login form' do
      expect(page).to have_selector("form#login-form")
      expect(page).to have_selector('form#login-form input#email')
      expect(page).to have_selector('form#login-form input#password[type=password]')
    end

    it 'has "Please sign in to see your tweets" sentence' do
      expect(page).to have_content("Please sign in to see your tweets")
    end

    it 'has Sign Up button' do
      expect(page).to have_link('Sign Up')
    end
  end
end