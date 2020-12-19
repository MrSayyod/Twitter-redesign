require 'rails_helper'

RSpec.feature 'Authentication', type: :feature do
  describe 'logging in the user' do
    before(:each) do
      User.create(username: 'User')
      visit 'session/new'
      fill_in 'username', with: 'User'
      click_button 'Log In'
    end

    it 'should log in the user' do
      expect(page).to have_content('User')
    end

    it 'logs out the user' do
      click_link 'Sign out'
      expect(page).to have_content 'Sign in'
    end
  end
end
