require 'features_helper'

describe 'Visit Registration Page' do
  before do
    visit '/registration'
  end
  it 'has sign_up_form' do
    expect(page).to have_selector(:xpath, '//form[@action="/registration/create"]')
  end

  it 'has email text field' do
    expect(page).to have_selector(:xpath, '//form//input[@type="email" and @name="sign_up[email]"]')
  end

  it 'has display_name text field' do
    expect(page).to have_selector(:xpath, '//form//input[@type="text" and @name="sign_up[display_name]"]')
  end

  it 'has password field' do
    expect(page).to have_selector(:xpath, '//form//input[@type="password" and @name="sign_up[password]"]')
  end

  it 'has password confirmation field' do
    expect(page).to have_selector(:xpath, '//form//input[@type="password" and @name="sign_up[password_confirmation]"]')
  end
end