require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_length_of(:username).is_at_least(2) }
    it { should validate_uniqueness_of(:username) }
  end

  describe 'associations' do
    it { should have_many(:posts) }
    it { should have_many(:active_relationships).with_foreign_key(:follower_id).class_name('Followship') }
    it { should have_many(:passive_relationships).with_foreign_key(:followed_id).class_name('Followship') }
    it { should have_many(:following).through(:active_relationships).source(:followed) }
    it { should have_many(:followers).through(:passive_relationships).source(:follower) }
  end

  describe 'user class methods' do
    before(:each) do
      @user1 = User.create!(username: 'Harry')
      @user2 = User.create!(username: 'Ron')
    end

    describe 'followship' do
      it 'checks if current user has any followers' do
        expect(@user1.following?(@user2)).to eq(false)
      end
    end
  end

  # let(:user) do
  #   User.create(
  #     email: 'user@example.com',
  #     name: 'User',
  #     password: '123456',
  #     password_confirmation: '123456'
  #   )
  # end

  # let(:user2) do
  #   User.create(
  #     email: 'friend@example.com',
  #     name: 'Friend',
  #     password: '123456',
  #     password_confirmation: '123456'
  #   )
  # end

  # describe 'validations' do
  #   it 'should not be valid without a name' do
  #     user.name = nil
  #     expect(user).to_not be_valid
  #   end

  #   it 'should have a name less than 20 characters' do
  #     user3 = User.create(name: 'a' * 21)

  #     expect(user).to be_valid
  #     expect(user3).to_not be_valid
  #   end
  # end

  # describe 'associations' do
  #   it 'can have many posts' do
  #     expect(user).to respond_to(:posts)
  #   end

  #   it 'can have many comments' do
  #     expect(user).to respond_to(:comments)
  #   end

  #   it 'can have many likes' do
  #     expect(user).to respond_to(:likes)
  #   end

  #   it 'can send friend request to other users' do
  #     user.send_friend_request(user, user2)
  #     friend_request = user2.friend_requests
  #     expect(friend_request.empty?).to be false
  #   end

  #   it 'cand have pending friendships' do
  #     user.send_friend_request(user, user2)
  #     pending_request = user.pending_friends

  #     expect(pending_request.empty?).to be false
  #   end

  #   it 'can confirm friend requests' do
  #     user.send_friend_request(user, user2)
  #     user2.confirm_friendship(user)
  #     friendship = user2.friends

  #     expect(friendship.empty?).to eq(false)
  #   end

  #   it 'can reject friend requests' do
  #     user.send_friend_request(user, user2)
  #     user2.reject_friend_request(user)
  #     friendship = user2.friends

  #     expect(friendship.empty?).to eq true
  #   end

  #   it 'should return true if users are friends' do
  #     user.send_friend_request(user, user2)
  #     user2.confirm_friendship(user)
  #     friends = user.friend?(user2)

  #     expect(friends).to eq true
  #   end
  # end
end
