require 'rails_helper'

RSpec.feature 'Create post', type: :feature do
  describe 'Creating post by user' do
    before(:each) do
      User.create(username: 'User')
      visit 'session/new'
      fill_in 'username', with: 'User'
      click_button 'Log In'
    end

    it 'should create a new post' do
      fill_in 'post_body', with: 'Hello World!'
      click_button 'Post'
      expect(page).to have_content('Hello World!')
    end
  end
end
