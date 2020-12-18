require 'rails_helper'

RSpec.feature 'Create post', type: :feature do
  let(:user) do
    User.create(
      username: 'User'
    )
  end
  let(:post) do
    Post.new(body: 'This is a post', user_id: user.id)
  end
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

    it 'shows an error when try to post empty content' do
      fill_in 'post_body', with: ''
      click_button 'Post'
      expect(page).to have_content('Body can\'t be blank')
    end
  end
end

RSpec.feature 'Create post', type: :feature do
  let(:user) do
    User.create(
      username: 'User'
    )
  end
  let(:post) do
    Post.new(body: 'This is a post', user_id: user.id)
  end
  describe 'validations' do
    it 'should not be valid without a content' do
      post.body = nil
      expect(post).to_not be_valid
    end

    it 'should have a content less than 280 characters' do
      post2 = Post.create(body: 'a' * 1001, user_id: user.id)
      expect(post2).to_not be_valid
    end
  end
end
