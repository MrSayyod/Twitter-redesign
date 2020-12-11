require 'rails_helper'

RSpec.feature 'Follow user', type: :feature do
  # describe
  let(:user1) do
    User.create!(username: 'Harry')
  end

  let(:user2) do
    User.create!(username: 'Ron')
  end

  describe 'Following a user' do
    before(:each) do
      user1
      user2
      visit 'session/new'
      fill_in 'username', with: user1.username
      click_button 'Log In'
      visit '/connect'
    end

    it 'should follow for an unfollowed user' do
      click_link user2.username
      click_button 'Follow'
      expect(page).to have_selector(:link_or_button, 'Unfollow')
    end
  end
end
