# spec/features/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :feature do
  before(:each) { visit root_path }

  it 'logined successfully' do
    user = User.new(username: 'johndoe', fullname: 'John Doe')
    user.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-cover.jpg')),
                      filename: 'default-cover.jpg', content_type: 'image/jpg')
    user.save

    fill_in 'session_username', with: 'johndoe'
    find("input[type='submit']").click
    expect(page).to have_content('User successfully logged in')
  end

  it 'cannot login with username that is not signed up' do
    fill_in 'session_username', with: 'johndoe'
    find("input[type='submit']").click
    expect(page).to have_content('Something went wrong...')
  end

  it 'signed up successfully' do
    visit new_user_path
    fill_in 'user_username', with: 'johndoe'
    fill_in 'user_fullname', with: 'john doe'
    attach_file('user_photo', 'app/assets/images/default-cover.jpg')
    find("input[type='submit']").click
    expect(page).to have_content('Account is created')
  end

  it 'logged in and redirected to index page after sucessfull signup' do
    visit new_user_path
    fill_in 'user_username', with: 'johndoe'
    fill_in 'user_fullname', with: 'john doe'
    attach_file('user_photo', 'app/assets/images/default-cover.jpg')
    find("input[type='submit']").click
    expect(page).to have_current_path(root_path)
    expect(page).to have_content('john doe')
  end

  it 'follows another user' do
    user1 = User.new(username: 'johndoe', fullname: 'John Doe')
    user1.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-cover.jpg')),
                       filename: 'default-cover.jpg', content_type: 'image/jpg')
    user1.save

    user2 = User.new(username: 'rachel', fullname: 'Rachel Green')
    user2.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-cover.jpg')),
                       filename: 'default-cover.jpg', content_type: 'image/jpg')
    user2.save

    fill_in 'session_username', with: 'johndoe'
    find("input[type='submit']").click
    visit user_path(user2.id)
    find('a.follow-btn').click
    expect(page).to have_content('You started following')
  end

  it 'unfollows another user' do
    user1 = User.new(username: 'johndoe', fullname: 'John Doe')
    user1.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-cover.jpg')),
                       filename: 'default-cover.jpg', content_type: 'image/jpg')
    user1.save

    user2 = User.new(username: 'rachel', fullname: 'Rachel Green')
    user2.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default-cover.jpg')),
                       filename: 'default-cover.jpg', content_type: 'image/jpg')
    user2.save

    fill_in 'session_username', with: 'johndoe'
    find("input[type='submit']").click
    visit user_path(user2.id)
    find('a.follow-btn').click
    find('a.unfollow-btn').click
    expect(page).to have_content('You unfollowed')
  end
end
